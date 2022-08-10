/* Create a database named vet_clinic. */

CREATE DATABASE vet_clinic;

/* Create a table named animals with the columns */

CREATE TABLE animals 
( id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(250), 
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg DECIMAL(4,2), 
    PRIMARY KEY(id));

ALTER TABLE animals
ADD COLUMN species VARCHAR(250);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY, 
    full_name VARCHAR(250), 
    age INT, PRIMARY KEY (id));

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250), 
    PRIMARY KEY (id));

ALTER TABLE animals 
DROP COLUMN species;

ALTER TABLE animals 
ADD COLUMN species_id INT, 
ADD COLUMN owner_id INT;

ALTER TABLE animals 
ADD CONSTRAINT fk_species 
FOREIGN KEY(species_id) 
REFERENCES species(id);

ALTER TABLE animals 
ADD CONSTRAINT fk_owner 
FOREIGN KEY(owner_id)
REFERENCES owners(id);

