## 15 Business Problems

### Problem 1 : Count no of movies vs tv shows </font>
SELECT type ,COUNT(*) AS total_count
FROM netflix
GROUP BY type;

<img width="364" height="110" alt="image" src="https://github.com/user-attachments/assets/762a58e9-ed78-4691-a588-077a24758fdd" />

### --Problem 2 : Find the most common rating for the movie and tv shows
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

<img width="433" height="114" alt="image" src="https://github.com/user-attachments/assets/0a3edf32-fb8a-4b63-baf4-23332202f10f" />

### --Problem 3 : List all the movies released in a specific year(eg.,2020)
SELECT title
FROM netflix
WHERE 
	type='Movie'
	AND 
	release_year='2020';

 <img width="609" height="324" alt="image" src="https://github.com/user-attachments/assets/59411905-e6d1-4705-b1c6-394804ceb393" />

### --Problem 4 : Find the 5 topmost countries with more content on netflix
SELECT
	UNNEST(STRING_TO_ARRAY(country,',')) as new_country,
	COUNT(show_id) as total_content
FROM netflix
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

<img width="311" height="202" alt="image" src="https://github.com/user-attachments/assets/527d06fd-d7bd-4f23-88f7-4e7d55658f82" />

### --Problem 5 : Identify the longest movie
SELECT title,duration
FROM netflix
WHERE
	type='Movie'
	AND
	duration = (SELECT MAX(duration) FROM netflix);

 <img width="687" height="326" alt="image" src="https://github.com/user-attachments/assets/f6f4c6df-fd42-46ac-9673-227c5ae5cdc9" />

### --Problem 6 : Find the content added in the last 5 years
SELECT * //to fit the output, i have selected only 3 columns type , title and date_added
FROM netflix
WHERE 
	TO_DATE(date_added,'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';
 
<img width="942" height="317" alt="image" src="https://github.com/user-attachments/assets/d689922a-cf75-4eb3-9a66-2dd217a23aa6" />

### --Problem 7 : Find all the movies/TV shows by the director Rajiv Chilaka
SELECT *
FROM netflix
WHERE director like '%Rajiv Chilaka%';

<img width="1550" height="720" alt="image" src="https://github.com/user-attachments/assets/3b0d2cd5-4637-4e03-826e-de404ad9cc7a" />

### --Problem 8 : List all TV shows with more than 5 seasons
SELECT title,
	   duration
FROM netflix
WHERE 
	type='TV Show'
	AND
	SPLIT_PART(duration, ' ' ,1)::numeric > 5;
 
 <img width="508" height="326" alt="image" src="https://github.com/user-attachments/assets/8598a207-343d-466d-aeaf-f9531977b45c" />

### --Problem 9 : Count the no of content items in each genre
SELECT 
	   UNNEST(STRING_TO_ARRAY(listed_in,','))AS genre,
	   COUNT(show_id)
FROM netflix
	   GROUP BY 1;

  <img width="383" height="325" alt="image" src="https://github.com/user-attachments/assets/17846a47-c935-4a1d-9bb7-01770df227a8" />

### --Problem 10 : Find the average number of content released by India for each year and return top 5 year with highest average
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

<img width="465" height="206" alt="image" src="https://github.com/user-attachments/assets/1d204cee-5426-4884-acbd-e38f8e7f89ac" />

### --Problem 11 : List all the movies that are documenteries
SELECT title, listed_in
FROM netflix 
WHERE 
	type='Movie'
	AND
	listed_in LIKE '%Documentaries%';

 <img width="1238" height="310" alt="image" src="https://github.com/user-attachments/assets/32e0140e-8d8b-4c7c-8d79-d8d0b044a73f" />

### --Problem 12 : Find all the content without a director
SELECT *
FROM netflix
WHERE director IS NULL;

<img width="1593" height="299" alt="image" src="https://github.com/user-attachments/assets/501d4008-9ea7-4f87-8d94-fa31350bf11c" />

### --Problem 13 : Find in how many movies actor 'Salman Khan' appeared in last 10 years
SELECT *
FROM netflix 
WHERE
	casts ILIKE '%Salman Khan%'
	AND
	type='Movie'
	AND
	release_year >= EXTRACT(YEAR FROM CURRENT_DATE)-10;

 <img width="1263" height="113" alt="image" src="https://github.com/user-attachments/assets/6bd8052c-9276-45d2-9191-dd71abbdc471" />

### --Problem 14 : Find the top 10 actors who have appeared 
--in the highest number of movies/tv shows produced in India
SELECT 
	UNNEST(STRING_TO_ARRAY(casts,',')) AS actors, 
	Count(*) as total_content
FROM netflix
WHERE country ILIKE '%India%'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

<img width="349" height="320" alt="image" src="https://github.com/user-attachments/assets/8520712e-afe9-49af-be43-12ea7c107253" />

### --Problem 15 : Categorize the content based on the presence of the keywords 'kill' and 'violence'in the description field.Label content containing these keywords as 'Bad' and all othercontent as 'Good'. Count how many items fall into each category
SELECT
       CASE 
	   WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad Content'
	   ELSE 'Good Content'
	   END category,
	   COUNT(*)
FROM netflix
GROUP BY category;

<img width="266" height="106" alt="image" src="https://github.com/user-attachments/assets/0a407d32-c785-48a8-ac1b-c2eba486067f" />
