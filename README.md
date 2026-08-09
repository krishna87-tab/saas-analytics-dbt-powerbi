# SaaS Analytics --- Customer Health, Retention & Growth

## Project Overview

## This project is an end-to-end SaaS Analytics / Analytics Engineeringsolution built to answer four core business questions:

How is the SaaS business performing financially?

Where are operational and customer-health issues affectingretention?

Which customers are at risk of churn or revenue loss?

Where are the strongest opportunities for expansion and growth?

The project combines dbt Core, BigQuery, SQL and Power BI totransform raw SaaS operational data into tested analytical models and anexecutive-ready BI solution.

# Project Architecture

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/2874bf2a28d6a15eb506018b3ab6512610146fde/screenshots/Architecture%20Diagram.png)

## The final Power BI report contains four business-focused pages:

## Executive Overview --- Revenue, customer health and overallbusiness performance

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/eb134649eae1c178f0321f2e0eb95e34a28d8fcd/screenshots/_Executive%20Insights.png)

## Operations Insights --- Product adoption, support performanceand payment health

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/28b8571c8adb60896375ac0f64025ddd954895b9/screenshots/Operational%20Insights.png)

## Customer Risk & Retention --- Churn, customer risk,revenue-at-risk and risk drivers

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/1be37f6fee9b423bf2b3ea99a54a2e4d2fd093dc/screenshots/Retention.png)

## Growth & Expansion --- Expansion-ready customers, adoption andrevenue opportunities

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/6b4f19d679b1c65d1cc8a749bcf4b27ce63ef058/screenshots/Expansion.png)

## Data Lineage

![image_alt](https://github.com/krishna87-tab/saas-analytics-dbt-powerbi/blob/a8316ffe1470bb05c2d994fdc1650647ab8a9a51/screenshots/dbt_lineage.png)

## Business Objective

SaaS companies need to manage more than revenue growth. Sustainablegrowth depends on understanding:

Customer health

Product adoption

Payment behaviour

Support performance

Churn risk

Revenue at risk

Expansion potential

This project turns those operational signals into a unifiedcustomer-health framework so that leadership and customer-facing teamscan identify where revenue is healthy, where it is at risk, and whereexpansion opportunities exist.

## Solution Architecture
```
Raw SaaS CSV Data
       │
       ▼
BigQuery Raw Layer
       │
       ▼
dbt Sources
       │
       ▼
Staging Layer
stg_customers
stg_plans
stg_subscription
stg_invoices
stg_payments
stg_product_usage
stg_events
stg_tickets
       │
       ▼
Intermediate Layer
int_customer_subscriptions
int_revenue
int_product_adoption
int_support_performance
int_events
       │
       ▼
Dimensions & Facts
dim_customer
dim_plan
dim_date
fct_revenue
       │
       ▼
Customer Health / Analytical Marts
customer_health_mart
       │
       ▼
Power BI Semantic Model
       │
       ▼
Executive SaaS Analytics Dashboard
```
## Technology Stack

| Area | Technology |
|---|---|
| Data Warehouse | Google BigQuery |
| Transformation | dbt Core |
| SQL | SQL |
| BI / Visualization | Microsoft Power BI |
| Data Modeling | Dimensional / analytical modeling |
| Testing | dbt generic tests |
| Packages | dbt-utils |
| Source Data | SaaS operational CSV datasets |
| Version Control | Git / GitHub |

```
📂 dbt Project Structure

saas_dbt_project/
│
├── models/
│   ├── staging/
│   │   ├── stg_customers.sql
│   │   ├── stg_plans.sql
│   │   ├── stg_subscription.sql
│   │   ├── stg_invoices.sql
│   │   ├── stg_payments.sql
│   │   ├── stg_product_usage.sql
│   │   ├── stg_events.sql
│   │   └── stg_tickets.sql
│   │
│   ├── intermediate/
│   │   ├── int_customer_subscriptions.sql
│   │   ├── int_revenue.sql
│   │   ├── int_product_adoption.sql
│   │   ├── int_support_performance.sql
│   │   └── int_events.sql
│   │
│   ├── dimensions/
│   │   ├── dim_customer.sql
│   │   ├── dim_plan.sql
│   │   └── dim_date.sql
│   │
│   ├── facts/
│   │   └── fct_revenue.sql
│   │
│   └── marts/
│       └── customer_health_mart.sql
│
├── seeds/
├── macros/
├── tests/
├── dbt_project.yml
└── README.md
```

## Data Transformation Approach

## The project follows a layered dbt architecture.
```
1. Staging Layer

The staging layer standardizes raw source data through:

Data type casting
Column naming and normalization
Status standardization
Basic source-level transformations
Clean analytical field definitions

2. Intermediate Layer

The intermediate models combine business entities and create reusableanalytical logic.

Examples include:

Customer subscriptions, Combines subscription, 
invoice and payment information to identify: Paid payments, Late payments, Failed payments, Payment categories
Revenue
Creates customer-level and invoice-level revenue metrics.
Product adoption
Calculates behavioural usage metrics such as:
Active users
User utilization
Event utilization
API calls per user
Events per user
Reports created
Active-days rate
Support performance
Creates operational support KPIs including:
Ticket volume
Resolution performance
Escalations
High-priority tickets
First-response time
Resolution time
SLA performance

3. Dimension & Fact Layer

The analytical model includes:

dim_customer
dim_plan
dim_date
fct_revenue

4. Customer Health Mart

The customer_health_mart combines:

Customer profile
Revenue performance
Product usage
Support performance
Payment behaviour
into a unified customer-health view.
```
## Customer Health Framework

Customer health is evaluated across multiple dimensions.

Payment Health

Condition                 Classification

Failed payments present   PoorMultiple late payments    AverageOtherwise                 Good

Usage Health

User Utilization Classification

           ≥ 80% High
           ≥ 50% Medium
          \< 50% Low

Support Health

SLA Performance Classification

          ≥ 95% Excellent
          ≥ 80% Good
         \< 80% Needs Attention

These signals are combined with subscription and behavioural indicatorsto identify customers requiring attention and customers with expansionpotential.

## Power BI Dashboard

1. Executive Overview

Provides an executive-level view of:

Revenue

Active customers

Revenue at risk

Payment success

At-risk customers

Average customer-health score

Customer health distribution

Monthly revenue growth

Health score by region

Major risk drivers

Customer-level health details

Key business question

Is the SaaS business growing, and is that growth supported byhealthy customers?

2. Operations Insights

Focuses on customer adoption and operational performance.

Key metrics include:

Healthy customers

Average active users

Average resolution days

High-priority tickets

Events per user

Average API calls

Usage health distribution

Support health

Payment health

Active users by plan

Resolution performance by region

High-priority tickets by region

Key business question

What operational signals explain customer engagement and servicequality?

3. Customer Risk & Retention

Focuses on identifying customers and revenue most exposed to churn.

Key metrics include:

Active customers

Churned customers

Churn rate

Critical customers

Critical customer percentage

Revenue risk by region

Churn by region

Revenue risk by plan

Revenue risk by acquisition channel

Revenue at risk by industry

Key business question

Where is the company most exposed to customer churn and revenueloss?

4. Growth & Expansion

Identifies customers with strong product adoption and expansionpotential.

Key metrics include:

Expansion-ready customers

Expansion revenue

Expansion revenue percentage

High-adoption customers

Event utilization

User utilization

Expansion-ready customers by plan

Product adoption by plan

Expansion revenue by region

Key business question

Which customers and segments have the strongest potential for upsellor expansion?

## Example Business Insights

The dashboard is designed to surface actionable insights rather thansimply report metrics.

Examples from the final analysis include:

A significant share of the customer base is classified as at risk.

Failed payments emerge as one of the strongest identified risksignals.

Support backlog and high-priority tickets provide additionalretention signals.

Southern Europe represents a significant share of revenue risk.

Western Europe shows comparatively stronger support-resolutionperformance.

Basic-plan customers represent a large portion of expansion-readyaccounts.

High product adoption creates a clear pool of potential expansioncustomers.

Revenue-at-risk varies materially by acquisition channel andindustry.

These insights demonstrate how operational SaaS data can be translatedinto retention and revenue-growth decisions.

 ## Data Quality & Testing

The dbt project includes automated data-quality testing across thetransformation pipeline.

Testing covers areas such as:

not_null

unique

accepted_values

Relationship validation

Source validation

The project was repeatedly validated using dbt commands including:

dbt debug
dbt parse
dbt run
dbt test

The final models were validated through successful dbt runs and datatests before being consumed by Power BI.

## Analytics Engineering Practices Demonstrated

This project demonstrates practical experience with:

dbt project organization

Source configuration

Staging / intermediate / mart architecture

Dimensional modeling

Fact and dimension design

Reusable SQL transformations

Business logic modeling

Data-quality testing

BigQuery warehouse integration

Customer-health analytics

Revenue-risk analysis

Power BI semantic modeling

Executive dashboard design

Business-focused storytelling

## Business Value

The solution can support several SaaS business functions:

Customer Success

Identify customers showing:

Low adoption

Payment problems

Poor support experience

Multiple risk signals

Retention

Prioritize customers based on:

Health status

Churn behaviour

Revenue exposure

Risk drivers

Sales / Account Management

Identify:

Expansion-ready customers

High-adoption accounts

Plan upgrade opportunities

Regional expansion opportunities

Leadership

Monitor:

Revenue

Customer health

Revenue at risk

Churn

Operational performance

Expansion potential

## How to Run the Project
```
Prerequisites

Install:

Python

dbt Core

dbt-bigquery adapter

Google Cloud CLI

Power BI Desktop

Install dbt

pip install dbt-core
pip install dbt-bigquery

Configure Google Cloud

Authenticate using Google Cloud Application Default Credentials:

gcloud auth application-default login

Set the appropriate Google Cloud project:

gcloud config set project <YOUR_PROJECT_ID>

Install dbt packages

dbt deps

Validate the project

dbt debug
dbt parse

Build the models

dbt run

Run tests

dbt test

Generate documentation

dbt docs generate
dbt docs serve
```
# Source Data

The project uses simulated SaaS operational datasets representing areassuch as:

Customers

Plans

Subscriptions

Invoices

Payments

Product usage

Subscription events

Support tickets

The data is used for portfolio and analytical-engineering demonstrationpurposes.

# Important Note

This is a portfolio / simulated SaaS analytics project and does notrepresent confidential production data from an actual SaaS company.

Business conclusions are therefore illustrative and demonstrate theanalytical approach rather than representing real company performance.

# Author
```
Krishna Kamal Gogoi

Analytics / BI professional focused on:

Business Intelligence

Analytics Engineering

SQL

dbt

Power BI

Data Modeling

Customer & Revenue Analytics
```
## Project Outcome

This project demonstrates an end-to-end workflow:

Raw operational data → BigQuery → dbt transformations → testedanalytical models → customer health mart → Power BI semantic model →executive business insights

The objective is not only to build dashboards, but to demonstrate theability to translate business problems into data models, analyticallogic and decision-ready insights.
