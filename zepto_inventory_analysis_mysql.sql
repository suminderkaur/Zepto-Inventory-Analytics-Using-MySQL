
Use zeptostore;

drop table if exists zepto1;

-- Imported the data from the csv file

-- added an ID column
ALTER TABLE zepto1 
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;

ALTER TABLE zepto1                                          -- altered column name 
CHANGE COLUMN `ï»¿Category` Category VARCHAR(255);

Select * from zepto1;                                        -- view of table

-- Count of rows
SELECT Count(*) From zepto1; 

-- Types of categories
SELECT Distinct category from zepto1;

-- Total number of categories
 SELECT count(Distinct category) from zepto1;
 
 -- Check for Null values
 SELECT 
    *
FROM
    zepto1
WHERE
    category IS NULL OR name IS NULL
        OR discountPercent IS NULL
        OR availableQuantity IS NULL
        OR discountedSellingPrice IS NULL
        OR weightInGms IS NULL
        OR outOfStock IS NULL
        OR quantity IS NULL;
        
-- Total products in each category

Select category, COUNT(Distinct name) as total_products 
From zepto1
Group by category
Order by total_products DESC;


-- out of stock versus in stock

SELECT outOfStock, COUNT(id) from zepto1
Group by outOfStock;

-- Number of different products available by name

select name, count(id) as numberofproducts
from zepto1
group by name
HAVING numberofproducts >1
order by numberofproducts DESC;

-- Data cleaning 
Select * from zepto1
WHERE mrp = 0;


DELETE from zepto1
where mrp = 0;


-- covert paise to ruppee
update zepto1
SET mrp = mrp/100.0, discountedSellingPrice= discountedSellingPrice/100.0;


Select * from zepto1;

-- Find the top  10 best value products based on the discount percentage. 
select Distinct name, mrp, discountPercent
FROM zepto1
order by discountPercent DESC
LIMIT 10;
-- what are the products with high mrp but out of stock?
Select Distinct name, mrp, outofstock from zepto1
WHERE outOfStock = 'True' AND mrp > 300
order by mrp DESC;


-- calculate estimated revenue for each category
Select distinct category, SUM(availableQuantity*discountedSellingPrice) total_revenue
From zepto1
Group by category
Order by total_revenue DESC;

-- Find all products where mrp is greated than 500 and discount is less than 10%

Select Distinct name, mrp, discountPercent From zepto1 
where mrp >500 AND discountPercent <10
Order by mrp Desc, discountPercent Desc;


-- Identify the top 5 categories offering the highest average discount percentage.
Select category, round(avg(discountPercent),1) as max_discount
from zepto1
group by category
Order by max_discount Desc
Limit 5;

-- find the price per gram for products above 100g and sort by best value
Select distinct name, weightInGms,discountedSellingPrice, Round((discountedSellingPrice/weightInGms),2) as price_per_gram 
From zepto1
Where weightInGms >= 100
Order by price_per_gram ASC;

-- Group the products into categories like low, medium and bulk
Select distinct name, weightInGms,
case when  weightInGms< 1000 Then 'Low'
when weightInGms <5000 then 'Medium'
Else 'Bulk'
End weight_category
from zepto1;


-- what is the total investory weight per category? 
select category, SUM(weightInGms * availableQuantity) as inventory_weight
from zepto1
Group by category
order by inventory_weight DESC;

-- Packaging Strategy
SELECT 
    CASE 
        WHEN name LIKE '%Pack of%' OR name LIKE '%Combo%' THEN 'Bundle'
        ELSE 'Single Item'
    END AS type_of_packs,
    AVG(discountPercent) AS average_discount_percentage
FROM zepto1
GROUP BY type_of_packs;







