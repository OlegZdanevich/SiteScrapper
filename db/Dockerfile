FROM postgres
ARG dump="db.sql"
COPY ${dump} /docker-entrypoint-initdb.d/init.sql
