/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weight_kg DECIMAL NOT NULL
);

ALTER TABLE animals ADD species_id int REFERENCES species(id);
ALTER TABLE animals ADD owner_id int REFERENCES owners(id);

CREATE TABLE owners (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(250) NOT NULL,
  age INT NOT NULL
);

CREATE TABLE species (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL
);