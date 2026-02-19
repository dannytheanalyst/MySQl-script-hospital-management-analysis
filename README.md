PROJECT TITLE: Improving Operational Efficiency and Financial Insights in a Hospital Management System Using Relational Data Analysis
By Kpeteh Daniel Terkuma
2025

<img width="975" height="534" alt="image" src="https://github.com/user-attachments/assets/acee8061-eeb4-4734-a272-745852850d6f" />

INTRODUCTION
Hospital management encompasses the administration and coordination of various aspects of a healthcare facility to ensure efficient and effective operations, including strategic planning, financial management, resource allocation, and quality improvement initiatives. It involves overseeing daily activities, managing staff, and utilizing information systems to enhance patient care. 
It is a process of organizing the available resources to support the efficiency and effectiveness of healthcare services provided. The main functions of hospital management include operational management, cost and financial management, materials management, and human resource management.
Problem Statement
Modern hospitals generate vast amounts of operational data, but many still struggle to extract actionable insights from their records. In this project, we aim to analyze key data points across appointments, patients, doctors, treatments, and billing to uncover inefficiencies, revenue gaps, and trends in service delivery. The hospital lacks a centralized system for monitoring doctor workload, treatment profitability, patient visit patterns, and payment statuses — all of which are critical for informed decision-making and efficient resource allocation.
By leveraging structured SQL analysis across these interconnected tables, this project will answer vital operational questions that can help the hospital improve scheduling, financial management, and service delivery.

PROJECT QUESTIONS
1.	 Which doctors handle the highest number of appointments?
2.	What is the revenue contribution by treatment type?
3.	How do patient visits vary by age group or gender?
4.	What percentage of appointments are canceled or not completed?
5.	Which days or times have the most appointments?
6.	What is the insurance coverage rate and its impact on revenue?

DATA relationship
patients.patient_id ↔ appointments.patient_id
appointments.doctor_id ↔ doctors.doctor_id
appointments.appointment_id ↔ treatments.appointment_id
treatments.treatment_id ↔ billing.treatment_id
patients.patient_id ↔ billing.patient_id

METHODOLOGY
Data Cleaning
First thing I did was to create second copies of each of the table
Modified the date and time formats in the data sets which where imported as text. \
There were no duplicate data 

ANALYSIS: CHARTS AND FINDINGS
1.	Which doctors handle the highest number of appointments?
Finding:
The analysis reveals that a small subset of doctors handle a disproportionately high number of appointments, indicating possible overutilization. One or two doctors consistently appear with significantly higher counts, which may affect patient wait times and care quality.
<img width="591" height="452" alt="image" src="https://github.com/user-attachments/assets/73902763-af1b-4d6a-a7d1-47067e83b991" />

2.	What is the revenue contribution by treatment type?
Finding:
Revenue distribution is uneven across treatment types. A few high-cost treatments (e.g., surgery, diagnostic imaging) contribute the majority of income, while lower-cost treatments (e.g., consultations, follow-up visits) are more frequent but generate less revenue overall.
<img width="688" height="452" alt="image" src="https://github.com/user-attachments/assets/bb2e7bf2-fe64-485f-bd34-ffebf0515fd0" />

3.	How do patient visits vary by age group or gender?
Finding:
Patient visits peak within the 25–40 and 60+ age groups, suggesting high service demand from working-age adults and the elderly. Female patients slightly outnumber male patients, especially in routine checkups and wellness treatments.
<img width="897" height="377" alt="image" src="https://github.com/user-attachments/assets/ef0835e8-430e-499a-b05c-c2076049102b" />

4.	What percentage of appointments are canceled or not completed?
Finding:
Approximately 15–20% of scheduled appointments were canceled or marked as incomplete. These no-shows and cancellations could lead to wasted time slots, inefficient resource use, and lost revenue.
<img width="482" height="452" alt="image" src="https://github.com/user-attachments/assets/412dcb95-4433-459a-8d1b-3bc02c4d0e43" />

5.	Which days or times have the most appointments?
Finding:
Midweek days (especially Tuesday and Wednesday) and morning hours (9 AM to 12 PM) show the highest appointment volumes. Weekends and late afternoons have significantly fewer bookings, presenting an opportunity to spread demand more evenly.
<img width="854" height="383" alt="image" src="https://github.com/user-attachments/assets/b175d2bf-d3d5-47b5-a353-50d34e9cd809" />

CONCLUSION
This analysis demonstrates that operational efficiency and financial performance in the hospital can be greatly improved through data-driven insights. By identifying top-performing doctors, treatment profitability, peak patient flow times, and revenue trends, the hospital can better allocate resources, balance workloads, and optimize service delivery.

RECOMMENDATION
1.	Balance Doctor Workloads
Redistribute appointment scheduling across underutilized doctors to avoid burnout and reduce patient wait times.
2.	Optimize High-Revenue Treatments
Prioritize marketing and scheduling for treatments that yield higher revenue, while maintaining quality in high-frequency, low-cost procedures.
3.	Reduce Missed Appointments
Introduce SMS/email reminders or penalty policies to lower the cancellation and no-show rate.
4.	Extend Popular Time Slots
Offer early-morning or late-afternoon shifts on peak days to accommodate demand and increase throughput.
5.	Streamline Insurance Processing
Improve insurance claim workflows to ensure timely reimbursement and reduce revenue lag.
