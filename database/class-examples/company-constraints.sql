create schema if not exists company;
use company;

-- verificar a tabela de constraints do schema
select * from information_schema.table_constraints where constraint_schema = 'company';

create table employee(
	Fname varchar(15) not null,
	Minit char,
	Lname varchar(15) not null,
	Ssn char(9) not null,
	Bdate date,
	Address varchar(30),
	Sex char,
	Salary decimal(10,2),
	Super_ssn char(9),
	Dno int not null,
    constraint chk_salary_employee check (Salary > 2000.0),
    constraint pk_employee primary key (Ssn)
);

alter table employee
	add constraint fk_employee
    foreign key (Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;


 create table departament(
	Dname varchar(15) not null unique,
	Dnumber int not null,
	Mgr_ssn char(9),
	Mgr_start_date date,
    Dpt_create_date date,
    constraint chk_date_dpt check(Dpt_create_date < Mgr_start_date),
	constraint pk_dept primary key (Dnumber),
	constraint unique_name_dpt unique (Dname),
	foreign key (Mgr_ssn) references employee(Ssn)
);

-- 'def', 'company', 'departament_ibfk_1', 'company', 'departament', 'FOREIGN KEY', 'YES'
alter table departament drop constraint departament_ibfk_1;
alter table departament 
	add constraint fk_dpt foreign key (Mgr_ssn) references employee(Ssn)
	on update cascade; 


create table dept_locations(
	Dnumber int not null,
	Dlocation varchar(15) not null,
	constraint pk_dept_locations primary key (Dnumber, Dlocation),
	constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
);

alter table dept_locations drop constraint fk_dept_locations;
alter table dept_locations
	add constraint fk_dpt_locations foreign key (Dnumber) references departament(Dnumber)
	on delete cascade
    on update cascade;

create table project(
	Pname varchar(15) not null,
	Pnumber int not null,
	Plocation varchar(15),
	Dnum int not null,
	constraint pk_project primary key (Pnumber),
	constraint unique_project_name unique (Pname),
	constraint fk_project foreign key (Dnum) references departament(Dnumber)
);

create table works_on(
	Essn char(9) not null,
	Pno int not null,
	Hours decimal(3,1) not null,
	constraint pk_works_on primary key (Essn,Pno),
	constraint fk_works_on_employee foreign key (Essn) references employee(Ssn),
	constraint fk_works_on_project foreign key (Pno) references project(Pnumber)
);

create table dependent(
	Essn char(9) not null,
	Dependent_name varchar(15) not null,
	Sex char,
	Bdate date,
	Relationship varchar(8),
    Age int not null,
    constraint chk_dependent_age check (Age < 21),
	constraint pk_dependent primary key (Essn, Dependent_name),
	constraint fk_dependent foreign key (Essn) references employee(Ssn)
);