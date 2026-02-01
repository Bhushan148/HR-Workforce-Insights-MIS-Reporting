

SET search_path = "Gold";

CREATE OR REPLACE VIEW "Validation KPI By Month" AS
SELECT
    b.month_key AS "Month Key",

    -- V001
    SUM(CASE WHEN headcount_flag = 1 THEN 1 ELSE 0 END)
        AS "Total Active Employees",

    -- V002
    SUM(CASE WHEN hire_flag = TRUE THEN 1 ELSE 0 END)
        AS "New Hires",

    -- V003
    SUM(CASE WHEN exit_flag = TRUE THEN 1 ELSE 0 END)
        AS "Employee Exits",

    -- V004
    (
        SUM(CASE WHEN headcount_flag = 1 THEN 1 ELSE 0 END)
        -
        COALESCE((
            SELECT SUM(CASE WHEN p.headcount_flag = 1 THEN 1 ELSE 0 END)
            FROM "Gold".fact_employee_snapshot p
            WHERE p.month_key = (
                SELECT MAX(m2.month_key)
                FROM "Gold".dim_date_month m2
                WHERE m2.month_key < b.month_key
            )
        ),0)
    ) AS "Net Headcount Change",

    -- V005
    ROUND(AVG(tenure_months)::numeric,1)
        AS "Average Employee Tenure (Months)",

    -- V006
    ROUND(
        100.0 * SUM(CASE WHEN e.confirmation_date IS NOT NULL THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*),0)
    ,1) AS "Confirmation Completed (%)",

    -- V007
    ROUND(
        100.0 * SUM(CASE WHEN exit_flag = TRUE THEN 1 ELSE 0 END)
        / NULLIF(SUM(CASE WHEN headcount_flag = 1 THEN 1 ELSE 0 END),0)
    ,2) AS "Monthly Attrition Rate (%)",

    -- V008
    ROUND(SUM(fte)::numeric,1)
        AS "Total FTE Count",

    -- V009
    SUM(total_comp_amount)
        AS "Total Salary Cost",

    -- V010
    ROUND(
        SUM(total_comp_amount)
        / NULLIF(SUM(CASE WHEN headcount_flag = 1 THEN 1 ELSE 0 END),0)
    ,0) AS "Average Salary Per Employee",

    -- V011
    SUM(CASE WHEN promotion_flag = TRUE THEN 1 ELSE 0 END)
        AS "Promotions",

    -- V012
    SUM(CASE WHEN transfer_flag = TRUE THEN 1 ELSE 0 END)
        AS "Transfers",

    -- V013
    SUM(CASE WHEN manager_change_flag = TRUE THEN 1 ELSE 0 END)
        AS "Manager Changes",

    -- V014
    SUM(CASE WHEN tenure_months < 3 AND headcount_flag = 1 THEN 1 ELSE 0 END)
        AS "New Joiners (< 3 Months)",

    -- V015
    SUM(CASE WHEN headcount_flag = 0 THEN 1 ELSE 0 END)
        AS "Inactive Employees"

FROM "Gold".fact_employee_snapshot b
LEFT JOIN "Gold".dim_employee e
       ON b.employee_key = e.employee_key
GROUP BY b.month_key;


Select * from "Validation KPI By Month"
order by "Month Key";


SELECT AVG(tenure_months)
FROM fact_employee_snapshot
WHERE month_key = 202405
AND headcount_flag = 1;

