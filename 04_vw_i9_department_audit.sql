
-- HR Compliance & I-9 Audit
-- View: I-9 Department Audit Summary

CREATE OR REPLACE VIEW vw_i9_department_audit AS
SELECT
    e.department,
    COUNT(*) AS total_i9_records,

    COUNT(*) FILTER (
        WHERE i.section1_completed_date IS NULL
    ) AS missing_section1,

    COUNT(*) FILTER (
        WHERE i.section2_completed_date IS NULL
    ) AS missing_section2,

    COUNT(*) FILTER (
        WHERE i.section1_completed_date > i.first_day_of_employment
    ) AS late_section1,

    COUNT(*) FILTER (
        WHERE i.reverification_due_date < CURRENT_DATE
          AND e.employment_status = 'Active'
    ) AS potential_overdue_reverification

FROM employees e
JOIN i9_records i
    ON e.employee_id = i.employee_id

GROUP BY e.department;
