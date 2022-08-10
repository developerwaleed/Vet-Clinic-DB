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

SELECT name, full_name 
FROM animals INNER 
JOIN owners 
ON animals.id = owners.id 
WHERE full_name = 'Melody Pond';

SELECT animals.name 
from animals 
LEFT JOIN species 
ON animals.id = species.id 
WHERE animals.species_id = (SELECT id FROM species WHERE name = 'Pokemon');

SELECT full_name, name 
FROM animals FULL 
JOIN owners
ON animals.owner_id = owners.id;

SELECT COUNT(*), species.name AS Specie 
FROM animals 
RIGHT JOIN species 
ON species_id = species.id 
GROUP BY species.id;

SELECT full_name AS owner, species.name AS Speice 
FROM animals 
JOIN owners 
ON animals.owner_id = owners.id 
JOIN species 
ON animals.species_id = species.id
WHERE owners.full_name = ('Jennifer Orwell') 
AND species.name = 'Digimon';

SELECT full_name AS owner, species.name AS Speice 
FROM animals 
JOIN owners 
ON animals.owner_id = owners.id 
JOIN species 
ON animals.species_id = species.id 
WHERE owners.full_name = ('Dean Winchester') 
AND escape_attempts = 0;

SELECT COUNT(*), owners.full_name AS owner 
FROM animals 
JOIN owners 
ON animals.owner_id = owners.id 
GROUP BY owners.full_name 
ORDER BY COUNT(*) DESC 
LIMIT 1;

