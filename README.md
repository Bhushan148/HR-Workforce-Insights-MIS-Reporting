# HR Workforce Insights & MIS Reporting  
**PostgreSQL • SQL • Excel • Power Query • Power Pivot • DAX • VBA**

---

## 📘 Project Overview
This repository documents an **end-to-end HR Workforce Insights & MIS Reporting solution** that I designed and executed to closely reflect **real-world HR MIS operations in enterprise environments**.

The project goes beyond dashboards and focuses on the **complete MIS discipline**—data modeling, KPI governance, reconciliation, validation controls, Excel-based MIS workflows, and automated report delivery.

The solution mirrors how **HR MIS Analysts, MIS Executives, and Finance MIS teams** operate, where reporting accuracy, repeatability, internal controls, and management trust are critical.

---

## 🎯 Project Objective
The objective of this project was to build a **production-style HR MIS reporting pipeline** that converts raw HR data into **validated, reconciled, and management-ready monthly MIS outputs**.

The project was designed to:
- Support **monthly workforce snapshot reporting**
- Maintain **SQL as the system of record**
- Reproduce KPIs inside Excel for validation
- Implement **control checks before publishing MIS**
- Deliver **A4, PDF-ready reports** on a recurring cycle

---

## 🗂 Data Source
- Public HR dataset sourced from **Kaggle**
- Fully anonymized and standardized
- Structured to resemble real HR operational systems

⚠️ No real organizational data is used.

---

## 🏗️ Solution Architecture
```
Raw HR CSV Files
        ↓
PostgreSQL (Gold Layer – HR Dimensional Model)
        ↓
SQL KPI Views (Authoritative Metrics)
        ↓
Excel Power Query (Controlled Refresh)
        ↓
Excel Power Pivot (Analytical Model)
        ↓
Excel Formulas + DAX + CUBE Reconciliation
        ↓
MIS Reports & Validation Reports (PDF Automation)
```

---

## 🔄 End-to-End Workflow

### Data Preparation
Raw HR data was cleaned, standardized, and validated for MIS readiness, ensuring consistent formats, correct data types, and accurate date handling.

### Dimensional Modeling
A monthly snapshot-based HR dimensional model was designed in PostgreSQL with one record per employee per month to support time-based workforce analysis.

### KPI Governance
All KPIs were defined centrally in SQL views to ensure consistency, auditability, and tool independence.

### Excel MIS Modeling
Excel was used for controlled refresh, analytical modeling, pivot-based reporting, DAX calculations, and reconciliation using CUBE functions.

### Validation & Controls
SQL KPIs were reconciled against Excel/DAX values with PASS/FAIL indicators and conditional formatting to highlight discrepancies.

### Reporting & Automation
Management-ready MIS reports and validation reports were generated in A4 layout and exported as PDFs using VBA automation.

---

## 📁 Repository Structure
```
HR-Workforce-Insights-MIS-Reporting/
├── README.md
├── Database/
│   ├── hr_schema_gold.sql
│   └── hr_validation_kpis.sql
├── Data Dictionary/
│   └── HR_MIS_Data_Dictionary.xlsx
├── Sample Reports/
│   ├── Sample_MIS_Report_DEC_2025.pdf
│   └── Sample_Data_Validation_Report_AUG_2024.pdf
└── Screenshots/
    ├── mis_report_layout.png
    └── validation_summary.png
```

---

## 💼 What This Project Demonstrates
- End-to-end HR MIS ownership
- Enterprise-grade KPI governance
- SQL-first reporting discipline
- Excel-based MIS modeling and controls
- KPI reconciliation using DAX and CUBE
- Audit-ready reporting practices
- Automation of recurring MIS cycles

---

## ⚠️ Disclaimer
This is a personal portfolio project created for learning, demonstration, and interview discussion purposes only.

---

## 👤 Author
**Bhushan Gawali**  
HR MIS & Workforce Analytics

---

## 🏷 Skill & Technology Tags
```
#HRMIS #MISReporting #WorkforceAnalytics #HRAnalytics
#PostgreSQL #SQL #ExcelMIS #PowerQuery #PowerPivot
#DAX #CubeFunctions #KPIReconciliation #DataGovernance
#VBA #AuditReadyReporting #EnterpriseMIS
```
