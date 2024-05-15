FROM mysql:latest

ENV MYSQL_DATABASE=NTGroupTest
ENV MYSQL_ROOT_PASSWORD=Prueba#001


ADD dataset/data_prueba_tecnica.csv /var/lib/mysql-files/data_prueba_tecnica.csv
COPY sql-scripts/createT.sql /docker-entrypoint-initdb.d/

EXPOSE 3306