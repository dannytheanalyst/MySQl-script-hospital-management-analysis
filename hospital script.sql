SELECT * FROM appointments;

SELECT * FROM billing;

SELECT * FROM doctors;

SELECT * FROM patients;

SELECT * FROM treatments;

SELECT distinct treatment_id FROM treatments;



ALTER TABLE appointments
MODIFY COLUMN appointment_time time ;


ALTER TABLE billing
MODIFY COLUMN bill_date date;


ALTER TABLE patients
MODIFY COLUMN date_of_birth date;


ALTER TABLE patients
MODIFY COLUMN registration_date date;


ALTER TABLE treatments
MODIFY COLUMN treatment_date date;



CREATE TABLE appointments2 AS 
SELECT * FROM appointments;

CREATE TABLE billing2 AS 
SELECT * FROM billing;

CREATE TABLE doctors2 AS 
SELECT * FROM doctors;

CREATE TABLE patients2 AS 
SELECT * FROM patients;

CREATE TABLE treatments2 AS 
SELECT * FROM appointments;

CREATE VIEW view_most_used_doctors AS
SELECT 
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    d.specialization,
    COUNT(a.appointment_id) AS total_appointments
FROM appointments a
JOIN doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id, d.first_name, d.last_name, d.specialization
ORDER BY total_appointments DESC;


CREATE VIEW view_revenue_by_treatment_type AS
SELECT 
    t.treatment_type,
    COUNT(b.bill_id) AS number_of_bills,
    SUM(b.amount) AS total_revenue,
    ROUND(SUM(b.amount) * 100.0 / (SELECT SUM(amount) FROM billing), 2) AS revenue_percentage
FROM treatments t
JOIN billing b ON t.treatment_id = b.treatment_id
GROUP BY t.treatment_type
ORDER BY total_revenue DESC;


-- 3 How do patient visits vary by age group or gender?

CREATE VIEW view_patient_visits_by_age_gender AS
SELECT
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(p.date_of_birth, '%Y-%m-%d'), CURDATE()) < 18 THEN 'Under 18'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(p.date_of_birth, '%Y-%m-%d'), CURDATE()) BETWEEN 18 AND 35 THEN '18-35'
        WHEN TIMESTAMPDIFF(YEAR, STR_TO_DATE(p.date_of_birth, '%Y-%m-%d'), CURDATE()) BETWEEN 36 AND 60 THEN '36-60'
        ELSE '60+'
    END AS age_group,
    p.gender,
    COUNT(a.appointment_id) AS total_visits
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
GROUP BY age_group, p.gender
ORDER BY age_group, total_visits DESC;


-- 4 What percentage of appointments are canceled or not completed?
CREATE VIEW view_appointment_status_summary AS
SELECT 
    status,
    COUNT(*) AS total_appointments,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM appointments), 2) AS percentage
FROM appointments
GROUP BY status
ORDER BY total_appointments DESC;


-- 5 Which days have the most appointments?

CREATE OR REPLACE VIEW view_appointment_by_day_hour AS
SELECT 
    DAYNAME(appointment_date) AS day_of_week,
    COUNT(*) AS total_appointments
FROM appointments
WHERE appointment_date IS NOT NULL AND appointment_time IS NOT NULL
GROUP BY 
    day_of_week
ORDER BY 
    total_appointments DESC;



-- 6  What is the insurance coverage rate and its impact on revenue?

CREATE VIEW view_insurance_impact_summary AS
SELECT
    insurance_status,
    patient_count,
    ROUND(patient_count * 100.0 / total_patients, 2) AS patient_percentage,
    bills_count,
    total_revenue,
    ROUND(total_revenue * 100.0 / total_billing, 2) AS revenue_percentage
FROM (
    SELECT 
        CASE 
            WHEN p.insurance_provider IS NULL OR p.insurance_provider = '' THEN 'Uninsured'
            ELSE 'Insured'
        END AS insurance_status,
        COUNT(DISTINCT p.patient_id) AS patient_count,
        COUNT(b.bill_id) AS bills_count,
        SUM(b.amount) AS total_revenue,
        (SELECT COUNT(*) FROM patients) AS total_patients,
        (SELECT SUM(amount) FROM billing) AS total_billing
    FROM patients p
    LEFT JOIN billing b ON p.patient_id = b.patient_id
    GROUP BY insurance_status
) AS stats
ORDER BY insurance_status;




CREATE VIEW kpi_total_patients AS
SELECT COUNT(*) AS total_patients FROM patients;


CREATE VIEW kpi_total_appointments AS
SELECT COUNT(*) AS total_appointments FROM appointments;


CREATE VIEW kpi_total_revenue AS
SELECT SUM(amount) AS total_revenue FROM billing;


CREATE VIEW kpi_avg_revenue_per_patient AS
SELECT 
    ROUND(SUM(amount) / COUNT(DISTINCT patient_id), 2) AS avg_revenue_per_patient
FROM billing;


CREATE VIEW kpi_appointment_status_breakdown AS
SELECT 
    status,
    COUNT(*) AS appointment_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM appointments), 2) AS percentage
FROM appointments
GROUP BY status;


CREATE VIEW kpi_insurance_breakdown AS
SELECT 
    CASE 
        WHEN insurance_provider IS NULL OR insurance_provider = '' THEN 'Uninsured'
        ELSE 'Insured'
    END AS insurance_status,
    COUNT(*) AS patient_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM patients), 2) AS patient_percentage
FROM patients
GROUP BY insurance_status;


CREATE VIEW kpi_insurance_revenue_breakdown AS
SELECT 
    CASE 
        WHEN p.insurance_provider IS NULL OR p.insurance_provider = '' THEN 'Uninsured'
        ELSE 'Insured'
    END AS insurance_status,
    COUNT(b.bill_id) AS bills_count,
    SUM(b.amount) AS total_revenue,
    ROUND(SUM(b.amount) * 100.0 / (SELECT SUM(amount) FROM billing), 2) AS revenue_percentage
FROM billing b
JOIN patients p ON b.patient_id = p.patient_id
GROUP BY insurance_status;




SHOW VARIABLES LIKE 'port';


SELECT user, host FROM mysql.user WHERE user = 'root';





