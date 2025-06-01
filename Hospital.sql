-- 1.List all doctors' first and last names along with their department names.
SELECT 
    worker.fname, worker.lname, doctor.Department_ID
FROM
    worker
        JOIN
    doctor ON worker.Worker_ID = doctor.D_Worker_ID;
    

-- 2.Find the names and blood types of all patients older than 40. 
SELECT 
    fname, lname, Blood_Type
FROM
    patient
WHERE
    Age > 40;
    

 -- 3.Retrieve all medications that will expire before the end of 2025.
SELECT 
    *
FROM
    medication
WHERE
    Expiration_Date < '2025-12-31'; 
    
    
-- 4.Display the full name and salary of all workers earning more than $100,000.
SELECT 
    fname, lname, salary
FROM
    worker
WHERE
    Salary > 100000;


-- 5.List all patients and the doctors who diagnosed them (include names of both).
SELECT 
    patient.fname AS patient_first_name,patient.lname AS patient_last_name,
    worker.fname AS doctor_first_name,worker.lname AS doctor_last_name
FROM
    worker
        JOIN
    doctor ON worker.Worker_ID = doctor.D_Worker_ID
        JOIN
    doctor_patient ON doctor.Doctor_ID = doctor_patient.Doctor_ID
        JOIN
    patient ON doctor_patient.Patient_ID = patient.Patient_ID; 
    
    
-- 6.Get the names of cafeteria staff and the cafeterias they work in.
SELECT 
    worker.fname,worker.lname,
    cafeteria.Cafeteria_ID,cafeteria.Food_Type
FROM
    worker
        JOIN
    staff ON worker.Worker_ID = staff.S_Worker_ID
        JOIN
    cafeteria_staff ON staff.Staff_ID = cafeteria_staff.Staff_ID
        JOIN
    cafeteria ON cafeteria_staff.Cafeteria_ID = cafeteria.Cafeteria_ID;
    
    
-- 7.List all patients along with their prescribed medications.
SELECT 
    patient.fname,patient.lname,
    medication.Medication_ID,medication.Doses
FROM
    patient
        JOIN
    medication_prescribed ON patient.Patient_ID = medication_prescribed.Patient_ID
        JOIN
    medication ON medication_prescribed.Medication_ID = medication.Medication_ID;
    
    
-- 8.Find the average salary of workers by gender.
SELECT 
    Gender, AVG(Salary) AS Average_Salary
FROM
    worker
GROUP BY Gender;


-- 9.Find patients who have been prescribed more than one medication.
SELECT 
    medication_prescribed.Patient_ID,
    patient.fname AS Patient_First_Name,
    patient.lname AS Patient_Last_Name
FROM
    medication_prescribed
        JOIN
    patient ON medication_prescribed.Patient_ID = patient.Patient_ID
GROUP BY medication_prescribed.Patient_ID
HAVING COUNT(*) > 1;


-- 10.List the doctors who have never diagnosed a patient with 'Diabetes'.
SELECT 
    worker.fname AS Doctor_First_Name,
    worker.lname AS Doctor_Last_Name
FROM worker JOIN doctor 
ON worker.Worker_ID = doctor.D_Worker_ID
WHERE doctor.Doctor_ID NOT IN (
SELECT Doctor_ID FROM diagnosis WHERE Illness = 'Diabetes'
); 

    
    