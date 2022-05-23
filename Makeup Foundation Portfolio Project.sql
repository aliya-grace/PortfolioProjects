--–What are the top ten highest rated brands with best-selling foundations through this website?

--—-Looking at the website's highest rating vs the lowest rating.
SELECT MIN(avg_rating) AS min_rating,
	MAX(avg_rating) AS max_rating
FROM CaseStudy1..FoundationMasterv2

--–-Looking for how many brands are rated higher than or equal to 4.5 stars.
SELECT COUNT(distinct brand) AS NumHighestRated
FROM CaseStudy1..FoundationMasterv2
WHERE avg_rating >=4.5

--–Ordering the 10 brands with highest ratings from highest to lowest.  
SELECT brand, avg_rating
FROM CaseStudy1..FoundationMasterv2
WHERE avg_rating >=4.5
ORDER BY avg_rating DESC

--–What are the top 10 most reviewed brands?
--Looking at how many brands have more than 5300 reviews. 
SELECT COUNT(distinct brand) AS NumMostReviewed
FROM CaseStudy1..FoundationMasterv2
WHERE num_reviews >5300

--Looking at the top 10 most reviewed brands. 
SELECT brand, num_reviews 
FROM CaseStudy1..FoundationMasterv2
WHERE num_reviews >5300
ORDER BY num_reviews DESC

--Which brands are both the highest rated AND most reviewed?
SELECT brand, avg_rating, num_reviews 
FROM CaseStudy1..FoundationMasterv2
WHERE num_reviews >5300 AND avg_rating >=4.5

--–What is the average price for higher-rated products?
--Row 1: Average price for products with more than 5300 reviews.
SELECT AVG(price) AS Average_Price
FROM CaseStudy1..FoundationMasterv2
WHERE num_reviews >5300
UNION ALL
---Row 2: Average price for products with less than 5300 reviews.
SELECT AVG(price) AS Average_Price
FROM CaseStudy1..FoundationMasterv2
WHERE num_reviews <5300

--Are brands that are cruelty-free rated higher than brands that are not?
SELECT brand, avg_rating, cruelty_free
FROM CaseStudy1..FoundationMasterv5
WHERE cruelty_free = 'Yes'
ORDER BY avg_rating DESC

--How many cruelty-free brands are also the most reviewed?
SELECT brand, num_reviews, cruelty_free
FROM CaseStudy1..FoundationMasterv5
WHERE cruelty_free = 'Yes'
ORDER BY num_reviews DESC

--–What is the average price, average rating, and average number of reviews of a foundation from a cruelty-free brand?
---Row 1: Cruelty-free
SELECT AVG(price) AS AvgPrice, AVG(avg_rating) AS AvgRating, AVG(num_reviews) AS AvgReviews
FROM CaseStudy1..FoundationMasterv5
WHERE cruelty_free = 'Yes'
UNION ALL
--Row 2: Not cruelty-free 
SELECT AVG(price) AS AvgPrice, AVG(avg_rating) AS AvgRating, AVG(num_reviews) AS AvgReviews
FROM CaseStudy1..FoundationMasterv5
WHERE cruelty_free = 'No'

--List of brands with the highest number of average reviews and their cruelty-free status.
SELECT brand, cruelty_free, AVG(num_reviews) AS Average_NumReviews
FROM CaseStudy1..FoundationMasterv5
GROUP BY brand, cruelty_free
ORDER BY Average_NumReviews DESC 

–--Average price/rating/number of reviews of sheer vs full coverage foundations
--Row 1: Sheer Coverage Foundations
SELECT AVG(price) AS Average_Price, AVG(num_reviews) AS Avg_NumReviews, AVG(avg_rating) AS Average_Rating
FROM CaseStudy1..FoundationMasterv2
WHERE coverage= 'Sheer'
UNION ALL
---Row 2: Full Coverage Foundations
SELECT AVG(price) AS Average_Price, AVG(num_reviews) AS Avg_NumReviews, AVG(avg_rating) AS Average_Rating
FROM CaseStudy1..FoundationMasterv2
WHERE coverage= 'Full'

--–Looking at which brands carry the most options for consumers within the Dark/Deep shade ranges. 
---For consumers within the Dark shade range.
SELECT brand, 
	COUNT(distinct shade_range) AS TotalShadeRange,
	COUNT(CASE WHEN shade_range='Fair' THEN 1 END) AS FairCount,
	COUNT(CASE WHEN shade_range='Light' THEN 1 END)AS LightCount,
	COUNT(CASE WHEN shade_range='Dark' THEN 1 END)AS DarkCount,
	COUNT(CASE WHEN shade_range='Deep' THEN 1 END)AS DeepCount
FROM CaseStudy1..FoundationMaster
GROUP BY brand
ORDER BY DarkCount DESC 

---For consumers within the Deep shade range.
SELECT brand, 
	COUNT(distinct shade_range) AS TotalShadeRange,
	COUNT(CASE WHEN shade_range='Fair' THEN 1 END) AS FairCount,
	COUNT(CASE WHEN shade_range='Light' THEN 1 END)AS LightCount,
	COUNT(CASE WHEN shade_range='Dark' THEN 1 END)AS DarkCount,
	COUNT(CASE WHEN shade_range='Deep' THEN 1 END)AS DeepCount
FROM CaseStudy1..FoundationMaster
GROUP BY brand
ORDER BY DeepCount DESC

---For consumers within the Fair shade range.
SELECT brand, 
	COUNT(distinct shade_range) AS TotalShadeRange,
	COUNT(CASE WHEN shade_range='Fair' THEN 1 END) AS FairCount,
	COUNT(CASE WHEN shade_range='Light' THEN 1 END)AS LightCount,
	COUNT(CASE WHEN shade_range='Dark' THEN 1 END)AS DarkCount,
	COUNT(CASE WHEN shade_range='Deep' THEN 1 END)AS DeepCount
FROM CaseStudy1..FoundationMaster
GROUP BY brand
ORDER BY FairCount DESC

---For consumers within the Light shade range.
SELECT brand, 
	COUNT(distinct shade_range) AS TotalShadeRange,
	COUNT(CASE WHEN shade_range='Fair' THEN 1 END) AS FairCount,
	COUNT(CASE WHEN shade_range='Light' THEN 1 END)AS LightCount,
	COUNT(CASE WHEN shade_range='Dark' THEN 1 END)AS DarkCount,
	COUNT(CASE WHEN shade_range='Deep' THEN 1 END)AS DeepCount
FROM CaseStudy1..FoundationMaster
GROUP BY brand
ORDER BY LightCount DESC


