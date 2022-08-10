/*Queries that provide answers to the questions from all projects.*/

-- DAY 1

SELECT * FROM animals 
WHERE last_name 
LIKE '%mon';

SELECT * FROM animals 
WHERE date_of_birth 
BETWEEN DATE '2016-01-01' 
AND DATE '2019-12-31';

SELECT date_of_birth, 
name FROM animals 
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts 
FROM animals 
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered=’true’;

SELECT * FROM animals 
WHERE name NOT IN ('Gabumon');

SELECT * FROM animals
WHERE weight_kg 
BETWEEN 10.5 AND 17.3 
OR weight_kg 
IN (10.5, 17.3);

-- DAY 2

SELECT COUNT(name) 
AS animals_count 
FROM animals;

SELECT COUNT(escape_attempts)
AS never_escaped_animals
FROM animals 
WHERE escape_attempts = 0;

SELECT avg(weight_kg) 
AS avg_weight 
FROM animals;

SELECT COUNT(escape_attempts)
AS escape_count, neutered 
FROM animals 
GROUP BY neutered;

SELECT species, 
min(weight_kg) AS min_Weight, 
max(weight_kg) AS max_weight 
from animals 
GROUP BY species;

SELECT species,avg(escape_attempts) 
AS avg_escape_attempts 
FROM animals 
WHERE date_of_birth 
BETWEEN DATE '1990-01-01' 
AND DATE '2000-12-31' 
GROUP BY species;