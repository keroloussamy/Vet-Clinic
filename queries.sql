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



select * from animals join owners on animals.owner_id = owners.id and owners.full_name = 'Melody Pond'
select * from animals join species on animals.species_id = species.id and species.name = 'Pokemon'
select * from animals right join owners on animals.owner_id = owners.id
select count(*), species.name from animals join species on animals.species_id = species.id group by species.id

select * from animals 
join owners on animals.owner_id = owners.id 
join species on animals.species_id = species.id 
and owners.full_name = 'Jennifer Orwell' and species.name = 'Digimon'

select * from animals join owners on animals.owner_id = owners.id 
and owners.full_name = 'Dean Winchester'
and animals.escape_attempts = 0

SELECT owners.full_name, COUNT(animals) FROM owners JOIN animals
ON owners.id = animals.owner_id
GROUP BY owners.full_name ORDER BY COUNT(animals) DESC LIMIT 1