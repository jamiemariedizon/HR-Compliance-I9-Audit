
-- HR Compliance & I-9 Audit
-- Create audit findings table

CREATE TABLE IF NOT EXISTS audit_findings (
    finding_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    i9_id INTEGER NOT NULL,
    finding_type VARCHAR(100) NOT NULL,
    risk_level VARCHAR(20),
    finding_date DATE,
    resolution_status VARCHAR(30),
    resolution_date DATE,

    CONSTRAINT fk_i9
        FOREIGN KEY (i9_id)
        REFERENCES i9_records(i9_id)
);
