use healthcaredb;
insert into user_types 
values
	(1,"admin"),
    (2,"employee"),
    (3,"patient");
    
 insert into blood_types
 VALUES
(1, 'A+'), (2, 'A-'), (3, 'B+'), (4, 'B-'), (5, 'AB+'), (6, 'AB-'), (7, 'O+'), (8, 'O-');



-- Dummy data for users table
INSERT INTO users (name, email, password, dob, type)
VALUES ('John Doe', 'johndoe@example.com', 'password123', '1990-01-01', 3),
       ('Jane Doe', 'janedoe@example.com', 'password456', '1985-05-15', 3),
       ('Dr. Smith', 'drsmith@example.com', 'doctorpass', '1970-06-22', 2),
       ('Admin', 'admin@example.com', 'adminpass', '1995-12-25', 1),
       ('jimmy miles', 'jimmymiles@example.com', 'password123', '1991-09-29', 3),
       ('sarah philips', 'sarahph@example.com', 'password123', '1997-01-22', 3),
       ('marcus maine', 'marcmaine@example.com', 'password123', '2001-11-01', 3),
       ('sandy witter', 'sandywitt@example.com', 'password123', '2000-12-31', 3),
       ('robert junior', 'robjun@example.com', 'password123', '1975-04-01', 3),
       ('Dr. Jonah', 'drahmad@example.com', 'doctorpass', '1971-12-30', 2),
       ('Dr. Miley', 'drmiley@example.com', 'doctorpass', '1980-02-03', 2),
       ('Dr. Emily', 'dremily@example.com', 'doctorpass', '1976-01-11', 2),
       ('Dr. Ahmad', 'drahmad@example.com', 'doctorpass', '1990-06-25', 2);




-- Dummy data for hospitals table
INSERT INTO hospitals (name, email, phone, address, website)
VALUES ('General Hospital', 'info@generalhospital.com', '123-456-7890', '123 Main St, Anytown USA', 'http://www.generalhospital.com'),
       ('City Hospital', 'info@cityhospital.com', '555-555-5555', '456 Elm St, Anytown USA', 'http://www.cityhospital.com');



-- Dummy data for medications table
INSERT INTO medications (name, cost)
VALUES ('Aspirin', 1.99),
       ('Ibuprofen', 3.49),
       ('Acetaminophen', 2.99),
       ('Antihistamine', 4.99);

-- Dummy data for appointments table
-- INSERT INTO appointments (appointment_time, patient_id, doctor_id, has_joined, meeting_url)
-- VALUES ('2023-03-13 10:00:00', 1, 3, 0, 'https://meet.google.com/xyz123'),
--        ('2023-03-14 14:30:00', 2, 3, 0, 'https://meet.google.com/abc456'),
--        ('2023-03-15 11:15:00', 2, 3, 0, 'https://meet.google.com/def789');

-- Dummy data for patient_infos table
INSERT INTO patient_infos (user_id, blood_type, ehr)
VALUES (1, 1, 'Patient record for John Doe'),
       (2, 2, 'Patient record for Jane Doe');

-- Dummy data for user_has_medications table
INSERT INTO user_has_medications (user_id, medication_id, quantity)
VALUES (1, 1, 30),
       (1, 2, 20),
       (2, 3, 10);

-- Dummy data for departments table
INSERT INTO departments (id, name, building, floor, hospital_id)
VALUES (1, 'Cardiology', 'Building A', 3, 1),
       (2, 'Neurology', 'Building B', 4, 1),
       (3, 'Emergency', 'Building C', 1, 2),
       (4, 'Pediatrics', 'Building D', 2, 2);

INSERT INTO rooms (number, department_id, is_vip, no_beds, floor, phone, cost_day)
VALUES
  (101, 1, 1, 2, 1, '555-1234', 100),
  (102, 1, 1, 1, 1, '555-1235', 80),
  (103, 2, 0, 4, 2, '555-1236', 120),
  (104, 2, 0, 2, 2, '555-1237', 90),
  (105, 2, 0, 3, 3, '555-1238', 110),
  (106, 3, 0, 1, 1, '555-1239', 70),
  (107, 3, 0, 2, 2, '555-1240', 90),
  (108, 3, 0, 1, 3, '555-1241', 80);


  INSERT INTO services(patient_id, employee_id, department_id, description, cost) VALUES
(1, 6, 1, 'Physical Therapy', 150),
(2, 7, 2, 'X-ray', 200),
(5, 10, 4, 'MRI', 300),
(6, 11, 1, 'Ultrasound', 250),
(7, 12, 2, 'Vaccination', 75),
(8, 13, 3, 'Surgery', 1000),
(9, 13, 4, 'Dental Exam', 150);



INSERT INTO employee_infos (user_id, hospital_id, ssn, position, date_joined, date_left)
VALUES
    (3 1, '123-45-6789', 'Doctor', '2020-01-01', NULL),
    (10, 1, '987-65-4321', 'Doctor', '2021-03-15', NULL),
    (11, 2, '111-22-3333', 'Nurse', '2019-07-01', NULL),
    (12, 1, '444-55-6666', 'Doctor', '2022-02-01', NULL),
    (13,1,'111-22-3333','Doctor','2018-03-01',NULL),
    (4, 2, '777-88-9999', 'IT Specialist', '2021-10-01', NULL);



insert into hospital_users (user_id,hospital_id,is_active,position,date_joined,date_left)
values
	(1, 1, true, "doctor", '2020-01-01', null),
    (2, 1, true, "nurse", '2020-02-01', null),
    (3, 1, true, "receptionist", '2020-03-01', null),
    (4, 2, true, "doctor", '2020-01-01', null),
    (5, 2, true, "nurse", '2020-02-01', null),
    (6, 2, true, "receptionist", '2020-03-01', null);


insert into invoices (user_id ,hospital_id , total_amount,date_issued)
values
	(4, 1, 1500.50, '2022-02-01'),
    (5, 2, 2000.00, '2022-02-15'),
    (6, 2, 1000.00, '2022-03-01');
