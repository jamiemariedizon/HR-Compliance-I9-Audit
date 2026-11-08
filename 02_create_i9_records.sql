
-- HR Compliance & I-9 Audit
-- Create I-9 records table

CREATE TABLE IF NOT EXISTS i9_records (
    i9_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id INTEGER NOT NULL,
    section1_completed_date DATE,
    section2_completed_date DATE,
    first_day_of_employment DATE,
    reverification_due_date DATE,
    i9_status VARCHAR(30),

    CONSTRAINT fk_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(employee_id)
);
