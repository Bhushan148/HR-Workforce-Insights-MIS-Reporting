# HR Workforce Insights & MIS Reporting  
**_PostgreSQL • SQL • Excel • Power Query • Power Pivot • DAX • VBA_**

---

## Project Overview

In this project, I designed and implemented an **end-to-end HR Workforce Insights & MIS Reporting solution** to replicate how HR MIS reporting is executed in real organizational environments.

The work focuses on building a **controlled and reliable MIS process**, covering structured data modeling, KPI definition and governance, reconciliation and validation controls, Excel-based MIS workflows, and automated report outputs. Each step was designed to ensure that workforce metrics are accurate, consistent, and ready for management review.

The implementation reflects how **HR MIS Analysts, MIS Executives, and Finance MIS teams** typically operate, where reporting accuracy, repeatability, internal controls, and trust in numbers are essential. The project emphasizes disciplined reporting practices rather than ad-hoc analysis, ensuring that every KPI is explainable, validated, and supported by underlying data logic.


---

## Project Objective

The objective of this project was to build a structured HR MIS reporting pipeline that converts raw HR data into **validated, reconciled, and management-ready monthly MIS outputs**.

The work was designed to:

- Support **monthly workforce snapshot reporting**
- Use **SQL as the primary system of record** for KPI logic
- Reproduce workforce KPIs in **Excel for cross-validation**
- Apply **control checks and reconciliation** before publishing MIS outputs
- Deliver **A4, PDF-ready reports** on a consistent and repeatable reporting cycle
 on a recurring cycle

---

## Data Source

The data used in this project was obtained from a **public HR dataset sourced from Kaggle** that was already structured in a **dimensionally aligned format** suitable for HR reporting and analytics.

For this project:
- The dataset was treated as a **reporting-ready HR data source**
- Data files were directly loaded into **PostgreSQL** to form the Gold HR schema
- The dimensional structure was retained to support **monthly snapshot reporting**
- SQL validation views were created on top of this data to act as a **system-of-record reference** for KPI reconciliation with Excel

All data used in this project is **fully anonymized and simulated**, and is intended solely for learning and demonstration purposes. No real organizational or employee data is included.

---

## Solution Architecture

This solution was implemented as a structured HR MIS pipeline that converts prepared HR data into validated, management-ready MIS outputs using PostgreSQL and Excel.

### Architecture Layers

- **Data Layer**
  - HR data stored in PostgreSQL using a dimensional model
  - Monthly employee snapshot maintained at one row per employee per month

- **Logic & Validation Layer**
  - Workforce KPIs defined centrally using SQL views
  - SQL acts as the authoritative reference for metric definitions

- **MIS & Reporting Layer**
  - Excel used for controlled data refresh, analytical modeling, validation, and report preparation
  - VBA used for automated export of MIS and validation reports in PDF format

---

## End-to-End Workflow

### 1. Data Sourcing & Loading
- A public HR dataset sourced from Kaggle was downloaded as structured CSV files
- A PostgreSQL schema was created to represent the HR dimensional model
- CSV files were loaded into PostgreSQL fact and dimension tables

### 2. Dimensional Modeling
- A snapshot-based HR model was implemented with a monthly grain
- Dimension tables support employee, department, job, location, status, and movement analysis
- The model was designed specifically for MIS reporting and time-based workforce analysis

### 3. KPI Definition & Governance
- All workforce KPIs were defined in SQL views
- KPI logic was centralized to ensure consistency and auditability
- SQL served as the system of record for metric definitions

### 4. Excel Integration & Modeling
- Excel connected to PostgreSQL using Power Query with controlled refresh
- Required transformations were applied in Excel
- Relationships were defined in the Power Pivot data model
- Data preparation sheets were created to organize KPIs for reporting

### 5. Validation & Controls
- KPIs calculated in Excel were reconciled against SQL results
- PASS / FAIL indicators were used to confirm alignment
- Validation controls ensured accuracy before publishing reports

### 6. MIS Reporting & Automation
- Monthly MIS reports were designed in Excel using A4-sized, multi-page layouts
- Separate validation reports were prepared for reconciliation transparency
- VBA controls enabled one-click export of MIS and validation reports as PDFs

---

### Design Principles Applied

- SQL as the single source of truth for workforce metrics  
- Clear separation between data, logic, validation, and presentation  
- Validation before reporting to ensure management trust  
- Automation to support repeatable monthly MIS cycles  

This approach ensures that workforce metrics remain traceable from source data through SQL logic and Excel modeling to final MIS outputs, closely reflecting real-world HR MIS reporting practices.

---

## What This Project Demonstrates

This project demonstrates practical HR MIS capabilities focused on accuracy, validation, and repeatable reporting rather than visualization alone.

Key takeaways from this work include:

- End-to-end ownership of an HR MIS reporting cycle
- Structured SQL-based KPI definition and governance
- Integration of PostgreSQL with Excel for controlled reporting
- Use of Excel data models for workforce analysis
- KPI reconciliation between SQL and Excel to ensure accuracy
- Validation-first approach before MIS publication
- Preparation of management-ready MIS and validation outputs
- Automation mindset for recurring monthly reporting

---

## Disclaimer

This project is a personal portfolio initiative created for learning, practice, and interview discussion purposes only.  
All data used is publicly available or simulated and does not represent any real organization or employees.

---

## Author

**Bhushan Gawali**  
_MIS Analyst | Data Analyst | Power BI Developer_

## LinkedIn Profile:  
https://www.linkedin.com/in/bhushangawali148/



