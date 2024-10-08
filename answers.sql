-- Creating a database
CREATE DATABASE hospital_db;
USE hospita_db;
--Creating Tables
--Table Name: patients
CREATE TABLE patients(
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(255),
    language VARCHAR(255) NOT NULL
);
--Table Name: providers
CREATE TABLE providers(
provider_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(255) NOT NULL,
last_name VARCHAR(255) NOT NULL,
provider_speciality VARCHAR(255) NOT NULL,
email_address VARCHAR(255),
phone_number VARCHAR(255),
date_joined DATE NOT NULL
);
--Table Name: visits
CREATE TABLE visits(
visit_id INT PRIMARY KEY AUTO_INCREMENT,
patient_id INT,
FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
provider_id INT,
FOREIGN KEY(provider_id) REFERENCES providers(provider_id),
date_of_visit DATE NOT NULL,
date_scheduled DATE NOT NULL,
visit_department_id INT NOT NULL,
visit_type VARCHAR(255) NOT NULL,
blood_pressure_systollic INT,
blood_pressure_diastollic DECIMAL,
pulse DECIMAL,
visit_status VARCHAR(255) NOT NULL
);
--Table Name: ed_visits
CREATE TABLE ed_visits(
ed_visit_id INT PRIMARY KEY AUTO_INCREMENT,
visit_id INT,
FOREIGN KEY(visit_id) REFERENCES visits(visit_id),
patient_id INT,
FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
acuity INT NOT NULL,
reason_for_visit VARCHAR(255) NOT NULL,
disposition VARCHAR(255) NOT NULL
);
--Table Name: admission
CREATE TABLE admission(
admission_id INT PRIMARY KEY AUTO_INCREMENT,
patient_id INT,
FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
admission_date DATE NOT NULL,
discharge_date DATE NOT NULL,
discharge_disposition VARCHAR(255) NOT NULL,
service VARCHAR(255) NOT NULL,
primary_diagnosis VARCHAR(255) NOT NULL
);
--Table Name: discharges
CREATE TABLE discharges(
discharge_id INT PRIMARY KEY AUTO_INCREMENT,
admission_id INT,
FOREIGN KEY(admission_id) REFERENCES admission(admission_id),
patient_id INT,
FOREIGN KEY(patient_id) REFERENCES patients(patient_id),
discharge_date DATE NOT NULL,
discharge_disposition VARCHAR(255) NOT NULL
);