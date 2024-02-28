CREATE DATABASE pokemon_db;

USE pokemon_db;

CREATE TABLE trainer(
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    trainer_name VARCHAR(20) NOT NULL
);

CREATE TABLE pokemon_type(
    type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(10) NOT NULL
);

CREATE TABLE skill(
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(20) NOT NULL,
    skill_type INT NOT NULL,
    skill_damage INT NOT NULL,
    FOREIGN KEY (skill_type) REFERENCES pokemon_type(type_id)
);

CREATE TABLE poke_dex(
    dex_id INT AUTO_INCREMENT PRIMARY KEY,
    dex_name VARCHAR(20) NOT NULL,
    dex_type1 INT NOT NULL,
    dex_type2 INT,
    evolution_stage INT NOT NULL,
    evolution_from_id INT,
    is_legendary BOOLEAN NOT NULL,
    FOREIGN KEY (evolution_from_id) REFERENCES poke_dex(dex_id),
    FOREIGN KEY (dex_type1) REFERENCES pokemon_type(type_id),
    FOREIGN KEY (dex_type2) REFERENCES pokemon_type(type_id)
);

CREATE TABLE pokemon(
    pokemon_id INT PRIMARY KEY,
    pokemon_hp INT NOT NULL,
    pokemon_skill_id1 INT NOT NULL,
    pokemon_skill_id2 INT,
    pokemon_skill_id3 INT,
    pokemon_skill_id4 INT,
    FOREIGN KEY (pokemon_id) REFERENCES poke_dex(dex_id),
    FOREIGN KEY (pokemon_skill_id1) REFERENCES skill(skill_id),
    FOREIGN KEY (pokemon_skill_id2) REFERENCES skill(skill_id),
    FOREIGN KEY (pokemon_skill_id3) REFERENCES skill(skill_id),
    FOREIGN KEY (pokemon_skill_id4) REFERENCES skill(skill_id)
);

CREATE TABLE trainer_owned_pokemon(
    owner_id INT PRIMARY KEY,
    owned_pokemon_id INT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES trainer(trainer_id),
    FOREIGN KEY (owned_pokemon_id) REFERENCES pokemon(pokemon_id)
);