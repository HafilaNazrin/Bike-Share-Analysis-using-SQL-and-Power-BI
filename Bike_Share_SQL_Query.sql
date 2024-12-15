-- To join All Table
With CTE AS(
Select *
From bike_share_year_0
Union All 
Select *
From bike_share_year_1
)
-- To Join Union With Left join 
Select dteday,
season,A.yr,
weekday,hr,
rider_type,riders,
price,riders*price As Revenue,
(riders*price)-COGS as Profit,COGS
From CTE as A
left join cost_table as B
	on A.yr = B.yr;


