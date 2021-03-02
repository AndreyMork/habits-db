FROM postgres:alpine

ENV POSTGRES_DB habits
COPY schema.sql /docker-entrypoint-initdb.d/000-initdb.sql

EXPOSE 5432
