/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weight_kg DECIMAL NOT NULL, 
);

ALTER TABLE animals ADD  PRIMARY KEY(id);
ALTER TABLE animals DROP COLUMN species;



ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals 
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals 
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners(id);



-- Alter table with additional coumn 'species'
ALTER TABLE animals
ADD COLUMN species VARCHAR(100);
ALTER TABLE animals 


CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INT,
  PRIMARY KEY (id),
);

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  PRIMARY KEY(id)  
);

/* CREATES vets TABLE */

CREATE TABLE vets(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
age INT,
date_of_graduation DATE,
PRIMARY KEY(id)
);
/* CREATES JUNCTION TABLE BETWEEN vets and species */
CREATE TABLE specialization(
  id INT GENERATED ALWAYS AS IDENTITY,
  species_id INT,
  vets_id INT,
  PRIMARY KEY(id),  
  CONSTRAINT fk_species 
  	FOREIGN KEY (species_id) REFERENCES species(id)
  	ON DELETE CASCADE,
  CONSTRAINT fk_vets 
  	FOREIGN KEY (vets_id) REFERENCES vets(id)
  	ON DELETE CASCADE
);

/* CREATES A JUNCTION TABLE between animals and vets */

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  date_of_visit DATE,
  animal_id INT,
  vets_id INT,
  PRIMARY KEY(id),
  CONSTRAINT fk_animals 
    FOREIGN KEY(animal_id) REFERENCES animals(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_vets
    FOREIGN KEY(vets_id) REFERENCES vets(id)
    ON DELETE CASCADE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

 CREATE INDEX Index_animal_id ON visits (animal_id);
CREATE INDEX Index_vet_id ON visits(vet_id); 
CREATE INDEX Index_email ON owners(email)

