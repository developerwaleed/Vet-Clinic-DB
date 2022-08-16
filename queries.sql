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
LEFT JOIN species 
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

--DAY3

SELECT vets.name AS vet_name, animals.name AS animal_name, date_of_visit 
FROM visits 
JOIN vets ON vets.id = visits.vet_id
JOIN animals ON vet_id = (SELECT id FROM vets WHERE name = 'William Tatcher') 
AND animals.id = visits.animal_id 
ORDER BY date_of_visit DESC 
LIMIT 1;

SELECT DISTINCT vets.name AS vet_name, animals.name AS animal_name 
FROM visits 
JOIN animals ON animals.id = visits.animal_id 
AND vet_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
JOIN vets ON vets.id = visits.vet_id;

SELECT vets.name AS vet_name, species.name AS specialty
FROM specializations 
RIGHT OUTER JOIN vets ON vets.id = specializations.vet_id 
LEFT OUTER JOIN species ON species.id = specializations.species_id;

SELECT vets.name AS vet_name, animals.name AS animal_name, date_of_visit
FROM visits
JOIN animals ON animals.id = visits.vet_id
JOIN vets ON vets.id = visits.vet_id AND vets.name = 'Stephanie Mendez' AND date_of_visit BETWEEN '04-01-2020' AND '08-30-2020';

SELECT animals.name, COUNT(animal_id) 
FROM visits
JOIN animals ON animals.id = visits.animal_id
GROUP BY animals.name
ORDER BY COUNT(animal_id) DESC
LIMIT 1;

SELECT vets.name AS vet_name, animals.name AS animal_name, date_of_visit
FROM visits
JOIN vets ON vets.id = visits.vet_id AND vets.name = 'Maisy Smith'
JOIN animals ON animals.id = visits.animal_id
ORDER BY date_of_visit ASC
LIMIT 1;

SELECT * 
FROM visits
FULL OUTER JOIN animals ON animals.id = visits.animal_id
FULL OUTER JOIN vets ON vets.id = visits.vet_id
ORDER BY date_of_visit DESC
LIMIT 1;

SELECT COUNT(*) 
FROM vets
JOIN visits ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
JOIN specializations ON vets.id = specializations.vet_id
WHERE NOT specializations.species_id = animals.species_id;

SELECT species.name
FROM animals
JOIN species ON species.id = animals.species_id
JOIN visits ON visits.animal_id = animals.id
JOIN vets ON vets.id = visits.vet_id AND vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(species_id) DESC
LIMIT 1;

EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;

EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;

EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';