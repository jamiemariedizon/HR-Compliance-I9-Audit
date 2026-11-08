-- HR Compliance & I-9 Audit
-- Create employees table

CREATE TABLE IF NOT EXISTS employees (
    employee_id INTEGER PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(100),
    location VARCHAR(100),
    hire_date DATE NOT NULL,
    employment_status VARCHAR(20)
);
