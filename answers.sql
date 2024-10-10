-- Basic Data Retrieval
-- USE hospital;

-- Question 1.1
SELECT first_name, last_name, date_of_birth 
FROM patients;

-- Question 1.2
SELECT provider_id, first_name, provider_specialty
FROM providers;

-- Question 2.1
SELECT * FROM patients
WHERE first_name LIKE'Ab%';

-- Question 2.2
SELECT * FROM providers
WHERE provider_specialty LIKE '%y';

-- Question 3.1
SELECT * FROM patients
WHERE date_of_birth > 1980-01-01;

-- Question 3.2
SELECT * FROM ed_visits 
WHERE acuity >= 2;

-- Question 4.1
SELECT * FROM patients
WHERE language = 'Spanish';

-- Question 4.2
SELECT * FROM ed_visits 
WHERE reason_for_visit = 'Migraine' 
AND ed_disposition = 'Admitted';

-- Question 4.3
SELECT *FROM patients
WHERE date_of_birth BETWEEN '1975-01-01' AND '1980-12-31';

-- Question 5.1
SELECT first_name, last_name 
FROM patients 
ORDER BY last_name ASC;

-- Question 5.2
SELECT * FROM visits 
ORDER BY date_of_visit DESC;

-- Question 6.1
SELECT * FROM admissions
JOIN discharges ON admissions.admission_id = discharges.admission_id
WHERE admissions.primary_diagnosis = 'Stroke'
AND discharges.discharge_disposition = 'Home';

-- Question 6.2
SELECT * FROM providers
WHERE date_joined > '1995-12-31' 
AND provider_specialty = 'Pediatrics' 
OR provider_specialty = 'Cardiology';

-- Bonus Challange
SELECT * FROM discharges
WHERE discharge_disposition = 'Home'
AND discharge_date BETWEEN '2018-03-01' AND '2018-03-07';