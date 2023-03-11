create database healthcaredb;
use healthcaredb;

create table user_types(
    id int not null,
    type varchar(128),
     primary key (id)
);



create table users(
    id int not null AUTO_INCREMENT,
    name varchar(128),
    email varchar(128),
    password varchar(512),
    dob date,
    type int,
    primary key(id),
    foreign key(type) references user_types(id)
);

create table hospitals(
    id int not null AUTO_INCREMENT,
    name varchar(128),
    email varchar(128),
    phone varchar(64),
    address varchar(256),
    website varchar(63),
    primary key(id)
);

create table blood_types(
    id int not null,
    type varchar(128),
    primary key (id)
);

create table medications(
    id int not null AUTO_INCREMENT,
    name varchar(128),
    cost float,
    primary key(id)
);

create table appointments(
    id int not null AUTO_INCREMENT,
    appointment_time datetime,
    patient_id int,
    doctor_id int,
    has_joined boolean,
    meeting_url varchar(128),
    primary key(id),
    foreign key(patient_id) references users(id),
    foreign key(doctor_id) references users(id)
);

create table patient_infos(
    id int not null AUTO_INCREMENT,
    user_id int,
    blood_type int,
    ehr varchar(128),
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(blood_type) references blood_types(id)
);

create table user_has_medications(
    user_id int not null,
    medication_id int not null,
    quantity int,
    foreign key(user_id)references users(id),
    foreign key(medication_id) references medications(id)
);

create table departments(
    id int not null,
    name varchar(128),
    building varchar(128),
    floor int,
    hospital_id int,
    primary key(id),
    foreign key(hospital_id) references hospitals(id)
);


create table rooms(
    id int not null AUTO_INCREMENT,
    number int not null,
    department_id int not null,
    is_vip boolean,
    no_beds int,
    floor int,
    phone varchar(64),
    cost_day float,
    primary key(id),
    foreign key(department_id) references departments(id)
);



create table services(
    id int not null AUTO_INCREMENT,
    patient_id int not null,
    employee_id int not null,
    department_id int not null,
    description text,
    cost float,
    primary key(id),
    foreign key (patient_id) references users(id),
    foreign key (employee_id) references users(id),
    foreign key (department_id) references department(id)
);

create table employee_infos(
    id int not null AUTO_INCREMENT,
    user_id int not null,
    hospital_id int  not null,
    ssn varchar(128),
    position varchar(128),
    date_joined date,
    date_left date,
    primary key(id),
    foreign key(user_id) references users(id),
    foreign key(hospital_id)references hospitals(id)
);



create table hospital_users(
    user_id int not null,
    hospital_id int  not null,
    is_active boolean,
    position varchar(128),
    date_joined date,
    date_left date,
    foreign key(user_id) references users(id),
    foreign key(hospital_id)references hospitals(id)
);

create table invoices(
    user_id int not null,
    hospital_id int  not null,
    total_amount float,
    date_issued date,
    foreign key(user_id) references users(id),
    foreign key(hospital_id)references hospitals(id)
);

create table user_departmnets(
    department_id int not null,
    hospital_id int not null,
    user_id int not null,
    foreign key (department_id) references departments(id),
    foreign key (hospital_id) references hospitals(id),
    foreign key (user_id) references users(id)
);

create table usesr_rooms(
    id int not null AUTO_INCREMENT,
    user_id int not null,
    room_id int not null,
    date_attended date,
    date_left date,
    bed_id int,
    primary key (id),
    foreign key (user_id) references users(id),
    foreign key (room_id) references rooms(id)
);



insert into user_types 
values
	(1,"admin"),
    (2,"employee"),
    (3,"patient");
    
 insert into blood_types
 VALUES
(1, 'A+'), (2, 'A-'), (3, 'B+'), (4, 'B-'), (5, 'AB+'), (6, 'AB-'), (7, 'O+'), (8, 'O-');