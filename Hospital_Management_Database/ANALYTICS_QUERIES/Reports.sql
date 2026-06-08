TOTAL REVENUE:-
select sum(amount) as totat_revenue
from billing;


MOST CONSULTED DOCTOR:-
SELECT d.doctor_name,
       COUNT(a.appointment_id) AS total_appointments
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY total_appointments DESC;


DEPARTMENT-WISE PATIENT DISTRIBUTION:-
SELECT dep.department_name,
       COUNT(DISTINCT a.patient_id) AS patient_count
FROM departments dep
JOIN doctors d
ON dep.department_id = d.department_id
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY dep.department_name
ORDER BY patient_count DESC;


DOCTOR PERFORMANCE ANALYSIS:-
SELECT d.doctor_name,
       COUNT(DISTINCT a.patient_id) AS patients_handled
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_name
ORDER BY patients_handled DESC;


REVENUE BY DEPARTMENT:-
SELECT dep.department_name,
       SUM(b.amount) AS revenue
FROM departments dep
JOIN doctors d
ON dep.department_id = d.department_id
JOIN appointments a
ON d.doctor_id = a.doctor_id
JOIN billing b
ON a.patient_id = b.patient_id
GROUP BY dep.department_name
ORDER BY revenue DESC;


APPOINTMENT STATUS ANALYSIS:-
SELECT status,
       COUNT(*) AS total_appointments
FROM appointments
GROUP BY status;


PENDING PAYMENT ANALYSIS:-
SELECT SUM(amount) AS pending_amount
FROM billing
WHERE payment_status = 'Pending';


DOCTOR REVENUE CONTRIBUTION:-
SELECT d.doctor_name,
       SUM(b.amount) AS revenue_generated
FROM doctors d
JOIN appointments a
ON d.doctor_id = a.doctor_id
JOIN billing b
ON a.patient_id = b.patient_id
GROUP BY d.doctor_name
ORDER BY revenue_generated DESC;