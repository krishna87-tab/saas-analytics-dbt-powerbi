# 📊 SaaS Analytics Engineering Platform

### End-to-End Analytics Engineering Project using BigQuery, dbt Core & Power BI

---
## Executive Dashboard

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/d7269be84d7fd72428380675a75d116b01c9c9c2/screenshots/Executive%20Dashboard.png)


## 🚀 Project Overview

This project demonstrates a complete Analytics Engineering workflow using **Google BigQuery**, **dbt Core**, and **Power BI**.

The objective is to transform raw SaaS operational data into executive-ready insights using a modern layered data architecture and interactive dashboards.


# Business Objectives

The Executive Dashboard was designed to help business leaders answer critical business questions such as:

- How much revenue are we generating?
- Which customers are at risk?
- How healthy is our customer base?
- Are payment collections improving?
- What are the biggest customer risk drivers?
- Which regions perform the best?

---

### Key Features

- Modern dbt layered architecture
- Star schema dimensional modeling
- Executive Power BI dashboard
- Revenue analytics
- Customer health monitoring
- Payment performance analysis  
- Customer risk analysis
- Interactive KPI reporting

---

## 🛠 Technology Stack

| Layer | Technology |
|--------|------------|
| Data Warehouse | Google BigQuery |
| Transformation | dbt Core |
| Data Modeling | Star Schema |
| Language | SQL |
| Visualization | Power BI |
| Business Logic | DAX |
| Version Control | Git & GitHub |

---

## 🌟 Project Highlights

- End-to-end Analytics Engineering workflow
- Cloud data warehouse using Google BigQuery
- Layered dbt architecture (Sources → Staging → Intermediate → Dimensions → Facts → Marts)
- Star schema dimensional model
- Executive Power BI dashboard
- Customer Health Scoring
- Revenue and Subscription Analytics
- Payment Performance Monitoring
- Interactive executive KPIs
- GitHub documentation and version control


# Data Architecture

```
Raw CSV Files
       │
       ▼
Google BigQuery
       │
       ▼
dbt Sources
       │
       ▼
Staging Models
       │
       ▼
Intermediate Models
       │
       ▼
Dimension Models
       │
       ▼
Fact Models
       │
       ▼
Customer Health Mart
       │
       ▼
Power BI Executive Dashboard
```

---

## Dbt_lineage

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/fcda90f50940a79f7c64e0b700efd0f27582875c/screenshots/dbt_lineage.png)

The project follows a modular dbt architecture where raw data is transformed through staging, intermediate, dimensional, fact, and mart layers before powering executive reporting.

---

# Power BI Semantic Model

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/20a6371c5a764aa9924fd1db09fdb9e99db3e1a7/screenshots/SaaS%20Data%20Model.png)

The semantic model follows a star schema design built on top of dbt-generated analytical models for scalable reporting and efficient query performance.

---

# Dashboard Features

- Executive KPI Cards
- Revenue Monitoring
- Customer Health Analysis
- Revenue at Risk
- Payment Success Tracking
- Monthly Revenue Trends
- Regional Health Analysis
- Customer Risk Drivers
- Executive Customer Drill-through

---

# Key Performance Indicators

| KPI | Description |
|------|-------------|
| Revenue | Total business revenue |
| Active Customers | Current active customer base |
| Revenue at Risk | Revenue exposed to customer risk |
| Payment Success | Successful payment percentage |
| At-Risk Customers | Customers requiring attention |
| Average Health Score | Overall customer health metric |

---

# Repository Structure

```
saas-analytics-dbt-powerbi
│
├── dbt_project/
├── powerbi/
├── screenshots/
├── docs/
├── assets/
├── README.md
├── LICENSE
└── .gitignore
```

---

# Future Enhancements

- Customer 360 Dashboard
- Product Adoption Dashboard
- Support Analytics Dashboard
- Revenue Forecasting
- AI-driven Business Insights
- Automated Data Quality Monitoring

---

# About This Project

This project was developed as a portfolio project to demonstrate modern Analytics Engineering practices, dimensional modeling, cloud data transformation, and executive dashboard development using industry-standard tools.

---

# Author

**Krishna Kamal Gogoi**

 Operations Analyst | Business Intelligence Analyst | Analytics Engineer

- GitHub: https://github.com/krishna87-tab
- LinkedIn: *[https://www.linkedin.com/in/krishna-k-gogoi/]*
