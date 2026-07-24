From Click to Checkout: E-commerce Performance Analytics

The rapid growth of e-commerce has transformed how businesses attract, engage, and convert customers. While increased online traffic creates more opportunities for sales, understanding how customers navigate a website and where they drop off is essential for improving business performance. Data-driven analysis enables businesses to identify conversion bottlenecks, evaluate product performance, and optimize the overall customer experience.

This project analyzes Fuzzy Factory's business performance using SQL and Power BI, focusing on sales trends, product performance, website usability, and customer conversion to deliver actionable business insights.

Points to Analyze
Website Traffic Analysis
Analyze traffic sources, landing pages, and visitor acquisition channels.
Customer Journey Analysis
Examine how visitors navigate from landing pages to product pages throughout the website.
Conversion Funnel Analysis
Identify conversion rates and drop-off points at each stage of the purchasing journey.
Product Performance Analysis
Evaluate product-wise orders, revenue contribution, and refund rates to understand product performance.
Business Performance Analysis
Assess revenue, profit, average order value, and yearly sales trends to measure overall business performance.
Business Recommendations
Provide data-driven recommendations to improve website conversion, customer experience, product performance, and revenue growth.

Data Preparation

The first step of the analysis involved preparing the raw datasets to ensure they were accurate, consistent, and ready for business analysis. The datasets were initially imported using Python (Pandas),where data cleaning and transformation steps were applied.then explored the data to undertsand the structure of data.
After validation, the cleaned datasets were loaded into a MySQL database to create a structured relational data environment.Our datasets in a nutshell can be seen from the diagram below.
<img width="1024" height="500" alt="image" src="https://github.com/user-attachments/assets/90db2477-1c23-493c-8a47-e4429347ff70" />

The Customer Journey
1. The first Click - customer accquisation
The journey begins when a visitor lands on the website. The first objective was to understand where customers are coming from and which marketing channels generate the highest-quality traffic.
<img width="570" height="113" alt="image" src="https://github.com/user-attachments/assets/6a19d5cf-526d-4cb9-b291-8117b4c1fd24" />
While Google Search drives higher overall traffic and revenue, Bing Search achieves a significantly better conversion rate.
Lander-5 has the higest conversion rate but the primary landing page for both google and bing search is lander-2.
<img width="517" height="187" alt="image" src="https://github.com/user-attachments/assets/84ac82d2-3090-45c6-b9b0-4a514a872169" />
<img width="1173" height="502" alt="image" src="https://github.com/user-attachments/assets/1c65f24d-3a64-4dc3-b096-440549acda82" />
