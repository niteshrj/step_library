psql -f ./create_schema.sql
psql -v p=$PWD -f insert.sql
psql -f ./views.sql
