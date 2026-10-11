# nolint start
# ---------------------------------------------------------------------------
# AMBER salmon river network (Zenodo record 14366637) -> PostgreSQL / PostGIS
#
# 1. Downloads all files using the Zen4r packages
# 2. Checks md5 for downloaded parquet files
# 3. Loads each parquet file into its own table in PostGIS, chunk by chunk
#    (one row group at a time, so big files don't have to fit in memory)
#
# Packages: install.packages(c("httr2", "arrow", "DBI", "RPostgres", "blob", "sfarrow", "yaml"))
# ---------------------------------------------------------------------------
# install packages (uncomment to use)

library(httr2)
library(arrow)
library(DBI)
library(RPostgres)
library(sfarrow)
library(purrr)
library(yaml) #to read the conf file at the root
library(zen4R) # zenodo
# ----------------------------- CONFIG --------------------------------------
rootwddam <- "C:/workspace/DIASPARA_WP3_dam/"
doi_amber <- "https://doi.org/10.5281/zenodo.14366637"
dest_dir  <- file.path(rootwpdam,"R/data/zenodo_amber")  # dir for parquet files
schema    <- "habitat_amber"          # target schema in Postgres
SRID      <- 3035L   # CRS of the geometries (ETRS89-LAEA);



# read the conf at the root
 # I have a yaml with the following elements places in rootwpdam
# host: 
# port: 
# dbnamediaspara: 
# userdiaspara: 
# passworddiaspara: 
# dbnamedistant: 
# userdistant: 
# 
# Don't forget to remove from source in .gitignore !!!!!!!!!
conf <- read_yaml(file.path(rootwddam, "credentials.yml"))
PG <- list(
  host     = conf$hostdistant,
  port     = conf$port,
  dbname   = conf$dbnamediaspara,
  user     = conf$userdiaspara,
  password = conf$passworddiaspara
)
# ---------------------------------------------------------------------------

setwd(rootwddam)
dir.create(dest_dir, showWarnings = FALSE, recursive = TRUE)

# ---- 1. list files in the Zenodo record -----------------------------------

z <- get_zenodo(doi= doi_amber)
files <- names(z$files)[grep( "\\.parquet$", names(z$files))]

# this will very conveniently dowload all files
# the timeout argument may be adjusted, 
# (it's an additional arguments passed via ... to ZenodoRecord$downloadFiles)
# Until it was set, the default was 3600, and download failed for big files...
# 
purrr::walk(files, \(x) download_zenodo(
  doi   = doi_amber,
  path  = dest_dir,
  files = x,
  timeout = 118000
))

 
# ---- 2. test md5 -----------------------------------------------------------
test_md5 <- function(zen, file) {
     checksum <- zen$files[[file]]$checksum
     res <- tools::md5sum(file.path(dest_dir, file)) == checksum  
     if (res == FALSE) warning(sprintf("md5 failed for %s", file)) 
     return(res)
  }

test <- map(files, \(x) test_md5(z , x))
stopifnot(all(unlist(test))) # stops here if one file failed !

# ---- 3. load a parquet file into PostGIS ----------------------------------
load_parquet <- function(con, path, table) {
  tbl_id <- DBI::Id(schema = schema, table = table)
  tbl_q  <- dbQuoteIdentifier(con, tbl_id)
  dbExecute(con, paste("DROP TABLE IF EXISTS", tbl_q))

  pf        <- arrow::ParquetFileReader$create(path)
  n_groups  <- pf$num_row_groups
  geom_col  <- NULL
  list_cols <- character()
  n_rows    <- 0

  for (i in seq_len(n_groups)) {
    df <- as.data.frame(pf$ReadRowGroup(i - 1L))   # row groups are 0-based
    names(df) <- tolower(names(df))                # avoid quoted mixed-case columns

    if (i == 1) {
      geom_col <- intersect(c("geom", "geometry"), names(df))[1]
      if (is.na(geom_col)) geom_col <- NULL
      list_cols <- setdiff(names(df)[vapply(df, is.list, logical(1))], geom_col)
    }

    # geometry: WKB -> bytea (converted to a real geometry after the load)
    if (!is.null(geom_col)) {
      df[[geom_col]] <- blob::as_blob(lapply(unclass(df[[geom_col]]), as.raw))
    }

    # list columns (upstream/downstream ids, paths...) -> Postgres array literals
    for (cl in list_cols) {
      df[[cl]] <- vapply(df[[cl]], function(v) {
        v <- unlist(v)
        if (length(v) == 0 || all(is.na(v))) return(NA_character_)
        paste0("{", paste0('"', gsub('(["\\\\])', "\\\\\\1", as.character(v)), '"',
                           collapse = ","), "}")
      }, character(1))
    }

    dbWriteTable(con, tbl_id, df, append = (i > 1), row.names = FALSE)
    n_rows <- n_rows + nrow(df)
    message(sprintf("    row group %d/%d (%s rows so far)", i, n_groups,
                    format(n_rows, big.mark = ",")))
  }

  # convert helper columns to real types
  if (!is.null(geom_col)) {
    dbExecute(con, sprintf(
      "ALTER TABLE %s ALTER COLUMN %s TYPE geometry(Geometry,%d)
         USING ST_SetSRID(ST_GeomFromWKB(%s), %d)",
      tbl_q, dbQuoteIdentifier(con, geom_col), SRID,
      dbQuoteIdentifier(con, geom_col), SRID))
    dbExecute(con, sprintf("CREATE INDEX ON %s USING gist (%s)",
                           tbl_q, dbQuoteIdentifier(con, geom_col)))
  }
  for (cl in list_cols) {
    dbExecute(con, sprintf("ALTER TABLE %s ALTER COLUMN %s TYPE text[] USING %s::text[]",
                           tbl_q, dbQuoteIdentifier(con, cl), dbQuoteIdentifier(con, cl)))
  }
  dbExecute(con, paste("ANALYZE", tbl_q))
  message("  done: ", schema, ".", table, " (", format(n_rows, big.mark = ","), " rows)")
}

# ---- Write tables postgres ------------------------------------------------
con <- dbConnect(RPostgres::Postgres(),
                 host = PG$host, 
                 port = PG$port, 
                 dbname = PG$dbname,
                 user = PG$user, 
                 password = PG$password)
on.exit(dbDisconnect(con), add = TRUE)

dbExecute(con, sprintf("CREATE schema IF NOT EXISTS %s", dbQuoteIdentifier(con, schema)))


# table name = file name without extension and without the trailing date
table_name <- function(key) {
  tolower(sub("_\\d{4}_\\d{2}_\\d{2}$", "", tools::file_path_sans_ext(key)))
}
# table_names <- purrr::map_chr(files, \(x) table_name(x))


for (i in 1: length(files)) {
  f <- files[i]
  message(paste0("\n========== ",files[i]," ==========\n"))
  load_parquet(con, path = file.path(dest_dir, f), table = table_name(f))
}

message("\nAll done.")
# nolint end