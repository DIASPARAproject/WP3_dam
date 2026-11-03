# import data from excel
# 
# 
#
library(openxlsx)
library(DBI)

library(readxl)
library(purrr)
library(yaml)
library(here)
library(RPostgres)

#server="distant" 
server = "local"

### load DAMN data
wd <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(wd)  #lokal, to be changed
EDA_DAMS <- "data/MigFish_EDA_dams.xlsx"     # adjust path if needed

sheets <- excel_sheets(EDA_DAMS)
dams <- map(set_names(sheets), ~ read_excel(EDA_DAMS, sheet = .x, guess_max = 1e6))

names(dams)                    # list of all sheets
sapply(dams, nrow)             # rows per sheet
dams$obstruction_place         # access one sheet
dams$obstruction
list2env(dams, envir = .GlobalEnv)


#YML
  #lokal, to be changed
cred <- read_yaml("../credentials.yml")
# con_diaspara <- dbConnect(Postgres(), 
#                            dbname = cred$dbnamehydro,
#                            host = cred$hostmercure,
#                            port = cred$port,
#                            user = cred$usermercure,
#                            password = cred$passwordmercure)

if (server == "distant") {
  con_diaspara <- dbConnect(Postgres(),
                            dbname   = cred$dbnamedistant,
                            host     = cred$hostdistant,
                            port     = cred$distantport,
                            user     = cred$userdistant,
                            password = cred$passworddistant)
} else {
  con_diaspara <- dbConnect(Postgres(),
                            dbname   = cred$dbnamediaspara,
                            host     = cred$host,
                            port     = cred$port,
                            user     = cred$userdiaspara,
                            password = cred$passworddiaspara)
}


# query <- "SELECT op_id_original,
#                 op_placename,
#                  ob_height,
#                  ot.no_code as type,
#                  geom
#           FROM dam_france.obstruction_place op
#           JOIN dam_france.obstruction o
#              ON ob_op_id = op_id
#           JOIN nomenclature.obstruction_type ot
#              ON ob_obstruction_type_no_id = ot.no_id
#           JOIN refeel.tr_area_are are ON
#           st_intersects(st_transform(op.geom, 4326), are.geom_polygon)
#           WHERE are_code = 'FR_Bret'
#           AND ob_ending_date = '2035-01-01'
#           "
# layer <- st_read(dsn = con_diaspara, query = query) |>
         # sf::st_transform(4326)  #to get QGIS geometry
# layer_riv <- st_read(dsn = con_diaspara, query = query2)

DBI::dbWriteTable(
  conn=con_diaspara,
  name=DBI::Id(schema= "dam_de", table = "temp_obstruction_place"),
  value = obstruction_place,
  overwrite=T
)
# clipr::write_clip(colnames(obstruction_place))

DBI::dbGetQuery(con_diaspara, "select * from dam_de.temp_obstruction_place")
obstruction_place_db <- DBI::dbGetQuery(con_diaspara, "select * from dam_de.obstruction_place")


DBI::dbGetQuery(con_diaspara, "select op_op_id_original from dam_de.temp_obstruction_place where op_op_id_original IS NOT NULL")
DBI::dbExecute(con_diaspara, "UPDATE dam_de.temp_obstruction_place set op_water_code = '100000' WHERE op_water_code = '1e+05'")



dbExecute(con_diaspara,
  "INSERT INTO dam_de.obstruction_place(
op_placename,
op_op_id,
op_dp_id,
op_id_original,
op_country,
geom,
op_x,
op_y,
op_state,
op_sourcelayer,
op_idnational,
op_watername,
op_watercode,
op_wfdwaterbody,
op_status)
 SELECT 
op_placename,
NULL AS op_op_id,
\"op_dp_EDMO\",
op_id_original,
op_country,
st_GeomFromText(geom, 3035) AS geom,
op_x,
op_y,
op_bundesland AS op_state,
op_source_layer,
op_id_national::BIGINT,
op_water_name,
op_water_code::BIGINT,
op_wfd_water_body,
op_status_sh
FROM dam_de.temp_obstruction_place") # 130897


DBI::dbDisconnect(con_diaspara)

