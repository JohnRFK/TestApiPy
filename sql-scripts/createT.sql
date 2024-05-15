USE NTGroupTest;

CREATE TABLE Compras(
    id VARCHAR(50),
    company_name VARCHAR(100),
    company_id VARCHAR(50),
    amount VARCHAR(50),
    status VARCHAR(50),
    created_at VARCHAR(50),
    updated_at VARCHAR(50)
);

LOAD DATA INFILE '/var/lib/mysql-files/data_prueba_tecnica.csv'
INTO TABLE Compras
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, @vcompany_name, company_id, amount, status, created_at, @vupdated_at)
SET company_name = NULLIF(@vcompany_name, ''),
updated_at = NULLIF(@vupdated_at, '');
