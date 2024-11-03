-- Active: 1695046874741@@127.0.0.1@5432@db
-- CREATE USER
CREATE USER admin WITH ENCRYPTED PASSWORD 'admin';
DROP USER admin;

-- CREATE DATABASE
CREATE DATABASE db OWNER = admin;
-- DROP DATABASE
DROP DATABASE db;

-- CREATE OR INSTALL EXTENSION
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CREATE TYPE ENUM:
CREATE TYPE GENDER AS ENUM ('Male', 'Female');

-- CREATE TABLE
CREATE TABLE person (
  id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  gender GENDER,
  date_of_birth DATE NOT NULL,
  country VARCHAR(100) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT (NOW()),
  CONSTRAINT unique_person_email UNIQUE(email)
);

CREATE TABLE person (
    id uuid PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender GENDER,
    date_of_birth DATE,
    email VARCHAR(50),
    car_id uuid,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    constraint fk_car_id foreign key (car_id) references car(id),
    constraint unique_email unique (email)
);

 -- CREATE TABLE MYSQL
CREATE TABLE usuarios (
    id CHAR(36) PRIMARY KEY NOT NULL DEFAULT (UUID()),
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE car (
  id uuid DEFAULT uuid_generate_v4() PRIMARY KEY,
  make VARCHAR(50) NOT NULL,
  model VARCHAR(70) NOT NULL,
  model_year INT NOT NULL,
  person_id uuid NOT NULL ,
  CONSTRAINT fk_person_car FOREIGN KEY(person_id) REFERENCES person(id) ON UPDATE CASCADE ON DELETE CASCADE
);
-- DROP TABLE, DELETE ALL DATA
DROP TABLE IF EXISTS person;
DELETE FROM person;
-- DELETE A RECORD
DELETE FROM person WHERE ID = 'edbadc45-485a-496d-922b-adb7dab8116c';
