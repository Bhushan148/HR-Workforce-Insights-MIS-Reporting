# HR Workforce Insights & MIS Reporting  
_PostgreSQL • SQL • Excel Power Query • Power Pivot • VBA_

---

## Overview
This repository showcases a **practical, end-to-end HR Workforce Insights and MIS Reporting solution** built using **PostgreSQL and Microsoft Excel**.

The project mirrors how **HR MIS reporting operates in real-world organizations**, emphasizing:
- Data accuracy before insights  
- Clear KPI definitions  
- Cross-layer validation (SQL ↔ Excel)  
- Repeatable, audit-ready monthly reporting  

Rather than focusing only on dashboards, this project highlights the **discipline behind reliable HR reporting**—from raw data ingestion to management-ready MIS outputs.

---

## Project Objective
The objective of this project is to demonstrate a **complete HR MIS reporting pipeline** that transforms raw HR data into **validated workforce insights** using structured data modeling and reconciliation.

### Key Objectives
- Design a **monthly employee snapshot** for HR analysis  
- Build **standard workforce KPIs** using SQL  
- Validate KPIs between **PostgreSQL and Excel**  
- Enable **repeatable monthly MIS reporting**  
- Simulate enterprise-style **HR reporting governance**

---

## Data Source
The dataset used in this project is based on a **public HR dataset sourced from Kaggle**.

- The data does **not** represent any real organization  
- Used strictly for **learning, demonstration, and portfolio purposes**  
- Modified and standardized to resemble real HR operational data

---

## End-to-End Project Workflow

### Step 1: Raw Data Preparation
- Raw HR data sourced from Kaggle  
- Files reviewed, cleaned, and standardized  
- Core HR attributes identified, including:
  - Employee demographics  
  - Job and department details  
  - Location and reporting hierarchy  
  - Employment status and movement indicators  

---

### Step 2: Dimensional Modeling in PostgreSQL
A **dimensional data model** was designed specifically for **HR MIS and workforce analytics**.

#### Snapshot Design
- **Monthly employee snapshot**  
- Grain: **1 row per employee per month**

#### Dimensions Created
- Employee  
- Department  
- Location  
- Job  
- Manager  
- Date (Month)  
- Employment Status  
- Movement / Exit Reason  

#### Fact Table
- Stores monthly workforce measures and flags:
  - Active status  
  - Joiners  
  - Exits  
  - Tenure indicators  
  - Movement attributes  

This structure supports **analytical reporting**, not transactional workloads.

---

### Step 3: Data Loading into PostgreSQL
- Cleaned CSV files loaded into PostgreSQL  
- Gold-layer schema represents **reporting-ready data**  
- Indexes applied for performance optimization  

All schema creation and validation logic is available in the `Database/` folder.

---

### Step 4: KPI Logic & Validation in SQL
Reusable **SQL views** were created to calculate core HR KPIs, including:

- Active Headcount  
- New Hires  
- Employee Exits  
- Attrition Rate  
- Average Tenure  
- Workforce Movement Metrics  

These SQL views act as the **single source of truth**, ensuring:
- Consistent KPI definitions  
- Reusability across tools  
- Auditability of calculations  

---

### Step 5: Connecting PostgreSQL to Excel
- Excel connects to PostgreSQL using **Power Query**  
- Monthly snapshots and KPI validation views are imported  
- Data refresh simulates a **monthly MIS refresh cycle**  
- Refresh timestamp captured to track data freshness  

---

### Step 6: KPI Calculation & Reconciliation in Excel
- Excel **Power Pivot Data Model** used for KPI calculation  
- Same KPIs calculated in both:
  - PostgreSQL (SQL views)  
  - Excel (Power Pivot measures)  

#### Validation Approach
- CUBE formulas retrieve KPI values from the data model  
- SQL vs Excel values are compared  
- Each KPI is flagged as:
  - **PASS** – values match  
  - **FAIL** – discrepancy detected  

This reflects real-world **MIS reconciliation and control processes**.

---

### Step 7: MIS Insights & Output Generation
Once KPIs are validated:

- Workforce insights are generated, focusing on:
  - Hiring and exit trends  
  - Workforce stability  
  - Attrition risk indicators  
- Reports are formatted for **A4 page size**  
- Designed for **PDF distribution to management**  

Both:
- MIS Report  
- Data Validation Report  

are produced directly from Excel.

---

### Step 8: Automation & Repeatability
To simulate enterprise reporting cycles:

- **VBA macros** enable one-click export of:
  - MIS Report (PDF)  
  - Data Validation Report (PDF)  
- File naming follows a standard **Month–Year convention**  
- Supports consistent, repeatable monthly HR MIS reporting  

---

## Tools & Technologies Used
- **PostgreSQL** – Dimensional modeling & KPI logic  
- **SQL** – Workforce KPI calculation & validation  
- **Excel Power Query** – Data connectivity & refresh  
- **Excel Power Pivot** – Analytical data model & measures  
- **CUBE formulas** – Consistent KPI retrieval  
- **VBA** – Report export automation  

---

## Repository Structure
```
HR-Workforce-Insights-MIS-Reporting/
│
├── README.md
│
├── Database/
│   ├── hr_schema_gold.sql
│   └── hr_validation_kpis.sql
│
├── Data Dictionary/
│   └── HR_MIS_Data_Dictionary.xlsx
│
├── Sample Reports/
│   ├── Sample_MIS_Report_DEC_2025.pdf
│   └── Sample_Data_Validation_Report_AUG_2024.pdf
│
└── Screenshots/
    ├── mis_report_layout.png
    └── validation_summary.png
```

---

## What This Project Demonstrates
- Practical HR MIS data modeling  
- SQL-driven KPI governance  
- SQL-to-Excel reconciliation discipline  
- Workforce analytics best practices  
- Automation mindset for recurring MIS cycles  
- Interview-ready explanation of HR reporting pipelines  

---

## Disclaimer
This repository is a **personal portfolio project** created for learning, demonstration, and interview discussion purposes.

All data used is **publicly available or simulated** and does not represent any real organization.

---

## Author
**Bhushan Gawali**  
_HR MIS & Workforce Analytics_
