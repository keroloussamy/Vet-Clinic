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
  ('Charmander', '2020-02-08', 0, false, -11, 1, 4),
	('Plantmon', '2022-11-15', 2, true, -5.7, 2, 3),
	('Squirtle', '1993-04-02', 3, false, -12.13, 1, 4),
  ('Angemon', '2005-06-12', 1, true, -45, 2, 1),
  ('Boarmon', '2005-06-07', 7, true, 20.4, 2, 5),
  ('Blossom', '1998-08-13', 3, true, 17, 1, 4),
  ('Agumon', '2020-2-3', 0, true, 10.23, 2, 5),
  ('Gabumon', '2018-11-15', 2, true, 8, 2, 2),
  ('Pikachu', '2021-1-7', 1, false, 15.04, 1, 2),
  ('Devimon', '2017-5-12', 5, true, 11, 2, 3)
