SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31'
SELECT * FROM animals WHERE neutered=true AND escape_attempts<3;
SELECT date_of_birth FROM animals WHERE name='Agumon' OR name='Pikachu';
SELECT (date_of_birth, escape_attempts) FROM animals WHERE weight_kg>10.5;
SELECT * FROM animals WHERE neutered;
SELECT * FROM animals WHERE name<>'Gabumon';
SELECT * FROM animals WHERE weight_kg>=10.4 AND weight_kg<=17.3;


-- TRANSACTION

BEGIN TRANSACTION;
  UPDATE animals SET species='unspecified' WHERE species IS NULL;
ROLLBACK;

BEGIN TRANSACTION;
  UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
  UPDATE animals SET species='pokemon' WHERE species IS NULL;
COMMIT TRANSACTION;

BEGIN TRANSACTION;
  DELETE FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
  DELETE FROM animals WHERE date_of_birth>'2022-01-01';  
  SAVEPOINT savepoint_1;
  UPDATE animals SET weight_kg=-weight_kg WHERE weight_kg IS NOT NULL;
  ROLLBACK TO savepoint_1;
  UPDATE animals SET weight_kg=-weight_kg WHERE SIGN(weight_kg)==-1;
COMMIT TRANSACTION;

-- Queries for new exercise
SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE SIGN(escape_attempts)=0;
SELECT name, AVG(weight_kg) FROM animals;

SELECT 
  (neutered, MAX(escape_attempts))
FROM 
  animals 
GROUP BY 
  neutered;

SELECT species, MIN(weight_kg), MAX(weight_kg)
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts)
FROM animals
WHERE date_of_birth>'1990-01-01' AND date_of_birth<'2000-01-01'
GROUP BY species;

-- What animals belong to Melody Pond?
SELECT full_name, name 
FROM animals 
JOIN owners ON animals.owner_id=owners.id
WHERE owners.full_name='Melody Pond';


-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name
FROM animals 
JOIN species ON animals.species_id=species.id
WHERE species.name='Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT full_name, name
FROM animals
RIGHT JOIN owners ON animals.owner_id=owners.id;

-- How many animals are there per species?

SELECT species.name, COUNT(species.name) FROM species 
JOIN animals ON animals.species_id=species.id
GROUP BY species.id;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name, animals.name 
FROM owners
JOIN animals ON animals.owner_id=owners.id
JOIN species ON species.id=species_id
WHERE owners.full_name='Jennifer Orwell';
-- List all animals owned by Dean Winchester that haven't tried to escape.

SELECT owners.full_name, animals.name 
FROM animals
JOIN owners ON animals.owner_id=owners.id
WHERE owners.full_name='Dean Winchester' AND escape_attempts=0;

-- Who owns the most animals?

SELECT 
    O.full_name, COUNT(A.name) 
FROM owners O
    LEFT JOIN animals A
    ON A.owner_id = O.id
GROUP BY O.full_name
ORDER BY COUNT DESC
LIMIT 1;

   
    

