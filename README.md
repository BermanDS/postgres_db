## PostgreSQL with PGadmin from Docker

Define .env from .env.example with correct credentials settings

Creating for PostgreSQL directory for data and logs
for PGadmin - directory for data
```bash
_node > mkdir /var/pglogs
_node > chmod -R 777 /var/pglogs
_node > mkdir /var/pgdata
_node > chmod -R 777 /var/pgdata
_node > mkdir /var/pgadmin_logs
_node > chmod -R 777 /var/pgadmin_logs
```
Building by using docker-compose:

```bash
node > docker-compose -f docker-compose.yml up --build -d
```

After building images you can use PGadmin or internal terminal of PostgreSQL container for defining 
batabases, roles and tables.

Example of scripts in sql_scripts