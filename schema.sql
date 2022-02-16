/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weight_kg DECIMAL NOT NULL,
  species_id INT NOT NULL,
  owner_id INT NOT NULL,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id)
);

CREATE TABLE owners (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(250) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE species (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL
);