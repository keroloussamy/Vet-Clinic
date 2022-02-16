/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-1';
SELECT name from animals WHERE neutered = true and escape_attempts < 3;
SELECT date_of_birth from animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;



BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * from animals;
ROLLBACK;
SELECT * from animals;


BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon ' WHERE species IS NULL;
COMMIT;
SELECT * from animals;


BEGIN;
DELETE FROM animals;
SELECT * from animals;
ROLLBACK;
SELECT * from animals;



BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-1-1';
SAVEPOINT DeleteAfter_2022;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO SAVEPOINT DeleteAfter_2022;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;



Select count(*) from animals;
Select count(*) from animals WHERE escape_attempts = 0;
Select avg(weight_kg) from animals;
select neutered from animals where escape_attempts = (select max(escape_attempts) from animals);
SELECt MAX(weight_kg), MIN(weight_kg) from animals GROUP BY species;
SELECT AVG(escape_attempts) from animals  WHERE date_of_birth between '1990-1-1' AND '2000-1-1' GROUP BY species
