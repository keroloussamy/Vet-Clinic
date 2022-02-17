/* Populate database with sample data. */

INSERT INTO owners (full_name, age)
VALUES 
  ('Sam Smith', 34),
	('Jennifer Orwell', 19),
	('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38)


INSERT INTO species (name)
VALUES 
  ('Pokemon'),
	('Digimon')

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg, species_id, owner_id)
VALUES 
  ('Charmander', '2020-02-08', 0, false, -11),
	('Plantmon', '2022-11-15', 2, true, -5.7),
	('Squirtle', '1993-04-02', 3, false, -12.13),
  ('Angemon', '2005-06-12', 1, true, -45),
  ('Boarmon', '2005-06-07', 7, true, 20.4),
  ('Blossom', '1998-08-13', 3, true, 17),
  ('Agumon', '2020-2-3', 0, true, 10.23),
  ('Gabumon', '2018-11-15', 2, true, 8),
  ('Pikachu', '2021-1-7', 1, false, 15.04),
  ('Devimon', '2017-5-12', 5, true, 11)


UPDATE animals SET owner_id = 4 WHERE name = 'Charmander';
UPDATE animals SET owner_id = 3 WHERE name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Squirtle';
UPDATE animals SET owner_id = 1 WHERE name = 'Angemon';
UPDATE animals SET owner_id = 5 WHERE name = 'Boarmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon';

UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Digimon')
WHERE name like '%mon';

UPDATE animals
SET species_id = (SELECT id from species WHERE name = 'Pokemon')
WHERE species_id IS NULL;