-- Active: 1695046874741@@127.0.0.1@5432@db
SELECT * FROM person;
SELECT * FROM person LIMIT 5;
SELECT * FROM person WHERE gender = 'Male';
SELECT * FROM person WHERE gender = 'Female';
SELECT * FROM person WHERE first_name LIKE 'A%'; -- names start with A...
SELECT * FROM person WHERE email LIKE '%@g%'; -- email ...@g...
SELECT * FROM person ORDER BY last_name LIMIT 10;
SELECT first_name, last_name FROM person LIMIT 8 OFFSET 5;
SELECT Count(p) FROM person p WHERE gender = 'Male'; -- Total male
SELECT Count(p) FROM person p WHERE gender = 'Female'; -- Total female
SELECT gender, Count(p) FROM person p GROUP BY p.gender; -- Total male, female
SELECT * FROM car;
SELECT CASE WHEN Count(c) > 0 THEN TRUE ELSE FALSE END FROM car c WHERE c.make = 'Toyota'; -- Return TRUE OR FALSE IF Toyota EXISTS.
SELECT CASE WHEN Count(c) > 0 THEN TRUE ELSE FALSE END FROM car c WHERE c.make = 'Tesla'; -- Return TRUE OR FALSE IF Toyota EXISTS.
