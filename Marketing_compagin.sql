create table compaign(
date  date,
platform  varchar(100),
campaign_type varchar(100),
industry varchar(100),
country varchar(50),
impressions int,
clicks decimal(10,2),
Click_Through_Rate decimal(10,2),
Cost_Per_Click decimal(10,2),
ad_spend decimal(10,2),
conversions int,
Cost_Per_Acquisition decimal(10,2),
revenue decimal(10,2),
Return_On_Ad_Spend decimal(10,2)
)


select * from compaign


--🟢 Basic SQL Questions

-- Q1 Table me total kitne records hain?
select count(*) from compaign

--Q2 Total revenue calculate karo.
select sum(revenue) from compaign

--Q3 Total ad spend calculate karo.
select sum(ad_spend) from compaign

--Q4 Platform wise total impressions nikalo.
select platform ,sum(revenue) as total_revenue from compaign
group by platform

--Q5 Country wise total clicks nikalo.
select
	country,
	sum(clicks)as total_clicks
from compaign
group by country

--Q6 Campaign type wise total conversions calculate karo.
select campaign_type , sum(conversions) as total_conversions 
from compaign
group by campaign_type

--Q7 Dataset me unique platforms kaun-kaun se hain?
select distinct count(platform) from compaign
--Q8 Maximum revenue kis record me hai?
select * from compaign
order by revenue desc
limit 1

--Q9 Minimum CPC find karo.
select * from compaign 
where  Cost_Per_Click =(select min(Cost_Per_Click) from compaign)

--Q10 Top 5 countries by revenue.
select 
	country,
	sum(revenue)as total_revenue
from compaign
group by country
order by total_revenue desc
limit 5

-- Q 11 2nd Highest Revenue
SELECT REVENUE FROM COMPAIGN 
ORDER BY REVENUE DESC
LIMIT 1 OFFSET 1

--🟡 Intermediate SQL Questions

-- Q12 Platform wise total revenue aur ad spend calculate karo.
select
	PLATFORM,
	sum(revenue)as total_revenue,
	sum(ad_spend) as total_ad_spend
from compaign
group by platform

-- Q13 Campaign type wise average CTR nikalo.
select Campaign_type , avg(Cost_Per_Click) from compaign
group by Campaign_type

-- Q14 Country wise average CPC calculate karo.
select 
	country,
	avg("Click Through Rate")as CTR
from compaign
group by country
order by CTR desc

-- Q15 Industry wise total conversions calculate karo.
select
	industry,
	sum(conversions) as conversions
	from compaign
	group by industry

-- Q16 Platform wise average ROAS calculate karo.
select
	platform,
	avg("Return On Ad Spend") as ROAS
	from compaign
	group by platform

-- Q17 Highest revenue generate karne wali platform kaunsi hai?
select platform , sum(revenue) as revenue
from compaign 
group by platform
order by revenue desc

-- Q18 Sabse zyada conversions kis campaign type se aaye hain?
select campaign_type ,sum(conversions) as conversions from compaign
group by campaign_type
order by conversions desc
limit 1

-- Q19 Har country ka total ad spend find karo.
select country , sum(ad_spend) as spend
from compaign
group by country
order by spend desc

-- Q20 Revenue descending order me data sort karo.
select revenue from compaign
order by revenue desc

-- Q21 Har platform ke top 3 revenue records nikalo.
select *
from(
	select *,
			rank() over(partition by platform order by revenue desc) as rank_no
			from compaign
)t
where rank_no <=3



--🔴 Advanced SQL Questions

--Q22 Profit calculate karo (Revenue − Ad Spend).
select (revenue - ad_spend) as profit from compaign 

--Q23 Platform wise profit calculate karo.
select platform, sum(revenue - ad_spend) as profit from compaign
group by platform

--Q24 Month wise total revenue trend nikalo.
select 
	extract('month' from date ) as month,
	sum(revenue) as revenue
	from compaign
	group by month
	order by month
	
--Q25 Month wise total conversions calculate karo.
select 
	extract('month' from date ) as month,
	sum(conversions) as conversions
	from compaign
	group by month
	order by month
--Q26 Highest ROI wala platform find karo.
select 
	platform,
	sum(revenue) as Total_revenue,
	sum(ad_spend) as total_spend,
	sum(revenue-ad_spend) as profit,
	sum(revenue)/sum(ad_spend) as ROI
	from compaign
	group by platform
	order by ROI desc

--Q27 Country wise conversion rate calculate karo.
select 
	country,
	sum(conversions) as conversions,
	sum(clicks) as total_click,
	(sum(conversions)*100/sum(clicks)) as conversion_rate
	from compaign
	group by country
	order by conversion_rate desc
	
--Q28 Har platform ka highest revenue campaign find karo (Window Function).
select *
from(
	select *,
			rank() over(partition by platform order by revenue desc) as rank_no
			from compaign
)t
where rank_no <=1

--Q29 Top 5 profitable campaigns identify karo.
select
	campaign_type,
	round(sum(revenue -ad_spend)::numeric,2) as Total_profit
	from compaign
	group by campaign_type 
	order by Total_profit desc
	limit 5
--Q30 Industry wise revenue contribution percentage calculate karo.
select
	industry,
	Round(sum(revenue)::numeric,2)as Total_revenue,
	Round(((sum(revenue)/sum(sum(revenue))over())*100) ::numeric,2)as contribution_percentage 
	from compaign
	group by industry
	order by Total_revenue desc
	
--Q31 Har platform ka cumulative revenue calculate karo.
select
	platform,
	"date",
	revenue,
	sum(revenue)over(partition by platform order by date ) as cumulative_revenue
	from compaign

--Q32 Kaunsi platform highest ROAS generate kar rahi hai?
select platform , sum("Return On Ad Spend") as ROAS from compaign
group by platform
order by ROAS