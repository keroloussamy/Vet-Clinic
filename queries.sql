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


-- Who was the last animal seen by William Tatcher?
select animals.name from animals 
join visits on animals.id = visits.animals_id 
join vets on vets.id = visits.vets_id
where visits.vets_id = 1 ORDER BY visits.date limit 1

-- How many different animals did Stephanie Mendez see?
select distinct count(*) from animals 
join visits on animals.id = visits.animals_id 
join vets on vets.id = visits.vets_id
where visits.vets_id = 3


--List all vets and their specialties, including vets with no specialties.
select vets.name, STRING_AGG(species.name, ', ') from vets
left join specializations on vets.id = specializations.vets_id
left join species on species.id = specializations.species_id 
GROUP BY vets.name


--List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select animals.name from animals 
join visits on animals.id = visits.animals_id 
join vets on vets.id = visits.vets_id
where visits.vets_id = 3 and visits.date between '2020-4-1' and '2020-8-30'


-- What animal has the most visits to vets?
select animals.name from animals 
join visits on animals.id = visits.animals_id 
join vets on vets.id = visits.vets_id
GROUP BY animals.name ORDER BY COUNT(animals) DESC LIMIT 1


--Who was Maisy Smith's first visit?
select animals.name from animals 
join visits on animals.id = visits.animals_id 
join vets on vets.id = visits.vets_id
where visits.vets_id = 2 ORDER BY visits.date DESC limit 1


-- Details for most recent visit: animal information, vet information, and date of visit.
select * from animals 
join visits on animals.id = visits.animals_id 
join vets on vets.id = visits.vets_id
order by visits.date DESC


-- How many visits were with a vet that did not specialize in that animal's species?
select vets.name, count(visits.id) from vets
left join specializations on vets.id = specializations.vets_id
left join species on species.id = specializations.species_id
join visits on vets.id = visits.animals_id
where specializations.species_id IS NULL
GROUP BY vets.name
-- 3


-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
select species.name, count(species.*) from vets
join visits on vets.id = visits.vets_id
join animals on animals.id = visits.animals_id
join species on species.id = animals.species_id
where vets.id = 2
GROUP BY species.name
ORDER BY COUNT(species.name) DESC
LIMIT 1