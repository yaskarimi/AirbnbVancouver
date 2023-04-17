-- take a look at the data
SELECT *
FROM listings
WHERE id is NOT null
;
-- number of records(how many airbnbs we have in our data)
SELECT COUNT(*)
FROM listings;

-- detecting the outliers

SELECT 
        if(price<250,1,0) as none_outliers,count(*)
FROM listings
where  if(price<250,1,0)= 1
group by none_outliers;

-- max,min and average of prices per night in the data 
SELECT min(price),
		max(price),
        std(price) as data_alter,
        AVG(price)
        FROM listings;

-- average price per location

SELECT neighbourhood,
	AVG(price) as average_price_per_night
FROM listings
WHERE id is not null and if(price<250,1,0)= 1
GROUP BY neighbourhood
ORDER BY average_price_per_night DESC;  

-- 5 lowest prices 
SELECT name,
	neighbourhood,
    price,
    room_type
FROM listings 
GROUP BY name, neighbourhood,price,room_type
ORDER BY price
LIMIT 5
;
-- 10 Airbnbs with lowest prices for airbnbs that are renting the entire place

SELECT name, price
FROM listings
WHERE room_type = "Entire home/apt" and id is not null 
GROUP BY name,price
ORDER BY price 
limit 10

;


 -- average price by room type
 
 SELECT AVG(price) as average_price,room_type
 FROM listings
 where  if(price<250,1,0)= 1
 GROUP BY room_type;

-- average reviews per month in every neighbourhood
 SELECT AVG(reviews_per_month) as avg_reviews,
	neighbourhood
 FROM listings
 where  if(price<250,1,0)= 1
 GROUP BY neighbourhood
 ORDER BY avg_reviews DESC
 ;
