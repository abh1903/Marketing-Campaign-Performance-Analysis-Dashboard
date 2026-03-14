# Marketing Campaign Performance Analysis Dashboard

## 📊 Project Overview

This project analyzes **digital marketing campaign performance** using **SQL, Python, and Power BI**. The goal of this project is to evaluate advertising performance across different platforms, countries, and campaign types to understand which marketing strategies generate the highest revenue, conversions, and return on investment.

The project demonstrates an **end-to-end data analysis workflow**, including data extraction, data analysis, and interactive dashboard creation.

---

## 🛠 Tools & Technologies Used

* **SQL (PostgreSQL)** – Data querying and business analysis
* **Python (Pandas, Matplotlib)** – Data cleaning and exploratory data analysis
* **Power BI** – Interactive dashboard and visualization
* **Excel / CSV Dataset** – Data source

---

## 📂 Project Workflow

### 1️⃣ Data Extraction (SQL)

SQL was used to analyze marketing data and answer business questions such as:

* Platform-wise revenue and ad spend
* Country-wise conversion rate
* Industry-wise revenue contribution
* Monthly revenue trends
* Top performing campaigns by profit

Example SQL Query:

```sql
SELECT 
    industry,
    ROUND(SUM(revenue)::numeric,2) AS total_revenue,
    ROUND((SUM(revenue)*100.0 / SUM(SUM(revenue)) OVER())::numeric,2) AS contribution_percentage
FROM compaign
GROUP BY industry
ORDER BY total_revenue DESC;
```

---

### 2️⃣ Data Analysis (Python)

Python was used for **data cleaning, exploration, and creating new metrics**.

Key tasks performed:

* Data preprocessing
* Feature creation
* Exploratory Data Analysis (EDA)
* Visualization of marketing performance

Example Python Code:

```python
import pandas as pd

df = pd.read_csv("global_ads_performance_dataset.csv")

df['date'] = pd.to_datetime(df['date'])
df['profit'] = df['revenue'] - df['ad_spend']
df['roi'] = df['revenue'] / df['ad_spend']

df.groupby('platform')['revenue'].sum()
```

---

### 3️⃣ Dashboard Development (Power BI)

An interactive **Marketing Campaign Performance Dashboard** was created in Power BI to visualize key insights.

### Dashboard KPIs

* Total Revenue
* Total Ad Spend
* Total Conversions
* Profit
* ROI

### Dashboard Visualizations

* Revenue by Platform
* Revenue by Country
* Conversions by Campaign Type
* ROI by Platform
* Monthly Revenue Trend

---

## 📈 Key Insights

* Certain advertising platforms generate significantly higher revenue than others.
* Some campaign types drive the majority of conversions.
* Monthly revenue trends highlight fluctuations in marketing performance.
* High ROI platforms provide the best return on advertising investment.

---

## 💡 Business Recommendations

* Increase marketing budget allocation to high ROI platforms.
* Optimize campaigns based on country performance.
* Focus on high-converting campaign types.
* Monitor monthly revenue trends to adjust marketing strategies.

---

## 📁 Project Structure

```
Marketing-Campaign-Analysis
│
├── dataset
│   └── global_ads_performance_dataset.csv
│
├── sql
│   └── marketing_analysis_queries.sql
│
├── python
│   └── ads_analysis.ipynb
│
├── powerbi
│   └── marketing_dashboard.pbix
│
└── README.md
```

---

## 🚀 Project Outcome

This project demonstrates the ability to:

* Perform **data analysis using SQL and Python**
* Build **interactive dashboards using Power BI**
* Generate **business insights from marketing data**
* Apply **data-driven decision making**

---

## 👤 Author

**Abhishek Rathore**

Aspiring **Data Analyst** skilled in **SQL, Python, Excel, and Power BI**.

---

⭐ If you found this project helpful, feel free to **star the repository**.
