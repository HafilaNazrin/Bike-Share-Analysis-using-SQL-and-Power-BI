# Bike-Share-Analysis-using-SQL-and-Power-BI
Welcome to my blog on Developing reports with Power BI! Power BI is a powerful business intelligence tool by Microsoft that transforms data into visually appealing and insightful reports and dashboards. Whether you’re a business professional, data analyst, or someone curious about data visualization, this guide will help you take your first steps into the world of Power BI and unleash its full potential.

![Dashboard](https://github.com/user-attachments/assets/2de5f307-75ce-453b-9bf4-8331b3d456e0)

Data analysis is a game-changer for optimizing business operations, empowering informed decisions and strategic planning. Recently, I worked on a project where I analyzed sales data from an Adidas Store, designed an interactive dashboard, and visualized the insights using Excel. In this article, I’ll walk you through my approach, from collecting the data to crafting the interactive dashboard.

## Objective
The client wanted to know about a few Metrics which are,
1. Hourly revenue analysis
2. Profit and Revenue Trends
3. Seasonal Revenue
4. Rider Demographics
An Estimated Timeline for Completion and Recommendation on Raising Prices Next Year.

![Bike Share Wireframe](https://github.com/user-attachments/assets/c6b0375e-6288-4010-95c6-a80a6b42da29)

## Cleaning Data
Using SQL Query we created a database for the source and imported the CSV files. After analysing the dataset of two sheets consisting of year 2021 and 2022, I planned to make it into one dataset using the Union with CTE Table.

-- To join All Table
With CTE AS(
Select *
From bike_share_year_0
Union All 
Select *
From bike_share_year_1
)

After the union, the Revenue and Profit were calculated,

Select riders,COGS
price,riders*price As Revenue,
(riders*price)-COGS as Profit
From CTE as A;

Then the cost table was joined using left join,

Select dteday,
season,A.yr,
weekday,hr,
rider_type,riders,
price,riders*price As Revenue,
(riders*price)-COGS as Profit,COGS
From CTE as A
left join cost_table as B
 on A.yr = B.yr;

 And the final Table was ready to be deployed in the Power BI to Develop the Report as per the client need.

 ## To Create Dashboard
Import the data from the SQL server and create the tables according to the approved Wireframe.

![Line Chart](https://github.com/user-attachments/assets/93acee7a-1d45-4a74-9cfd-09fec5743cc9)

![Chart](https://github.com/user-attachments/assets/7fd41b2b-9f87-4702-b2ec-9ce8ab574381)

Then, to understand the Weekly Revenue Generated, I created a table representing the Weekly Revenue sales between the peak hours of 7 a.m. and 9 p.m.

![Weekly Sales](https://github.com/user-attachments/assets/7cbdc9ec-02ce-4c45-aeed-bdd190e466f5)

## Conclusion
Comparing both years, in 2022 the demand has increased by 64% even after a rise in price by 25%.
Considering the last year, we can increase the price by 10–15% which is around $5.49 to $5.74 which won't affect the Customers.
By this raise customer retention can be focused.
We can't increase the price by more than 20% which in accordance with the price elasticity if we increase the price more then we may face an increase in Customer churn rate.

You can check my Dashboard that I made using Power BI.
Thanks for reading, see my profile for more Data Analysis projects!
