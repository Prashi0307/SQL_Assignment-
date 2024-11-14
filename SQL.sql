-- 1.CREATE TABLE employees (
CREATE TABLE employees (
    emp_id INTEGER PRIMARY KEY NOT NULL,                          -- emp_id: integer, primary key, cannot be NULL
    emp_name TEXT NOT NULL,                                        -- emp_name: text, cannot be NULL
    age INTEGER CHECK (age >= 18),                                 -- age: integer, check constraint for minimum age 18
    email TEXT UNIQUE,                                             -- email: text, must be unique
    salary DECIMAL DEFAULT 30000                                   -- salary: decimal, with a default value of 30,000
);

 -- 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide 
-- examples of common types of constraints.
-- Constraints in a database define rules that ensure data accuracy and consistency. They help maintain data integrity by preventing invalid data entries. Here's a brief breakdown:
-- -- PRIMARY KEY: Ensures uniqueness of each row (e.g., emp_id).
-- -- NOT NULL: Ensures a column cannot have NULL values (e.g., emp_name).
-- -- UNIQUE: Ensures all values in a column are distinct (e.g., email).
-- -- CHECK: Enforces conditions on column values (e.g., age >= 18).
-- -- DEFAULT: Assigns a default value to a column (e.g., salary = 30,000).
-- -- FOREIGN KEY: Maintains relationships between tables (e.g., manager_id references emp_id).
-- -- These constraints ensure the database remains reliable and consistent.


 -- 3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify 
-- your answer.
-- the NOT NULL constraint is applied to ensure that a column always has a value and cannot be left empty. This is useful for fields where data is essential, such as names or IDs.

--  4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an 
-- example for both adding and removing a constraint
-- --A primary key cannot contain NULL values because it uniquely identifies each row in a table. Allowing NULL would break uniqueness, as NULL represents an unknown or missing value, which could lead to duplicate or ambiguous records.
-- To add or remove constraints on an existing table, you use the ALTER TABLE command.

-- Adding a Constraint
-- Use ALTER TABLE to specify the table.
-- Add the constraint with ADD CONSTRAINT, followed by the type of constrainT
-- Example: Adding a CHECK constraint to ensure age is at least 18 in the employees table.

-- ALTER TABLE employees
--  ADD CONSTRAINT chk_age CHECK (age >= 18);

-- Removing a Constraint
-- Use ALTER TABLE to specify the table.
-- Drop the constraint with DROP CONSTRAINT, followed by the constraint name.
-- Example: Removing the chk_age constraint from the employees table.

-- ALTER TABLE employees
-- DROP CONSTRAINT chk_age;

-- 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints. 
-- Provide an example of an error message that might occur when violating a constraint.
---- -- Attempting to insert, update, or delete data that violates constraints can lead to errors, preventing the operation.
--  This enforcement preserves data integrity, ensuring that only valid data is stored.
-- Consequences of Violating Constraints:
-- Insert Violation: Trying to insert data that breaks constraints results in an error, blocking the row from being added.
-- Update Violation: Updating a row to a value that violates constraints is also blocked.
-- Delete Violation: If there’s a foreign key constraint, deleting a referenced row can fail.
-- Example Error Messages:
-- NOT NULL Violation: ERROR: null value in column "emp_name" violates not-null constraint
-- CHECK Violation: ERROR: new row for relation "employees" violates check constraint "chk_age"
-- UNIQUE Violation: ERROR: duplicate key value violates unique constraint "employees_email_key".

--  6. You created a products table without constraints as follows:
--  CREATE TABLE products (
--  product_id INT,
--  product_name VARCHAR(50),
--  price DECIMAL(10, 2))
-- --ANS) Make product_id a Primary Key:
-- -- ALTER TABLE products
-- -- ADD CONSTRAINT pk_product_id PRIMARY KEY (product_id);

-- -- Set a Default Value of 50.00 for price:
-- -- ALTER TABLE products
-- -- ALTER COLUMN price SET DEFAULT 50.00;

-- 7.Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
-- --SELECT
-- --     students.student_name,
-- --     classes.class_name
-- -- FROM
-- --     students
-- -- INNER JOIN
-- --     classes
-- -- ON
-- --     students.class_id = classes.class_id;

-- 8. Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are 
-- listed even if they are not associated with an order 
-- Hint: (use INNER JOIN and LEFT JOIN

-- - SELECT
-- --     orders.order_id,
-- --     customers.customer_name,
-- --     products.product_name
-- -- FROM
-- --     products
-- -- LEFT JOIN orders 
-- -- ON orders.order_id = products.order_id
-- -- INNER JOIN customers 
-- ON orders.customer_id = customers.customer_id;

-- 9.Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function
-- -- SELECT
-- --     products.product_name,
-- --     SUM(sales.amount) AS total_sales_amount
-- -- FROM
-- --     sales
-- -- INNER JOIN products 
-- -- ON sales.product_id = products.product_id
-- -- GROUP BY
-- --     Products.product_name;

-- 10 Write a query to display the order_id, customer_name, and the quantity of products ordered by each 
-- customer using an INNER JOIN between all three tables.
--  Note - The above-mentioned questions don't require any dataset.
-- - SELECT
-- --     orders.order_id,
-- --     customers.customer_name,
-- --     order_details.quantity
-- -- FROM
-- --     orders
-- -- INNER JOIN
-- --     customers ON orders.customer_id = customers.customer_id
-- -- INNER JOIN
-- --     order_details ON order_details.order_id = orders.order_id;

-- SQL Commands

 -- 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
-- Primary and Foreign Keys in Maven Movies DB
-- Primary Keys:
--   - actor: actor_id
--   - address: address_id
--   - advisor: advisor_id
--   - category: category_id
--   - city: city_id
--   - country: country_id
--   - customer: customer_id
-- Foreign Keys:
--   - address.city_id -> city.city_id
--   - city.country_id -> country.country_id

--  2- List all details of actors
SELECT * FROM actor;

 -- 3 -List all customer information from DB.
SELECT * FROM customer;

 -- 4 -List different countries.
 SELECT DISTINCT country FROM country;

 -- 5 -Display all active customers.
SELECT * FROM customer WHERE active = 1;

 -- 6 -List of all rental IDs for customer with ID 1
SELECT rental_id FROM rental WHERE customer_id = 1;

--  7 - Display all the films whose rental duration is greater than 5 .
SELECT * FROM film WHERE rental_duration > 5;

--  8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT COUNT(*) AS total_films FROM film WHERE replacement_cost > 15 AND replacement_cost < 20;

--  9 - Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) AS unique_actor_first_names FROM actor;

 -- 10- Display the first 10 records from the customer table 
 SELECT * FROM customer LIMIT 10;
 
  -- 11 - Display the first 3 records from the customer table whose first name starts with ‘b’
SELECT * FROM customer WHERE first_name LIKE 'B%' LIMIT 3;

 -- 12 -Display the names of the first 5 movies which are rated as ‘G’.
SELECT title FROM film WHERE rating = 'G' LIMIT 5;

 -- 13-Find all customers whose first name starts with "a".
SELECT * FROM customer WHERE first_name LIKE 'A%';

 -- 14- Find all customers whose first name ends with "a"
SELECT * FROM customer WHERE first_name LIKE '%A';

--  15- Display the list of first 4 cities which start and end with ‘a’ 
SELECT city FROM city WHERE city LIKE 'A%' AND city LIKE '%A' LIMIT 4;

 -- 16- Find all customers whose first name have "NI" in any position
SELECT * FROM customer WHERE first_name LIKE '%NI%';

 -- 17- Find all customers whose first name have "r" in the second position 
SELECT * FROM customer WHERE first_name LIKE '_R%';

 -- 18 - Find all customers whose first name starts with "a" and are at least 5 characters in length
SELECT * FROM customer WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;

--  19- Find all customers whose first name starts with "a" and ends with "o".
SELECT * FROM customer WHERE first_name LIKE 'A%' AND first_name LIKE '%O';

 -- 20 - Get the films with pg and pg-13 rating using IN operator.
SELECT * FROM film WHERE rating IN ('PG', 'PG-13');

--  21 - Get the films with length between 50 to 100 using between operator
SELECT * FROM film WHERE length BETWEEN 50 AND 100;

-- 22 - Get the top 50 actors using limit operator.
SELECT * FROM actor LIMIT 50;

 -- 23 - Get the distinct film ids from inventory table
SELECT DISTINCT film_id FROM inventory;

-- Functions
--  Basic Aggregate Functions
 
  -- Question 1:
 -- Retrieve the total number of rentals made in the Sakila database.
 -- Hint: Use the COUNT() function
SELECT COUNT(*) AS total_rentals FROM rental;

-- Question 2:
--  Find the average rental duration (in days) of movies rented from the Sakila database.
--  Hint: Utilize the AVG() function.
SELECT AVG(rental_duration) AS average_rental_duration FROM film;

-- String Functions:
--  Question 3:
--  Display the first name and last name of customers in uppercase.
--  Hint: Use the UPPER () function.
SELECT UPPER(first_name) AS first_name_upper, UPPER(last_name) AS last_name_upper FROM customer;

 -- Question 4:
--  Extract the month from the rental date and display it alongside the rental ID.
--  Hint: Employ the MONTH() function.
SELECT rental_id, MONTH(rental_date) AS rental_month FROM rental;

--  GROUP BY:
--  Question 5:
-- --  Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
-- --  Hint: Use COUNT () in conjunction with GROUP BY.
 SELECT customer_id, COUNT(*) AS rental_count FROM rental GROUP BY customer_id;
 
  -- Question 6:
--  Find the total revenue generated by each store.
--  Hint: Combine SUM() and GROUP BY
SELECT payment_id, SUM(amount) AS total_revenue FROM payment GROUP BY payment_id;

--  Question 7:
--  Determine the total number of rentals for each category of movies.
--  Hint: JOIN film_category, film, and rental tables, then use cOUNT () and GROUP BY
SELECT c.name AS category, COUNT(r.rental_id) AS rental_count
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
group by c.name;

-- Question 8:
--  Find the average rental rate of movies in each language.
--  Hint: JOIN film and language tables, then use AVG () and GROUP BY
SELECT l.name AS language, AVG(f.rental_rate) AS average_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

-- Joins

--  Questions 9 -
--  Display the title of the movie, customer s first name, and last name who rented it.
--  Hint: Use JOIN between the film, inventory, rental, and customer tables.
SELECT f.title AS movie_title, c.first_name AS customer_first_name, c.last_name AS customer_last_name
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN customer c ON r.customer_id = c.customer_id;

 -- Question 10:
--  Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
--  Hint: Use JOIN between the film actor, film, and actor tables
SELECT a.first_name, a.last_name
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.title = 'Gone with the Wind';

 
 -- Question 11:
--  Retrieve the customer names along with the total amount they've spent on rentals.
--  Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

-- Question 12:
--  List the titles of movies rented by each customer in a particular city (e.g., 'London').
--  Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY
SELECT c.first_name, c.last_name, f.title AS movie_title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title;

 -- Advanced Joins and GROUP BY:-- 
 
  -- Question 13:
--  Display the top 5 rented movies along with the number of times they've been rented.
--  Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results
SELECT f.title AS movie_title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;

 -- Question 14:
--  Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
--  Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY
SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
WHERE i.store_id IN (1, 2)
GROUP BY c.customer_id
HAVING COUNT(DISTINCT i.store_id) = 2;

-- Windows Function:

-- 1. Rank the customers based on the total amount they've spent on rentals
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(p.amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

 -- 2. Calculate the cumulative revenue generated by each film over time.
 SELECT 
    f.title,
    r.rental_date,
    SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY r.rental_date) AS cumulative_revenue
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN payment p ON r.rental_id = p.rental_id;

 -- 3. Determine the average rental duration for each film, considering films with similar lengths
 SELECT 
    f.title,
    f.length,
    AVG(f.rental_duration) OVER (PARTITION BY f.length) AS avg_rental_duration_for_length
FROM film f;

 -- 4. Identify the top 3 films in each category based on their rental counts
 SELECT * FROM (
    SELECT 
        c.name AS category_name,
        f.title,
        COUNT(r.rental_id) AS rental_count,
        RANK() OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS ranks
    FROM category c
    JOIN film_category fc ON c.category_id = fc.category_id
    JOIN film f ON fc.film_id = f.film_id
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    GROUP BY c.category_id, f.film_id
) AS ranked_films
WHERE ranks <= 3;

-- 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals
--  across all customers
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals,
    AVG(COUNT(r.rental_id)) OVER () AS avg_rentals,
    COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS rental_diff
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id;

-- 6. Find the monthly revenue trend for the entire rental store over time
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue,
    SUM(SUM(amount)) OVER (ORDER BY DATE_FORMAT(payment_date, '%Y-%m')) AS cumulative_revenue
FROM payment
GROUP BY DATE_FORMAT(payment_date, '%Y-%m');

 -- 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers
 WITH customer_spending AS (
    SELECT 
        customer_id,
        SUM(amount) AS total_spent,
        PERCENT_RANK() OVER (ORDER BY SUM(amount) DESC) AS spending_percentile
    FROM payment
    GROUP BY customer_id
)
SELECT 
    customer_id,
    total_spent
FROM customer_spending
WHERE spending_percentile <= 0.2;

 -- 8. Calculate the running total of rentals per category, ordered by rental count
 SELECT 
    c.name AS category_name,
    f.title,
    COUNT(r.rental_id) AS rental_count,
    SUM(COUNT(r.rental_id)) OVER (PARTITION BY c.category_id ORDER BY COUNT(r.rental_id) DESC) AS running_total_rentals
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f ON fc.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, f.film_id;

 -- 9. Find the films that have been rented less than the average rental count for their respective categories

    SELECT 
    f.title,
    f.film_id,
    COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
HAVING COUNT(r.rental_id) < (
    SELECT AVG(rental_count) 
    FROM (
        SELECT 
            f2.film_id, 
            COUNT(r2.rental_id) AS rental_count
        FROM film f2
        JOIN inventory i2 ON f2.film_id = i2.film_id
        LEFT JOIN rental r2 ON i2.inventory_id = r2.inventory_id
        GROUP BY f2.film_id
    ) AS film_rentals
);


 -- 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM payment
GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY monthly_revenue DESC
LIMIT 5;

-- Normalisation & CTE

 -- -- 1. First Normal Form (1NF):
--                a. Identify a table in the Sakila database that violates 1NF. Explain how you
--                would normalize it to achieve 1NF
-- 1NF Violation Example: A table with multiple phone numbers in a single field. Normalize by moving each phone number to its own row in a separate customer_phone_numbers table.

--  2-- . Second Normal Form (2NF):
--                a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
--             If it violates 2NF, explain the steps to normalize it
-- 2NF Violation Example: A table with a composite key (e.g., film_actor with actor and film IDs) that also has non-key attributes dependent on part of the key. Normalize by moving non-key attributes to a separate table linked by a foreign key.

-- 3. Third Normal Form (3NF):
--                a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
--                present and outline the steps to normalize the table to 3NF
-- 3NF Violation Example: A table where non-key attributes depend on other non-key attributes (e.g., film table with a derived attribute like total_rental_cost). Remove transitive dependencies by placing dependent attributes in a new table.

-- 4. Normalization Process:
--                a. Take a specific table in Sakila and guide through the process of normalizing it from the initial  
--             unnormalized form up to at least 2NF
-- Normalization Process: Start with an unnormalized customer_order table. Normalize by:

-- 1NF: Split repeating groups.
-- 2NF: Move partial dependencies to new tables.
-- 3NF: Remove transitive dependencies.

-- 5. CTE Basics:
--                 a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they 
--                 have acted in from the actor and film_actor tables
-- CTE for Actor Film Count
use sakila;
WITH actor_films AS (
    SELECT actor_id, COUNT(film_id) AS film_count
    FROM film_actor
    GROUP BY actor_id
)
SELECT a.first_name, a.last_name, af.film_count
FROM actor a
JOIN actor_films af ON a.actor_id = af.actor_id;

 -- 6. CTE with Joins:
--                 a. Create a CTE that combines information from the film and language tables to display the film title, 
--                  language name, and rental rate
-- CTE with Film and Language Join:
WITH film_language AS (
    SELECT f.title, l.name AS language_name, f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT * FROM film_language;

-- 7. CTE for Aggregation:
  -- a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) 
--                 from the customer and payment tables.
WITH customer_revenue AS (
    SELECT customer_id, SUM(amount) AS total_revenue
    FROM payment
    GROUP BY customer_id
)
SELECT * FROM customer_revenue;

-- 8. CTE with Window Functions:
--  a. Utilize a CTE with a window function to rank films based on their rental duration from the film table
WITH film_ranks AS (
    SELECT title, rental_duration,
    RANK() OVER (ORDER BY rental_duration DESC) AS rankS
    FROM film
)
SELECT * FROM film_ranks;

--  9. CTE and Filtering
-- a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the 
--             customer table to retrieve additional customer details.
WITH frequent_customers AS (
    SELECT customer_id
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(*) > 2
)
SELECT c.*
FROM customer c
JOIN frequent_customers fc ON c.customer_id = fc.customer_id;

-- 10.CTE for Date Calculations:
--  a. Write a query using a CTE to find the total number of rentals made each month, considering the 
-- rental_date from the rental tablE
-- CTE for Monthly Rentals:
WITH monthly_rentals AS (
    SELECT DATE_FORMAT(rental_date, '%Y-%m-01') AS month, COUNT(*) AS rentals
    FROM rental
    GROUP BY month
)
SELECT * FROM monthly_rentals;


 -- 11.CTE and Self-Join:
 --  a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film 
-- together, using the film_actor table
WITH actor_pairs AS (
    SELECT fa1.actor_id AS actor1, fa2.actor_id AS actor2, fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id
    WHERE fa1.actor_id < fa2.actor_id
)
SELECT * FROM actor_pairs;

-- 12. CTE for Recursive Search:
 -- a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, 
-- considering the reports_to columN
WITH RECURSIVE staff AS (
    SELECT staff_id, manager_id
    FROM staff
    WHERE manager_id = 1  -- Specify the actual manager ID directly here
    UNION ALL
    SELECT s.staff_id, s.manager_id
    FROM staff s
    JOIN staff_hierarchy sh ON s.manager_id = sh.staff_id
)
SELECT * FROM staff;
use sakila;
select * from staff;

-- note- there is no report to column in sakila or any dataset hence data can not be retrieved.