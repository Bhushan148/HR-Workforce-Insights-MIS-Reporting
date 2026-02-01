-- ============================================================
-- GOLD (PostgreSQL) – HR MIS / Reporting Monthly Snapshot
-- Grain: 1 row per employee per month
-- NO FOREIGN KEYS (OLAP / BI Friendly)
-- Schema: "Gold"
-- ============================================================

CREATE SCHEMA IF NOT EXISTS "Gold";

SET search_path = "Gold";

-- ======================
-- 📅 Date Dimension (Month)
-- ======================
CREATE TABLE IF NOT EXISTS dim_date_month (
    month_key           INT PRIMARY KEY,      -- YYYYMM
    month_start_date    DATE NOT NULL,
    month_end_date      DATE NOT NULL,
    year                INT NOT NULL,
    quarter             SMALLINT NOT NULL,
    month               SMALLINT NOT NULL,
    month_name          VARCHAR(15) NOT NULL,
    month_short_name    VARCHAR(10) NOT NULL,
    month_label         VARCHAR(20) NOT NULL,
    fiscal_year         INT,
    fiscal_quarter      SMALLINT,
    fiscal_month        SMALLINT,
    is_current_month    BOOLEAN
);

-- ======================
-- 👤 Employee Dimension
-- ======================
CREATE TABLE IF NOT EXISTS dim_employee (
    employee_key        INT PRIMARY KEY,
    employee_id         VARCHAR(20) NOT NULL,
    employee_name       VARCHAR(200) NOT NULL,
    gender              VARCHAR(20),
    marital_status      VARCHAR(30),
    nationality         VARCHAR(50),
    hire_date           DATE,
    confirmation_date   DATE,
    resignation_date    DATE,
    termination_date    DATE,
    last_working_date   DATE,
    employment_type     VARCHAR(50),
    worker_type         VARCHAR(50),
    work_mode           VARCHAR(30),
    employee_category   VARCHAR(50)
);

-- ======================
-- 🏢 Department Dimension
-- ======================
CREATE TABLE IF NOT EXISTS dim_department (
    department_key       INT PRIMARY KEY,
    department_code      VARCHAR(50),
    department_name      VARCHAR(200) NOT NULL,
    business_unit        VARCHAR(100),
    division             VARCHAR(100),
    sub_division         VARCHAR(100),
    team_name            VARCHAR(100),
    cost_center          VARCHAR(50),
    profit_center        VARCHAR(50),
    region               VARCHAR(50),
    reporting_unit       VARCHAR(100),
    effective_start_date DATE,
    effective_end_date   DATE,
    is_current           BOOLEAN
);

-- ======================
-- 📍 Location Dimension
-- ======================
CREATE TABLE IF NOT EXISTS dim_location (
    location_key         INT PRIMARY KEY,
    location_code        VARCHAR(50),
    location_name        VARCHAR(200) NOT NULL,
    address_line1        VARCHAR(200),
    address_line2        VARCHAR(200),
    city                 VARCHAR(100),
    state                VARCHAR(100),
    country              VARCHAR(100),
    postal_code          VARCHAR(20),
    region               VARCHAR(50),
    time_zone            VARCHAR(50),
    location_type        VARCHAR(50),
    effective_start_date DATE,
    effective_end_date   DATE,
    is_current           BOOLEAN
);

-- ======================
-- 💼 Job Dimension
-- ======================
CREATE TABLE IF NOT EXISTS dim_job (
    job_key                INT PRIMARY KEY,
    job_code               VARCHAR(50),
    job_title              VARCHAR(200) NOT NULL,
    job_family             VARCHAR(100),
    job_sub_family         VARCHAR(100),
    job_level              SMALLINT,
    job_grade              SMALLINT,
    career_track           VARCHAR(50),
    function_name          VARCHAR(100),
    overtime_eligible_flag BOOLEAN,
    effective_start_date   DATE,
    effective_end_date     DATE,
    is_current             BOOLEAN
);

-- ======================
-- 👔 Manager Dimension
-- ======================
CREATE TABLE IF NOT EXISTS dim_manager (
    manager_key           INT PRIMARY KEY,
    manager_employee_id   VARCHAR(20),
    manager_name          VARCHAR(200) NOT NULL,
    manager_email         VARCHAR(200),
    manager_level         SMALLINT
);

-- ======================
-- 🚦 Employment Status Dimension
-- ======================
CREATE TABLE IF NOT EXISTS dim_employment_status (
    status_key        INT PRIMARY KEY,
    status_name       VARCHAR(50) NOT NULL,
    status_group      VARCHAR(50) NOT NULL,
    is_active_flag    BOOLEAN
);

-- ======================
-- ✅ Reason Dimension
-- ======================
CREATE TABLE IF NOT EXISTS dim_reason (
    reason_key         INT PRIMARY KEY,
    reason_type        VARCHAR(50) NOT NULL,
    reason_code        VARCHAR(50),
    reason_name        VARCHAR(200) NOT NULL,
    is_voluntary_flag  BOOLEAN
);

-- ======================
-- ⭐ FACT: Monthly Employee Snapshot
-- Grain: (employee_key, month_key)
-- NO FK constraints (keys are join columns only)
-- ======================
CREATE TABLE IF NOT EXISTS fact_employee_snapshot (
    employee_key          INT NOT NULL,
    month_key             INT NOT NULL,
    department_key        INT,
    location_key          INT,
    job_key               INT,
    manager_key           INT,
    status_key            INT,
    reason_key            INT,

    -- MIS Flags
    hire_flag             BOOLEAN,
    exit_flag             BOOLEAN,
    promotion_flag        BOOLEAN,
    transfer_flag         BOOLEAN,
    manager_change_flag   BOOLEAN,
    salary_change_flag    BOOLEAN,

    -- Measures
    headcount_flag        SMALLINT,     -- 1 = Active, 0 = Not Active
    fte                  NUMERIC(5,2),
    active_days_in_month SMALLINT,
    tenure_months        INT,

    salary_amount         NUMERIC(12,2),
    variable_pay_amount  NUMERIC(12,2),
    total_comp_amount    NUMERIC(12,2),
    currency_code         CHAR(3),

    cost_center           VARCHAR(50),
    pay_grade             VARCHAR(20),
    band                  VARCHAR(20),

    PRIMARY KEY (employee_key, month_key)
);

-- ======================
-- 📈 Indexes for Reporting
-- ======================
CREATE INDEX IF NOT EXISTS idx_snap_month      ON fact_employee_snapshot (month_key);
CREATE INDEX IF NOT EXISTS idx_snap_emp_month  ON fact_employee_snapshot (employee_key, month_key);
CREATE INDEX IF NOT EXISTS idx_snap_dept_month ON fact_employee_snapshot (department_key, month_key);
CREATE INDEX IF NOT EXISTS idx_snap_loc_month  ON fact_employee_snapshot (location_key, month_key);
CREATE INDEX IF NOT EXISTS idx_snap_job_month  ON fact_employee_snapshot (job_key, month_key);
CREATE INDEX IF NOT EXISTS idx_snap_mgr_month  ON fact_employee_snapshot (manager_key, month_key);
CREATE INDEX IF NOT EXISTS idx_snap_status     ON fact_employee_snapshot (status_key);


-- ======================
-- DIMENSION TABLES
-- ======================

COPY dim_date_month
FROM 'C:\Users\bhush\Downloads\HR Data\dim_date_month.csv'
DELIMITER ',' CSV HEADER;

COPY dim_employee
FROM 'C:\Users\bhush\Downloads\HR Data\dim_employee.csv'
DELIMITER ',' CSV HEADER;

COPY dim_department
FROM 'C:\Users\bhush\Downloads\HR Data\dim_department.csv'
DELIMITER ',' CSV HEADER;

COPY dim_location
FROM 'C:\Users\bhush\Downloads\HR Data\dim_location.csv'
DELIMITER ',' CSV HEADER;

COPY dim_job
FROM 'C:\Users\bhush\Downloads\HR Data\dim_job.csv'
DELIMITER ',' CSV HEADER;

COPY dim_manager
FROM 'C:\Users\bhush\Downloads\HR Data\dim_manager.csv'
DELIMITER ',' CSV HEADER;

COPY dim_employment_status
FROM 'C:\Users\bhush\Downloads\HR Data\dim_employment_status.csv'
DELIMITER ',' CSV HEADER;

COPY dim_reason
FROM 'C:\Users\bhush\Downloads\HR Data\dim_reason.csv'
DELIMITER ',' CSV HEADER;

-- ======================
-- FACT TABLE
-- ======================

COPY fact_employee_snapshot
FROM 'C:\Users\bhush\Downloads\HR Data\fact_employee_snapshot.csv'
DELIMITER ',' CSV HEADER;

select * from fact_employee_snapshot;

