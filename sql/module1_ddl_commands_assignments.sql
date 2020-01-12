# Create Table with Predefine Columns
create table doctor(
	id numeric,
    f_name varchar(20),
    m_name varchar(20),
    l_name varchar(20),
    age numeric,
    qualification varchar(50)
);
desc doctor;

# Add New Column in Existing Table
alter table doctor add column speciality varchar(50);
desc doctor;

# Check the constraints on a table
SHOW CREATE TABLE doctor;

# Add Primary Key and Foreign Key on Table
create table patient(
	id int primary key,
	f_name varchar(20),
	m_name varchar(20),
	l_name varchar(20),
    age int
);
desc patient;
create table address(
	id int primary key,
    street varchar(30),
    city varchar(30),
    state varchar(30),
    patient_id int not null,
    constraint fk_patient_id foreign key(patient_id) references patient(id)
);
desc address;

# Remove Unique Constraint
create table appoinment(
	id int primary key,
	contact_number int(10) unique
);
desc appoinment;
show index from appoinment;
alter table appoinment drop index contact_number;
desc appoinment;
