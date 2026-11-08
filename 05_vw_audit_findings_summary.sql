
-- HR Compliance & I-9 Audit
-- View: Audit Findings Summary by Department

CREATE OR REPLACE VIEW vw_audit_findings_summary AS

SELECT
    e.department,

    COUNT(*) AS total_findings,

    COUNT(*) FILTER (
        WHERE a.resolution_status = 'Resolved'
    ) AS resolved_findings,

    COUNT(*) FILTER (
        WHERE a.resolution_status IS DISTINCT FROM 'Resolved'
    ) AS unresolved_findings,

    COUNT(*) FILTER (
        WHERE a.risk_level = 'High'
          AND a.resolution_status IS DISTINCT FROM 'Resolved'
    ) AS high_risk_unresolved

FROM employees e

JOIN i9_records i
    ON e.employee_id = i.employee_id

JOIN audit_findings a
    ON i.i9_id = a.i9_id

GROUP BY e.department;
