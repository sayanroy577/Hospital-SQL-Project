#1.Find total salary expenditure from all workers.
select sum(salary) as total_salary from worker;


#2.Get the name and IDs of doctors who work in the 'Pediatric' department.
select worker.fname as first_name,worker.lname as last_name,doctor.Department_ID as ID
from worker join doctor on worker.Worker_ID=doctor.D_Worker_ID
where doctor.Department_ID='Pediatric';


#3.Retrieve the names and phone numbers of all the patients who have been diagnosed with 'Flu'.
select patient.fname as first_name,patient.lname as last_name,patient.telephone as phone_number 
from patient join diagnosis on patient.Patient_ID=diagnosis.Patient_ID
where diagnosis.Illness='Flu';


#4.Find the total number of workers in each department.
select department.Department_ID,count(worker.Worker_ID)
from department join doctor on department.Department_ID=doctor.Department_ID
join worker on doctor.D_Worker_ID=worker.Worker_ID
group by department.Department_ID;


#5.List the details of patients who has been prescribed 'C312'.
select * from patient join medication_prescribed on patient.Patient_ID=medication_prescribed.Patient_ID
join medication on medication_prescribed.Medication_ID=medication.Medication_ID
where medication_prescribed.Medication_ID='C312';


#6.Find all doctors who have treated a patient for 'Anemia'.
select * from doctor join worker on doctor.D_Worker_ID=worker.Worker_ID
join diagnosis on doctor.Doctor_ID=diagnosis.Doctor_ID
where diagnosis.Illness='Anemia';


#7.Find the details of Cafeteria Staffs.
select * from cafeteria_staff join staff on cafeteria_staff.Staff_ID=staff.Staff_ID
join worker on staff.S_Worker_ID=worker.Worker_ID;


#8.Find the details of doctor who has treated the patient 'Jenny'.
select doctor.Doctor_ID,worker.fname as first_name,worker.lname as last_name,worker.Gender,worker.telephone,worker.Salary,doctor.Degree
from worker join doctor on worker.Worker_ID=doctor.D_Worker_ID
join tests on doctor.Doctor_ID=tests.Doctor_ID
join patient on tests.Patient_ID=patient.Patient_ID
where patient.fname='Jenny'; 


#9.Show the details of the patient who is going through 'Chemotherapy' treatment.
select * from patient join bill on patient.Bill_ID=bill.Bill_ID
where bill.Treatment='Chemotherapy';


#10.Find the details of the staff who is taking care of the patient 'Harry'.
SELECT worker.Worker_ID,staff.Staff_ID,cafeteria.Cafeteria_ID,worker.fname AS first_name,worker.lname AS last_name,
worker.telephone,worker.Gender,worker.Salary,staff.Job_Title,cafeteria_staff.Position 
FROM worker JOIN staff ON worker.Worker_ID = staff.S_Worker_ID
JOIN cafeteria_staff ON staff.Staff_ID = cafeteria_staff.Staff_ID
JOIN cafeteria ON cafeteria_staff.Cafeteria_ID = cafeteria.Cafeteria_ID
JOIN patient ON cafeteria.Cafeteria_ID = patient.Cafeteria_ID
WHERE patient.fname = 'Jenny';











