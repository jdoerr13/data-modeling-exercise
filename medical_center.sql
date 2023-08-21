 -- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE Doctors
(
  doctor_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  specialization VARCHAR(30)
);

CREATE TABLE Patients
(
  patient_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  DOB DATE,
  insurance_provider TEXT
);

CREATE TABLE Visits
(
  visit_id SERIAL PRIMARY KEY,
  doctor_id INT,
  patient_id INT,
  FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id),
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
  visit_date DATE
);

CREATE TABLE Diseases
(
  disease_id SERIAL PRIMARY KEY,
  disease_name VARCHAR(30)
);

CREATE TABLE Diagnoses
(
    diagnosis_id INT PRIMARY KEY,
    visit_id INT, 
    disease_id INT,
    FOREIGN KEY (visit_id) REFERENCES Visits(visit_id),
    FOREIGN KEY (disease_id) REFERENCES Diseases(disease_id)
)

