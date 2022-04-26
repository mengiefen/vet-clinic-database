/* Populate database with sample data. */


INSERT INTO animals (
  name, 
  date_of_birth, 
  escape_attempts, 
  neutered, 
  weight_kg) 
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg) 
VALUES ('Gabumon', '2018-11-15', 2, true, 8);


INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg) 
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);


INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg) 
VALUES ('Devimon', '2017-05-12', 5, true, 11);

-- Update the animal table with new values(rows)

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES ( 'Charmander', '2020-02-08', 0, false, -11 );

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES ( 'Plantmon', '2021-11-15', 2, true, -5.7 );

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES ( 'Squirtle', '1993-04-02', 3, false, -12.13 );

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES ( 'Angemon', '2005-06-12', 1, true, -45 );

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES ( 'Boarmon', '2005-06-07', 7, true, 20.4 );

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES ( 'Blossom', '1998-10-13', 3, true, 17 );

INSERT INTO animals (
  name,
  date_of_birth,
  escape_attempts,
  neutered,
  weight_kg
)
VALUES ( 'Ditto', '2022-05-14', 4, true, 22);

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



