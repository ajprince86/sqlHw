Exercise 1 — Tasks

-- Find the title of each film ✓
-- Find the director of each film ✓
-- Find the title and director of each film ✓
-- Find the title and year of each film ✓
-- Find all the information about each film ✓

-- SELECT title FROM movies;
-- SELECT director FROM movies;
-- SELECT title, director FROM movies;
-- SELECT title, year FROM movies;
-- SELECT * FROM movies;

Exercise 2 — Tasks

-- Find the movie with a row id of 6 ✓
-- Find the movies released in the years between 2000 and 2010 ✓
-- Find the movies not released in the years between 2000 and 2010 ✓
-- Find the first 5 Pixar movies and their release year ✓

-- SELECT title FROM movies WHERE id = 6;
-- SELECT title FROM movies WHERE year BETWEEN 2000 AND 2010;
-- SELECT title FROM movies WHERE year NOT BETWEEN 2000 AND 2010;
-- SELECT * FROM movies WHERE id in (1,2,3,4,5);

Exercise 3 — Tasks

-- Find all the Toy Story movies ✓
-- Find all the movies directed by John Lasseter ✓
-- Find all the movies (and director) not directed by John Lasseter ✓
-- Find all the WALL-* movies ✓

-- SELECT title FROM movies WHERE title LIKE '%toy%';
-- SELECT title FROM movies WHERE director LIKE '%john%';
-- SELECT title, director FROM movies WHERE director NOT LIKE "John Lasseter";
-- SELECT title FROM movies WHERE title LIKE '%WALL%'

Exercise 4 — Tasks

-- List all directors of Pixar movies (alphabetically), without duplicates ✓
-- List the last four Pixar movies released (ordered from most recent to least) ✓
-- List the first five Pixar movies sorted alphabetically ✓
-- List the next five Pixar movies sorted alphabetically ✓

-- SELECT DISTINCT director FROM movies ORDER BY director;
-- SELECT title,year FROM movies ORDER BY year DESC LIMIT 4;
-- SELECT title,year FROM movies ORDER BY title ASC LIMIT 5;
-- SELECT title,year FROM movies ORDER BY title ASC LIMIT 5 OFFSET 5;

Review 1 — Tasks

-- List all the Canadian cities and their populations ✓
-- Order all the cities in the United States by their latitude from north to south ✓
-- List all the cities west of Chicago, ordered from west to east ✓
-- List the two largest cities in Mexico (by population) ✓
-- List the third and fourth largest cities (by population) in the United States and their population ✓

-- SELECT * FROM north_american_cities ORDER BY longitude DESC;
-- SELECT city, population FROM north_american_cities WHERE country LIKE'%canada%';
-- SELECT city FROM north_american_cities WHERE country LIKE '%United STATES%' ORDER BY latitude DESC;
-- SELECT city FROM north_american_cities WHERE longitude < -87.629798 ORDER BY longitude ASC
-- SELECT city,country,population FROM north_american_cities WHERE country LIKE '%Mexico'ORDER BY population DESC LIMIT 2;
-- SELECT city,population FROM north_american_cities WHERE country LIKE '%United%' ORDER BY population DESC LIMIT 2 OFFSET 2;


Exercise 6 — Tasks

-- Find the domestic and international sales for each movie ✓
-- Show the sales numbers for each movie that did better internationally rather than domestically ✓
-- List all the movies by their ratings in descending order ✓

-- SELECT title, domestic_sales, international_sales FROM movies INNER JOIN boxoffice ON movies.id = boxoffice.movie_id;
-- SELECT title, domestic_sales, international_sales FROM movies INNER JOIN boxoffice ON movies.id = boxoffice.movie_id WHERE international_sales > domestic_sales;
-- SELECT title, rating FROM movies INNER JOIN boxoffice ON movies.id = boxoffice.movie_id ORDER BY rating DESC;

Exercise 7 — Tasks

-- Find the list of all buildings that have employees ✓
-- Find the list of all buildings and their capacity ✓
-- List all buildings and the distinct employee roles in each building (including empty buildings) ✓

-- SELECT DISTINCT building FROM employees LEFT JOIN buildings ON employees.building = buildings.building_name
-- Select building_name,capacity FROM buildings;
-- SELECT DISTINCT buildings.building_name, employees.role FROM buildings LEFT JOIN employees ON buildings.building_name = employees.building


Exercise 8 — Tasks

-- Find the name and role of all employees who have not been assigned to a building ✓
-- Find the names of the buildings that hold no employees ✓

-- SELECT role, name FROM employees WHERE building IS NULL;
-- SELECT building_name FROM buildings LEFT JOIN employees ON buildings.building_name = employees.building WHERE name IS NULL

Exercise 9 — Tasks

-- List all movies and their combined sales in millions of dollars
-- List all movies and their ratings in percent
-- List all movies that were released on even number years

-- SELECT title, (domestic_sales + international_sales) / 1000000 AS gross_sales_millions
-- FROM movies
--   INNER JOIN boxoffice
--     ON movies.id = boxoffice.movie_id;

-- SELECT title, rating * 10 AS in_percent
-- FROM movies
-- INNER JOIN boxoffice
-- ON movies.id = boxoffice.movie_id;

-- SELECT title, year
-- FROM movies
-- WHERE year % 2 = 0;

-- Exercise 10 — Tasks
-- Find the longest time that an employee has been at the studio ✓
-- For each role, find the average number of years employed by employees in that role ✓
-- Find the total number of employee years worked in each building ✓

-- SELECT MAX(years_employed) as Max_years_employed
-- FROM employees;

-- SELECT role, AVG(years_employed) as Average_years_employed
-- FROM employees
-- GROUP BY role;

-- SELECT building, SUM(years_employed) as Total_years_employed
-- FROM employees
-- GROUP BY building;

-- Exercise 11 — Tasks
-- Find the number of Artists in the studio (without a HAVING clause) ✓
-- Find the number of Employees of each role in the studio ✓
-- Find the total number of years employed by all Engineers ✓

-- SELECT role, COUNT(*) as Number_of_artists
-- FROM employees
-- WHERE role = "Artist";

-- SELECT role, COUNT(*)
-- FROM employees
-- GROUP BY role;

-- SELECT role, SUM(years_employed)
-- FROM employees
-- GROUP BY role
-- HAVING role = "Engineer";


-- Exercise 12 — Tasks
-- Find the number of movies each director has directed ✓
-- Find the total domestic and international sales that can be attributed to each director ✓


-- SELECT director, COUNT(id) as Num_movies_directed
-- FROM movies
-- GROUP BY director;

-- SELECT director, SUM(domestic_sales + international_sales) as Cumulative_sales_from_all_movies
-- FROM movies
--     INNER JOIN boxoffice
--         ON movies.id = boxoffice.movie_id
-- GROUP BY director;

-- Exercise 13 — Tasks
-- Add the studio's new production, Toy Story 4 to the list of movies (you can use any director) ✓
-- Toy Story 4 has been released to critical acclaim! It had a rating of 8.7, and made 340 million domestically and 270 million internationally. Add the record to the BoxOffice table. ✓

-- INSERT INTO movies VALUES (4, "Toy Story 4", "El Directore", 2015, 90);

-- INSERT INTO boxoffice VALUES (4, 8.7, 340000000, 270000000);

-- Exercise 14 — Tasks
-- The director for A Bug's Life is incorrect, it was actually directed by John Lasseter ✓
-- The year that Toy Story 2 was released is incorrect, it was actually released in 1999 ✓
-- Both the title and director for Toy Story 8 is incorrect! The title should be "Toy Story 3" and it was directed by Lee Unkrich ✓

-- UPDATE movies
-- SET director = "John Lasseter"
-- WHERE id = 2;

-- UPDATE movies
-- SET year = 1999
-- WHERE id = 3;

-- UPDATE movies
-- SET title = "Toy Story 3", director = "Lee Unkrich"
-- WHERE id = 11;


-- Exercise 15 — Tasks
-- This database is getting too big, lets remove all movies that were released before 2005. ✓
-- Andrew Stanton has also left the studio, so please remove all movies directed by him. ✓

-- DELETE FROM movies
-- where year < 2005;

-- DELETE FROM movies
-- where director = "Andrew Stanton";


-- Exercise 16 — Tasks
-- Create a new table named Database with the following columns:
-- – Name A string (text) describing the name of the database
-- – Version A number (floating point) of the latest version of this database
-- – Download_count An integer count of the number of times this database was downloaded
-- This table has no constraints. ✓

-- CREATE TABLE Database (
--     Name TEXT,
--     Version FLOAT,
--     Download_count INTEGER
-- );

-- Exercise 17 — Tasks
-- Add a column named Aspect_ratio with a FLOAT data type to store the aspect-ratio each movie was released in. ✓
-- Add another column named Language with a TEXT data type to store the language that the movie was released in. Ensure that the default for this language is English. ✓

-- ALTER TABLE Movies
--   ADD COLUMN Aspect_ratio FLOAT DEFAULT 2.39;

--   ALTER TABLE Movies
--   ADD COLUMN Language TEXT DEFAULT "English";

-- Exercise 18 — Tasks
-- We've sadly reached the end of our lessons, lets clean up by removing the Movies table ✓
-- And drop the BoxOffice table as well ✓

-- DROP TABLE Movies;

-- DROP TABLE BoxOffice;