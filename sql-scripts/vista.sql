-- Script que crea la vista para visualizar las transacciones por dia de cada compañia

CREATE VIEW transacciones_por_dia AS
SELECT created_at, company_name, SUM(amount) AS total 
FROM changes
INNER JOIN companies ON changes.company_id = companies.company_id
WHERE STATUS LIKE "paid"
GROUP BY created_at, company_name;