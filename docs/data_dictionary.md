# Data Dictionary

## Source Tables

- Customers
- Plans
- Subscriptions
- Invoices
- Payments
- Product Usage
- Subscription Events
- Support Tickets

## Dimension Tables

### dim_customer
Customer attributes and subscription information.

### dim_plan
Subscription plan details.

### dim_date
Calendar dimension for time intelligence.

## Fact Tables

### fct_revenue
Revenue and payment metrics.

### fct_product_usage
Customer product adoption metrics.

### fct_subscription_events
Subscription lifecycle events.

### fct_support
Support ticket metrics.

## Mart

### customer_health_mart

Consolidated executive reporting table combining revenue, product usage, support performance, and customer health scoring.
