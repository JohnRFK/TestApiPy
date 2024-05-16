USE NTGroupTest;

CREATE TABLE companies (
    company_id VARCHAR(24) NOT NULL PRIMARY KEY,
    company_name VARCHAR(130)
);

CREATE TABLE changes (
    id VARCHAR(24) PRIMARY KEY NOT NULL,
    amount DECIMAL(16, 2) NOT NULL,
    status VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    company_id VARCHAR(24) NOT NULL,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);