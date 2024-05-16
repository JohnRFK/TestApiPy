-- Decidí usar MySQL para este proyecto debido a que es un gestor de base de datos que he estado manejando por mucho tiempo, 
-- además de ser muy generoso al momento de exportar archivos csv grandes por medio de la consola.
-- Este script se creará automáticamente una vez que se cree el contenedor en Docker
USE NTGroupTest;

-- crearé una tabla genérica con valores varchar determinados para que sea sencillo su importación  
CREATE TABLE Compras(
    id VARCHAR(50),
    company_name VARCHAR(100),
    company_id VARCHAR(50),
    amount VARCHAR(50),
    status VARCHAR(50),
    created_at VARCHAR(50),
    updated_at VARCHAR(50)
);

-- Aquí determinamos de qué ruta se va a importar nuestro csv, hacia qué tabla se va a importar, las reglas como los campos separados por comas
-- si los datos no están delimitados de forma opcional
-- y las filas que terminan con un salto de línea, se ignora la cabecera. Posteriormente si existen campos vacíos, se le condicionará que sean rellenados
-- con valores nulos
LOAD DATA INFILE '/var/lib/mysql-files/data_prueba_tecnica.csv'
INTO TABLE Compras
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, @vcompany_name, company_id, amount, status, created_at, @vupdated_at)
SET company_name = NULLIF(@vcompany_name, ''),
updated_at = NULLIF(@vupdated_at, '');
