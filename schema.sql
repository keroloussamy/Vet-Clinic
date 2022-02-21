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

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE TABLE species (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL
);

CREATE TABLE vets (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(250) NOT NULL,
  age INT NOT NULL,
  date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	vets_id INT NOT NULL,
	species_id INT NOT NULL,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE TABLE visits (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  vets_id INT NOT NULL,
	animals_id INT NOT NULL,
  date DATE NOT NULL,
	FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE
);


CREATE INDEX idx_visits_animals ON visits(animals_id);
CREATE INDEX idx_visits_vets ON visits(vets_id);
CREATE INDEX idx_owners_email ON owners(email);
