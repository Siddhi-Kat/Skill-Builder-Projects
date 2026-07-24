# 🛒 From Click to Checkout: E-commerce Customer Journey Analysis

> An end-to-end Business Intelligence project analyzing how customers move from their first website visit to completing a purchase, using **Python**, **MySQL**, and **Power BI**.

---

## 📖 Overview

Every customer journey starts with a click, but not every visitor becomes a customer.

This project analyzes Maven toy store, e-commerce data to understand customer acquisition, website engagement, product performance, and purchasing behavior. By combining SQL-based business analysis with interactive Power BI dashboards, the project identifies opportunities to improve conversion rates and drive business growth.

---

## 🎯 Business Problem

Maven toy store wants to better understand its online customer journey by answering questions such as:

- Which marketing channels generate the highest-quality traffic?
- How effectively does the website convert visitors into customers?
- Which landing pages encourage purchases?
- Which products attract attention but fail to convert?
- Are customers returning after their first purchase?
- What improvements can increase conversions and revenue?

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Python (Pandas)** | Data Cleaning & Preprocessing |
| **MySQL** | Data Modeling & Business Analysis |
| **Power BI** | Dashboard Development & Data Visualization |

---

## 📂 Dataset

The project uses the **Maven toy store** e-commerce dataset consisting of six relational tables:

- Website Sessions
- Website Pageviews
- Orders
- Order Items
- Products
- Order Item Refunds
- <img width="624" height="279" alt="image" src="https://github.com/user-attachments/assets/28fcd491-b65c-4414-97fd-0ee5c5630ab0" />


---

## 🔄 Project Workflow

```
Raw CSV Files
      │
      ▼
Python (Pandas)
• Data Cleaning
• Data Transformation
      │
      ▼
MySQL
• Relational Database
• SQL Analysis
      │
      ▼
Power BI
• Data Modeling
• DAX Measures
• Interactive Dashboards
      │
      ▼
Business Insights & Recommendations
```

---

# 📊 Dashboard

The Power BI dashboard provides an interactive view of the customer journey through:

- Executive KPIs
- Website Traffic Analysis
- Customer Acquisition
- Product Performance
- Conversion Funnel
- Revenue Analysis
- Customer Behavior

> **Dashboard Preview**

<p align="center">
<img src="images/dashboard_overview.png" width="900">
</p>

---

# 🔍 SQL Business Analysis

SQL was used to answer business questions beyond the dashboard visualizations.

| Business Question | Purpose |
|-------------------|---------|
| Which marketing channels bring visitors who actually purchase? | Evaluate traffic quality using sessions, revenue, orders, and conversion rate. |
| How many website sessions lead to a purchase? | Measure overall website conversion performance. |
| Which products are viewed frequently but purchased less? | Identify products with high interest but low purchase conversion. |
| Which landing page has the highest conversion? | Compare landing pages based on conversion rate. |
| Are customers returning or purchasing only once? | Analyze customer retention and repeat purchasing behavior. |

---

# 📈 Key Insights

### 📍 Customer Acquisition

Marketing channels differ significantly in conversion performance. High website traffic does not necessarily translate into higher revenue, making conversion rate a more meaningful metric than visitor volume alone.

---

### 📍 Website Conversion

Only a portion of website sessions result in a completed purchase, highlighting opportunities to improve customer engagement and reduce drop-offs throughout the buying journey.

---

### 📍 Landing Page Performance

Landing pages vary considerably in their ability to convert visitors into customers. High-performing landing pages can serve as benchmarks for optimizing lower-performing pages.

---

### 📍 Product Performance

Some products receive substantial customer attention but generate relatively fewer purchases, indicating opportunities to improve merchandising, pricing, or product presentation.

---

### 📍 Customer Retention

Understanding the proportion of one-time and repeat customers provides insight into long-term business growth and customer loyalty.

---

# 💡 Business Recommendations

* **Optimize marketing spend** by prioritizing acquisition channels that consistently deliver higher conversion rates and stronger customer quality.
* **Improve landing page performance** through continuous A/B testing, user experience enhancements, and adoption of best practices from high-converting pages.
* **Optimize product merchandising** by promoting high-converting products while improving the visibility and presentation of lower-performing products.
* **Reduce checkout friction** by simplifying the purchase journey, minimizing unnecessary steps, and optimizing the cart and checkout experience.
* **Monitor product quality and refund trends** to identify potential issues affecting customer satisfaction and profitability.
* **Strengthen customer retention** by implementing loyalty programs, personalized recommendations, and post-purchase engagement campaigns to encourage repeat purchases.


---

# 📁 Repository Structure

```
📦 Maven-Toy-Store-Customer-Journey-Analysis
│
├── 📂 data
│
├── 📂 notebooks
│   └── data_cleaning.ipynb
│
├── 📂 sql
│   ├── setting keys-constraints.sql
│   ├── Business queries.sql
    ├── sql_outputs.csv
│
├── 📂 powerbi
│   └── Toy_Store_Dashboard.pbix
│
├── 📂 images
│   
│   ├── er_diagram.png
│
├── 📂 reports
│   └── Business_Case_Study.pdf
│
└── README.md
```


## 👤 Author

**Cd**

Data Analyst | SQL • Python • Power BI

If you found this project interesting, feel free to connect or provide feedback!
