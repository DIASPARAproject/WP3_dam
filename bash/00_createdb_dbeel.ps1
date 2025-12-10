# powershell script

$the_host = "localhost"
$superuser = "postgres"

CREATEDB -U $superuser -h $the_host dbmig


