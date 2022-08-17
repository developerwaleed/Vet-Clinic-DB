/*Queries that provide answers to the questions from all projects.*/

1-	SELECT * FROM animals WHERE last_name LIKE '%mon';
2-	SELECT * FROM animals WHERE date_of_birth BETWEEN DATE '2016-01-01' AND DATE '2019-12-31';
3-	SELECT date_of_birth, name FROM animals WHERE name IN ('Agumon', 'Pikachu');
4-	SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
5-	SELECT * FROM animals WHERE neutered=’true’;
6-	SELECT * FROM animals WHERE name NOT IN ('Gabumon');
7-	SELECT * FROM animals WHERE weight_kg BETWEEN 10.5 AND 17.3 OR weight_kg IN (10.5, 17.3);