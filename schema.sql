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

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
    name VARCHAR(250), 
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specializations (
    vet_id INT, 
    specie_id INT
    );
    
    
ALTER TABLE specializations 
ADD CONSTRAINT fk_vets 
FOREIGN KEY(vet_id) 
REFERENCES vets(id);

ALTER TABLE specializations 
ADD CONSTRAINT fk_species 
FOREIGN KEY(specie_id) 
REFERENCES species(id);

CREATE TABLE visits (
    vet_id INT REFERENCES vets(id),
    animal_id INT REFERENCES animals(id),
    date_of_visit DATE);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- Create indexes
CREATE INDEX animal_ids ON visits (animal_id);

CREATE INDEX vet_ids ON visits (vet_id);

CREATE INDEX owner_emails ON owners (email);

