CREATE TABLE netflix
(
    show_id      VARCHAR(6),
    type         VARCHAR(10),
    title        VARCHAR(150),
    director     VARCHAR(210),
    casts        VARCHAR(1000),
    country      VARCHAR(150),
    date_added   VARCHAR(50),
    release_year INT,
    rating       VARCHAR(10),
    duration     VARCHAR(15),
    listed_in    VARCHAR(100),
    description  VARCHAR(250)
);

SELECT COUNT(*) AS total_content FROM netflix;

SELECT 
DISTINCT type
FROM netflix;

SELECT 
DISTINCT rating
FROM netflix;

--15 Business Problems

--Problem 1 : Count no of movies vs tv shows
SELECT type ,COUNT(*) AS total_count
FROM netflix
GROUP BY type;

--Problem 2 : Find the most common rating for the movie and tv shows
WITH RatingCounts AS (
  SELECT type, rating, COUNT(*) AS rating_count
  FROM netflix
  WHERE type IN ('Movie', 'TV Show')
  GROUP BY type, rating
)
SELECT type , rating
FROM RatingCounts rc
WHERE rating_count = (
  SELECT MAX(rating_count)
  FROM RatingCounts
  WHERE rc.type = type
);

--Problem 3 : List all the movies released in a specific year(eg.,2020)
SELECT title
FROM netflix
WHERE 
	type='Movie'
	AND 
	release_year='2020';

--Problem 4 : Find the 5 topmost countries with more content on netflix
SELECT
	UNNEST(STRING_TO_ARRAY(country,',')) as new_country,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC;

--problem 5 : Identify the longest movie
SELECT *
FROM netflix
WHERE
	type='Movie'
	AND
	duration = (SELECT MAX(duration) FROM netflix);

--Problem 6 : Find the content added in the last 5 years
SELECT * 
FROM netflix
WHERE 
	TO_DATE(date_added,'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';

--Problem 7 : Find all the movies/TV shows by the director Rajiv Chilaka
SELECT *
FROM netflix
WHERE director like '%Rajiv Chilaka%';

--Problem 8 : List all TV shows with more than 5 seasons
SELECT title,
	   duration
FROM netflix
WHERE 
	type='TV Show'
	AND
	SPLIT_PART(duration, ' ' ,1)::numeric > 5;

--Problem 9 : Count the no of content items in each genre
SELECT 
	   UNNEST(STRING_TO_ARRAY(listed_in,','))AS genre,
	   COUNT(show_id)
FROM netflix
	   GROUP BY 1;

--Problem 10 : Find the average number of content released by India for each year 
--and return top 5 year with highest average
SELECT
	EXTRACT(YEAR FROM TO_DATE(date_added,'Month DD, YYYY')) as year,
	Count(*) AS total_content,
	ROUND(
	COUNT(*):: numeric/(SELECT COUNT(*) FROM netflix WHERE country='India')::numeric*100,2)
	as avg_content_per_year
FROM netflix
WHERE country='India'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--Problem 11 : List all the movies that are documenteries
SELECT title, listed_in
FROM netflix 
WHERE 
	type='Movie'
	AND
	listed_in LIKE '%Documentaries%';

--Problem 12 : Find all the content without a director
SELECT *
FROM netflix
WHERE director IS NULL;

--Problem 13 : Find in how many movies actor 'Salman Khan' appeared in last 10 years
SELECT *
FROM netflix 
WHERE
	casts ILIKE '%Salman Khan%'
	AND
	type='Movie'
	AND
	release_year >= EXTRACT(YEAR FROM CURRENT_DATE)-10;

--Problem 14 : Find the top 10 actors who have appeared 
--in the highest number of movies/tv shows produced in India
SELECT 
	UNNEST(STRING_TO_ARRAY(casts,',')) AS actors, 
	Count(*) as total_content
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


--Problem 15 : Categorize the content based on the presence of the keywords 'kill' and 'violence'
--in the description field.Label content containing these keywords as 'Bad' and all other
--content as 'Good'. Count how many items fall into each category
SELECT
       CASE 
	   WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad Content'
	   ELSE 'Good Content'
	   END category,
	   COUNT(*)
FROM netflix
GROUP BY category;

	

	
	   


