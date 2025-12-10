pg_dump  --dbname=postgresql://${env:usermercure}:${env:passmercure}@${env:hostmercure}/diaspara --schema nomenclature --schema-only -f "2_nomenclature_structure.sql"

pg_dump  --dbname=postgresql://${env:usermercure}:${env:passmercure}@${env:hostmercure}/diaspara --schema dam  --schema-only -f "4_dam_structure.sql"
