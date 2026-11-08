
-- HR Compliance & I-9 Audit
-- View: Flagged I-9 Records by Department

CREATE OR REPLACE VIEW vw_i9_flagged_by_department AS

SELECT
    e.department,
    COUNT(DISTINCT i.i9_id) AS flagged_i9_records

FROM employees e

JOIN i9_records i
    ON e.employee_id = i.employee_id

WHERE
    i.section1_completed_date IS NULL
    OR i.section2_completed_date IS NULL
    OR i.section1_completed_date > i.first_day_of_employment

GROUP BY e.department;

