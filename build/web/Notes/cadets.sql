drop table cadet;
select * from cadet;

create table cadet (
        cadet_id serial primary key,
        cadet_idBarcode varchar(20) unique not null,
        cadet_idUic varchar(20) unique not null,
	cadet_name varchar(50) not null,
	cadet_password varchar(20) not null,
	cadet_position varchar(20) not null,
	cadet_platoon varchar (20) not null,
	cadet_religion varchar (50) not null,
	cadet_gender varchar (1) not null,
	cadet_age varchar(20) not null,
	cadet_DOB varchar(20) not null,
	cadet_course varchar (20) not null,
	cadet_section varchar (20) not null,
        cadet_status varchar (20) not null,
        cadet_points Integer,
        cadet_absents Integer,
        cadet_tardiness Integer,
        cadet_excuses Integer
);

insert into cadet values(1,'245','180000002118','Mckeen Asma','123','admin','alpha','catholic','m','19','07/23/2000','bsit','2b','active','0','0','0');

drop table attendance;
select * from attendance;

create table attendance (
        attendance_id serial primary key,
        cadet_id Integer,
        sessions_id Integer
);

insert into attendance values(1,1,1);

drop table sessions;
select * from sessions;

create table sessions (
        sessions_id serial primary key,
        sessions_date varchar(20) unique not null,
        sessions_am varchar(20) unique not null,
        sessions_pm varchar(20) unique not null
);

insert into sessions values(1, '11/18/2019','present','present');