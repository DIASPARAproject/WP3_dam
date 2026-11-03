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
server ="local"

### load DAMN data
setwd("C:/Users/merk/Desktop/WP1_DataSkriptLokal/WP3_dam/R/")  #lokal, to be changed
EDA_DAMS <- "data/MigFish_EDA_dams.xlsx"     # adjust path if needed
here()
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



