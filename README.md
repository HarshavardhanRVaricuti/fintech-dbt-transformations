# 📈 Fintech Data Pipeline: End-to-End Stock Market ELT

An automated, Modern Data Stack (MDS) pipeline that extracts real-time financial market data, orchestrates it through a cloud data lake, and transforms it for live business intelligence. 

This project demonstrates a complete Data Engineering workflow, from API extraction to a live-updating Power BI dashboard.

---

## 🏗️ Architecture Overview

The pipeline follows a robust **ELT (Extract, Load, Transform)** pattern with zero manual data movement once deployed.

* **Extraction:** Python (yfinance API)
* **Data Lake:** AWS S3 (Raw storage)
* **Data Warehouse:** Snowflake
* **Transformation:** dbt (Data Build Tool)
* **Orchestration:** Apache Airflow (Dockerized via Astronomer)
* **Business Intelligence:** Power BI (DirectQuery Mode)

---

## 🚀 Key Features

* **Automated Scheduling:** Airflow DAGs handle the daily extraction and loading process seamlessly.
* **Containerized Environment:** The entire orchestration layer runs locally via Docker, ensuring reproducibility.
* **Modular Transformations:** dbt models convert raw data into cleaned, aggregated analytics tables using version-controlled SQL.
* **Live Dashboarding:** Power BI is connected directly to the Snowflake `ANALYTICS` schema via DirectQuery, automatically refreshing as soon as dbt finishes its run.

---

## 📊 Business Intelligence Layer

The final output is a high-performance Power BI dashboard that tracks stock volatility, volume, and closing prices.

*(📸 <img width="1794" height="1006" alt="image" src="https://github.com/user-attachments/assets/edad1a68-d950-4274-b824-842d111c632c" />)*

### Dashboard Technical Specs:
* **Connection Type:** DirectQuery (Real-time link to Snowflake).
* **Calculated Metrics:** Custom DAX measures for "Latest Close Price" and "Data Freshness" timestamps.
* **Automation:** Configured with Auto Page Refresh to poll Snowflake for updates automatically.

---

## 🛠️ Prerequisites

To run this project locally, you will need:
* Docker Desktop installed and running
* Astronomer CLI (`astro`)
* Python 3.9+
* Accounts for AWS (S3) and Snowflake
* Power BI Desktop (for visualization)

---

## ⚙️ Local Setup Instructions

**1. Clone the repository**
```bash
git clone [https://github.com/YourUsername/fintech-pipeline.git](https://github.com/YourUsername/fintech-pipeline.git)
cd fintech-pipeline
```

2. Configure Environment Variables

```bash
AWS_ACCESS_KEY_ID=your_key
AWS_SECRET_ACCESS_KEY=your_secret
SNOWFLAKE_ACCOUNT=your_account
SNOWFLAKE_USER=your_user
SNOWFLAKE_PASSWORD=your_password
```
3. Start the Airflow Infrastructure

Make sure Docker is running, then execute:

```bash
astro dev start
```
Access the Airflow UI at http://localhost:8080.

4. Run dbt Transformations
Navigate to your dbt directory and run the models to build your analytics tables in Snowflake:

```bash
dbt run
```
5. Connect Power BI
Open Power BI Desktop, select "Get Data" -> "Snowflake", enter your server details, and be sure to select DirectQuery to connect to your newly built dbt models.
