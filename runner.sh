
psql -h localhost -p 5432 -U postgres -d postgres --command "create database cars;"
psql -h localhost -p 5432 -U postgres -d cars -f schema.sql
psql -h localhost -p 5432 -U postgres -d cars -f data.sql
