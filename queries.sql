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





