USE NTGroupTest;
CREATE TABLE cargos(
    id VARCHAR(40) NOT NULL,
    company_name VARCHAR(130) NULL,
    company_id VARCHAR(40) NOT NULL,
    amount DECIMAL(16,2)NOT NULL,
    status VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NULL
);

LOAD DATA INFILE '/var/lib/mysql-files/data_prueba_tecnica.csv'
INTO TABLE cargos
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, @vcompany_name, company_id, amount, status, created_at, @vupdated_at)
SET company_name = NULLIF(@vcompany_name, ''),
updated_at = NULLIF(@vupdated_at, '');