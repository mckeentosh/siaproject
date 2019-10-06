---------------------------------------------------------------------------------------------------------------
--MonthYear_Record
create table month_year_record (
    month_year_record_id Integer primary key,
    month_year_record_total Integer,
    month_year_record_date varchar(50)
);

INSERT INTO public.month_year_record(
    month_year_record_id, month_year_record_total, month_year_record_date)
    VALUES (1, 4, '2019-10');

INSERT INTO public.month_year_record(
    month_year_record_id, month_year_record_total, month_year_record_date)
    VALUES (1, 4, '2019-09');

---------------------------------------------------------------------------------------------------------------
--Day Records
drop table records;
select * from records;

create table records (
    records_id Integer primary key,
    records_total Integer,
--     records_am Integer,
--     records_pm Integer,
    records_date date unique not null
);

-- INSERT INTO public.records(
--     records_id, records_total, records_am, records_pm, records_date)
--     VALUES (1, 1, 1, 0, '2019-08-26');

INSERT INTO public.records(
    records_id, records_total, records_date)
    VALUES (1, 1, '2019-10-05');

-- INSERT INTO records(
--     records_id, records_total, records_am, records_pm, records_date)
--     VALUES (2, 1, 1, 1, '2019-08-26');

INSERT INTO records(
    records_id, records_total, records_date)
    VALUES (2, 1, '2019-09-05');

Update records set records_total = 2, records_am = 2, sessions_id = 2 where sessions_id = 1;

DELETE FROM records WHERE records_id = 2;

---------------------------------------------------------------------------------------------------------------
--Inside Day Records
drop table day_record;
select * from day_record;
select * from day_record order by day_record_id desc;

create table day_record (
    day_record_id Integer primary key,
    day_record_time varchar(50) not null,
    cadet_id integer REFERENCES cadet unique,
    records_id integer REFERENCES records,
    day_record_attendance_status numeric(2, 1)
);

INSERT INTO public.day_record(
	day_record_id, day_record_time, cadet_id, records_id, day_record_attendance_status)
	VALUES (1, '01:25', 5, 1, 1);

INSERT INTO public.day_record(
	day_record_id, day_record_time, cadet_id, records_id, day_record_attendance_status)
	VALUES (2, '01:37', 4, 1, 1);

---------------------------------------------------------------------------------------------------------------
--Inside Day Records (ARCHIVE)
drop table day_record_archive;
select * from day_record_archive;
select * from day_record_archive order by day_record_id desc;

create table day_record_archive (
    day_record_archive_id Integer,
    day_record_archive_time varchar(50) not null,
    day_record_archive_cadet_id integer,
    day_record_archive_records_id integer,
    day_record_archive_attendance_status numeric(2, 1)
);

DELETE FROM day_record_archive WHERE day_record_archive_id = 1;

INSERT INTO public.day_record_archive(
	day_record_archive_id, day_record_archive_time, cadet_id, records_id, day_record_archive_attendance_status)
	VALUES (1, '01:25', 5, 1, 1);

INSERT INTO public.day_record_archive(
	day_record_archive_id, day_record_archive_time, cadet_id, records_id, day_record_archive_attendance_status)
	VALUES (2, '01:37', 4, 1, 1);
---------------------------------------------------------------------------------------------------------------
--Scratch
--UPDATE
update day_record_archive 
set day_record_archive_id = day_record.day_record_id,
day_record_archive_time = day_record.day_record_time,
day_record_archive_cadet_id = day_record.cadet_id,
day_record_archive_records_id = day_record.records_id,
day_record_archive_attendance_status = day_record.day_record_attendance_status 
from day_record 
where day_record_archive.day_record_archive_records_id = day_record.records_id;

--INSERT
insert into day_record_archive
(
day_record_archive_id, 
day_record_archive_time, 
day_record_archive_cadet_id, 
day_record_archive_records_id, 
day_record_archive_attendance_status
) 
select day_record_id, 
day_record_time, 
cadet_id, 
records_id, 
day_record_attendance_status 
from day_record

--UPDATE or INSERT
insert into day_record_archive (day_record_archive_id, day_record_archive_time, day_record_archive_cadet_id, day_record_archive_records_id, day_record_archive_attendance_status )select day_record_id,day_record_time,cadet_id,records_id, day_record_attendance_status from day_record on conflict (day_record_archive_id) do update set day_record_archive_attendance_status = EXCLUDED.day_record_archive_attendance_status;
-- values (
-- day_record.day_record_id,
-- day_record.day_record_time,
-- day_record.day_record,
-- day_record.records_id,
-- day_record.day_record_attendance_status
-- )