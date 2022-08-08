/* Create a database named vet_clinic. */

CREATE DATABASE vet_clinic;

/* Create a table named animals with the columns */

CREATE TABLE animals ( id INT GENERATED ALWAYS AS IDENTITY, name VARCHAR(250), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL(4,2), PRIMARY KEY(id));