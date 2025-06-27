select sum(total_price) as Total_Revenue
from pizza_sales
;
GO
select *
from pizza_sales
;
GO
select sum(total_price) / count(distinct order_id) as Avg_Order_Value
FROM pizza_sales
;
GO
select sum(quantity) as Total_pizzas_Sold
from pizza_sales
;
GO
select count(distinct order_id) as Total_Orders
from pizza_sales
;
go
SELECT 
CAST(CAST(SUM (quantity) as DECIMAL (10,2)) / 
CAST(count (DISTINCT order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS AVG_pizzas_order
FROM pizza_sales
;
GO 
SELECT 
  DATEPART(WEEKDAY, order_date) AS weekday_number,
  DATENAME(WEEKDAY, order_date) AS order_day,
  COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DATEPART(WEEKDAY, order_date), DATENAME(WEEKDAY, order_date)
ORDER BY weekday_number;
;
GO
SELECT DATEPART(HOUR,order_time)as order_hours,count(DISTINCT order_id) as total_orders
from pizza_sales
GROUP BY DATEPART(HOUR,order_time)
ORDER BY DATEPART(HOUR,order_time)
;
GO
SELECT 
	pizza_category ,
	cast(sum(total_price) as DECIMAL(10,2))as total_sales,
	CAST( sum(total_price) * 100 / 
		(SELECT sum(total_price)FROM pizza_sales)AS DECIMAL(10,2)) as PCT
FROM pizza_sales
GROUP BY pizza_category
;
GO
SELECT 
  pizza_size,
  cast(SUM(total_price) AS DECIMAL(10,2))as total_sales,
  CAST(SUM(total_price) * 100.0 / 
       (SELECT SUM(total_price)
	   FROM pizza_sales 
	   where DATEPART(quarter , order_date)=1) AS DECIMAL(10,2)) AS pct
FROM pizza_sales
where DATEPART(quarter , order_date)=1
GROUP BY pizza_size
ORDER BY PCT DESC
; 
GO
SELECT pizza_category ,
		sum(quantity) as total_pizzas_sold
from pizza_sales
GROUP BY pizza_category
;
GO
select top 5 pizza_name,
		sum(quantity) as Total_Pizza_Sold
from pizza_sales 
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
;
GO
SELECT top 5 pizza_name ,
		sum(quantity)as total_pizza_sold
from pizza_sales
--where month (order_date)=1
group BY pizza_name
ORDER BY total_pizza_sold asc
;
GO
