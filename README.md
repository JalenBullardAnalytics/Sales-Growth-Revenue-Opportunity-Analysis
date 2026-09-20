# 📈 Sales Growth & Revenue Opportunity Analysis

An end-to-end sales analysis transforming raw transactional data into actionable insights on product performance, pricing strategy, profitability, and quarterly sales trends.

This project analyzes 49,802 cleaned sales transactions to understand what is driving business performance, how discounting affects profitability, and how sales performance has changed over time.

The project was designed to simulate a realistic business analytics workflow: beginning with an intentionally dirty dataset, preparing and validating the data in Excel, analyzing business questions with SQL in Google BigQuery, and translating the findings into an interactive Tableau dashboard and executive recommendations.

---

## 📌 Business Problem

Business leaders need more than overall sales totals to make effective decisions. They need to understand which products and regions are generating profitable growth, how pricing decisions affect margins, and whether sales performance is improving or declining over time.

This project addresses three core business problems:

### 1. Product Performance

The business wants to understand what's driving sales performance.

Final Business Problem:
Analyze product category performance to identify which categories contribute the most revenue and profitability, and recommend where the business should focus future sales efforts.

### 2. Pricing Strategy

The business is concerned that its pricing strategy may be affecting profitability.

Final Business Problem:
Analyze the relationship between discount percentages, revenue, and profitability to determine whether current pricing strategies are maximizing business performance.

### 3. Quarterly Sales Trends

The business wants to understand how sales performance is changing each quarter.

Final Business Problem:
Analyze Quarter-over-Quarter sales performance to identify revenue trends, seasonal patterns, and opportunities that can support future sales planning and business decision-making.

---

## 🎯 Project Objective

The objective of this analysis was to transform raw sales transaction data into a structured decision-making tool that could help a business answer three major questions:

- Which product categories generate the strongest revenue and profitability?
- How do discount levels affect revenue and profit margins?
- How has sales performance changed quarter-over-quarter?

The analysis also aimed to move beyond high-level trends by investigating specific areas of profitability risk when the data indicated that additional analysis was necessary.

### Business Questions Answered

1. Which product categories generate the highest revenue and profit?
2. Which regions contribute most strongly to overall business performance?
3. Which customer segments represent opportunities for additional growth?
4. How does revenue change across different discount levels?
5. How does discounting affect profit margins across product categories?
6. How have completed orders, revenue, and profitability changed from Q1 to Q2 between 2023 and 2026?
7. What factors contributed to the 2026 Q2 slowdown?
8. Which products contributed most strongly to profitability deterioration within South Office Supplies?

---

## 📊 Dataset Overview

| Attribute | Description |
|---|---|
| **Source** | Synthetic sales transaction dataset generated with ChatGPT for this portfolio project |
| **Raw Rows** | 50,000 transactions |
| **Cleaned Rows** | 49,802 transactions |
| **Columns** | 19 |
| **Time Period** | January 1, 2023 – May 29, 2026 |
| **Regions** | West, Northeast, South, Midwest |
| **Primary Analysis Areas** | Product performance, regional performance, discount strategy, quarterly sales trends |
| **Data Type** | Transaction-level sales data |

### Key Variables

The dataset includes:

- Transaction ID
- Customer ID
- Product ID
- Sales Representative ID
- Transaction Date
- Region
- State
- Sales Channel
- Customer Segment
- Product Category
- Product Name
- Units Sold
- Unit Price
- Discount Percentage
- Revenue
- Cost
- Profit
- Payment Method
- Order Status

### Data Quality Notes

The raw dataset was intentionally generated with data-quality issues to create a realistic data-cleaning workflow.

The cleaning and auditing process included:

- Removing duplicate records
- Standardizing capitalization and extra spaces
- Standardizing date formats
- Applying consistent numeric, currency, and percentage formatting
- Identifying blank/null values
- Identifying negative values for further review

A total of 198 duplicate records were removed, reducing the dataset from 50,000 raw transactions to 49,802 cleaned transactions.

Some missing values remained in the cleaned dataset and were handled appropriately during analysis rather than automatically being removed.

### Limitations
- The dataset is synthetic and does not represent the performance of an actual company.
- The 2026 period is incomplete, with transactions available only through May 29, 2026.
- Some fields contain missing values, requiring query-specific treatment during analysis.
- Findings demonstrate analytical methodology and business reasoning rather than actual company performance.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **Excel** | Data cleaning, formatting, validation, duplicate removal, and initial data-quality review |
| **SQL / Google BigQuery** | Data extraction, aggregation, segmentation, profitability analysis, and business-question analysis |
| **Tableau** | Interactive dashboard development, KPI reporting, trend visualization, and exploratory analysis |
| **Google Slides** | Executive presentation and communication of findings and recommendations |

---

## 🔄 Methodology
Raw Transaction Data
        ↓
Excel Data Cleaning
        ↓
Data Quality Review
        ↓
Google BigQuery
        ↓
SQL Business Analysis
        ↓
Deeper Drill-Down Analysis
        ↓
Tableau Dashboard
        ↓
Business Insights
        ↓
Executive Recommendations

---

## Ask — Define the Business Problems

The analysis began by translating broad stakeholder concerns into specific analytical questions.

Clarification focused on:

* Business objectives
* Metrics
* Scope
* Timeframes
* Comparison periods
* Success criteria
* Data availability

This established the three primary analysis areas: Product Performance, Pricing Strategy, and Quarterly Sales Trends.

---

## Prepare — Understand and Clean the Data

The original dataset contained 50,000 transaction records and was intentionally created with data-quality issues.

Excel was used to inspect and prepare the dataset before analysis.

---

## Process — Clean and Standardize
The Excel cleaning process included:

* Using AutoFit Column Width/Height to improve readability and presentation consistency.
* Reviewing and removing 198 duplicate records.
* Using PROPER(TRIM()) to standardize inconsistent capitalization and remove unnecessary spaces.
* Standardizing transaction-date formatting.
* Applying consistent currency, numeric, and percentage formatting.
* Using conditional formatting to highlight blank/null values for review.
* Using conditional formatting to identify negative values requiring investigation.

The resulting cleaned dataset contained 49,802 transactions.

---

## Analyze — SQL & Business Analysis
The cleaned data was analyzed in Google BigQuery using SQL.

Queries were structured around the three stakeholder problems rather than simply performing general exploratory analysis.

SQL techniques included:

SUM()
COUNT(DISTINCT)
SAFE_DIVIDE()
ROUND()
TRIM()
LOWER()
CASE
EXTRACT()
GROUP BY
ORDER BY
Null handling
Multi-dimensional product, region, customer segment, discount, and time-period analysis

---

## Share — Tableau Visualization
The findings were converted into an interactive Tableau dashboard containing:

Revenue
Profit
Profit Margin
Completed Orders
Product Category Performance
Regional Performance
Discount Analysis
Quarterly Revenue Trends
Quarterly Profit Margin Trends
Product-Level Profitability Drill-Downs

---

## Act — Business Recommendations
The final stage converted analytical findings into specific actions that management could evaluate when planning sales, pricing, and profitability strategies.


## 📈 Dashboard Preview
Sales Growth & Revenue Opportunity Analysis

The Tableau dashboard consolidates the three business problems into one interactive decision-making tool.

Executive KPIs
KPI	Result
Total Revenue	$223,896,067
Total Profit	$95,791,780
Profit Margin	42.8%
Completed Orders	44,270
Dashboard Filters

Users can interact with the dashboard by filtering:

Region
Product Category
Discount Range
Transaction Year
Transaction Quarter
🔍 Key Findings
1. Software is the strongest-performing product category

What happened:
Software generated approximately $69.2M in revenue and $39.2M in profit, producing a 56.8% profit margin.

Why it matters:
Software combines strong revenue contribution with the highest profitability among the analyzed product categories.

Business implication:
Software represents an important area for future sales opportunities while maintaining strong margins.

2. The West is the strongest-performing region

What happened:
The West generated approximately $77.7M in revenue and $38.8M in profit, with a profit margin of approximately 49.9%.

Why it matters:
The region leads the business in both revenue and profitability.

Business implication:
The factors contributing to West's performance should be investigated for opportunities that may be transferable to other regions.

3. Software performs particularly strongly in the West

What happened:
West Software generated approximately $24.5M in revenue, $15.1M in profit, and a 61.7% profit margin.

Why it matters:
The combination of a high-performing product category and high-performing region produces particularly strong profitability.

Business implication:
Future sales efforts can prioritize Software opportunities, particularly within the West, while evaluating whether similar conditions can be replicated elsewhere.

4. Higher discounts are associated with lower profitability

What happened:
Profit margins declined across product categories as discount levels increased.

At the highest discount level of 30% or more, some categories experienced particularly weak profitability.

Why it matters:
Discounting may support sales activity, but excessive discounting can significantly reduce the profitability of those sales.

Business implication:
Discount policies should account for differences in product-category profitability rather than applying the same discount strategy universally.

5. Office Supplies becomes unprofitable at high discount levels

What happened:
Office Supplies reached approximately -13.7% profit margin at discount levels of 30% or more.

Why it matters:
Sales generated under these conditions can contribute revenue while destroying profitability.

Business implication:
High-discount Office Supplies transactions warrant tighter controls and additional pricing investigation.

6. Q2 2026 experienced a significant sales slowdown

What happened:
Revenue decreased from approximately $19.3M in Q1 2026 to $10.0M in Q2 2026.

Completed orders also declined from approximately 2.9K to 2.3K.

Profit margin decreased from approximately 42.9% to 41.6%.

Why it matters:
The decline affected both sales volume and revenue, making it important to distinguish between normal seasonality and a broader performance issue.

Business implication:
The business should investigate customer segments, regions, sales channels, and order behavior contributing to the decline before assuming it represents a long-term trend.

7. South Office Supplies revealed a concentrated profitability issue

What happened:
A deeper investigation of South Office Supplies showed that the profitability decline was concentrated among a relatively small number of products.

Presentation Binder 926 was the largest negative contributor, moving from approximately +$1.5K profit in Q1 2025 to -$11.4K in Q2 2025.

Why it matters:
The broader category-level decline does not necessarily require a broad category-wide response.

Business implication:
Product-level investigation can allow management to address specific profitability problems without unnecessarily changing the strategy for an entire category.

---

## 💼 Business Impact
This project demonstrates how transaction-level sales data can be converted into a structured framework for business decision-making.

The analysis can help leadership:

* Prioritize profitable growth by identifying combinations of products and regions generating strong revenue and margins.
* Protect profitability by identifying where aggressive discounting creates margin risk.
* Improve pricing decisions through category-specific analysis instead of relying on one company-wide discount strategy.
* Detect emerging sales declines by monitoring orders, revenue, and profitability over time.
* Target interventions more precisely by drilling from company-level trends into regions, categories, and individual products.
* Allocate sales resources more effectively using evidence from product and regional performance.

📌 In short: this project turns raw sales transactions into a decision-making tool for identifying growth opportunities, protecting profitability, and investigating performance risks before taking action.

---

## 🚀 Recommendations

Recommendation	Why It Matters
Prioritize Software growth opportunities | Software leads product categories in both revenue and profitability

Build on performance in the West | The West generates the strongest overall revenue and profit performance

Investigate Consulting profitability | Consulting produces substantial revenue but operates at a lower margin than Software

Implement category-specific discount controls | Product categories respond differently to higher discount levels

Restrict excessive discounting on low-margin categories	| Office Supplies becomes unprofitable at discounts of 30% or more

Investigate the 2026 sales slowdown	| Q2 2026 shows declines in revenue, completed orders, and profit margin

Use product-level interventions when losses are concentrated | The South Office Supplies analysis shows that a small number of products can drive broader profitability deterioration

---

## 🔮 Next Steps
This analysis provides a foundation for continued sales and profitability monitoring.

Potential extensions include:

* Complete 2026 analysis — reassess performance once a full year of transaction data becomes available.
* Customer-level analysis — investigate purchasing behavior and repeat activity by customer.
* Sales representative analysis — evaluate performance patterns across individual sales representatives.
* Pricing optimization — investigate optimal discount ranges by product category.
* Regional opportunity analysis — determine whether successful West-region strategies can be replicated elsewhere.
* Product profitability monitoring — create alerts or reporting processes for products that experience significant margin deterioration.
* Sales forecasting — use historical quarterly trends to estimate future demand after additional complete periods become available.
* Dashboard refresh automation — develop a repeatable process for incorporating new transaction data into reporting.

---

## 📁 Project Structure
Sales-Growth-Revenue-Opportunity-Analysis/
│
├── Data/
│   ├── Sales_Transaction_dirty.xlsx
│   └── Sales_Transaction_clean.xlsx
│
├── SQL/
│   └── Sales_Growth_Revenue_Opportunity_Analysis.sql
│
├── Tableau/
│   └── Tableau dashboard files
│
├── Images/
│   └── Dashboard screenshots
│
├── Presentation/
│   └── Sales_Growth_Revenue_Opportunity_Analysis_Presentation
│
└── README.md

Update the filenames above to match the exact names you use when uploading the files to GitHub.

---

## ⭐ Skills Demonstrated

Business Analysis Data Cleaning Excel SQL Google BigQuery Tableau Data Visualization Dashboard Design KPI Development Requirement Gathering Stakeholder Communication Profitability Analysis Pricing Analysis Sales Analytics Problem Solving Data Storytelling

---

## 📚 Key Takeaways

This project reinforced that strong data analysis begins before writing SQL or building a dashboard. Broad stakeholder concerns first had to be translated into clear business objectives, metrics, scope, and success criteria.

The project also demonstrated the importance of moving from high-level performance to root-cause investigation. A decline in profitability at the category or regional level does not automatically justify a broad business change. In the South Office Supplies analysis, drilling down to individual products revealed that a relatively small number of products were responsible for much of the deterioration.

Finally, the project demonstrates an end-to-end analytics workflow across Excel, SQL, and Tableau: preparing imperfect data, translating stakeholder needs into analytical questions, querying the data, identifying meaningful patterns, building an interactive dashboard, and converting those findings into actionable business recommendations.
