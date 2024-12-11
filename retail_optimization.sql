use retail;

select * from salespeople;

exec sp_help salespeople;

select * from salespeople where snum = 1005;

select * from salespeople where city = 'London';

select * from salespeople where comm = 0.15;

select * from customer;

--create non clustered index
CREATE NONCLUSTERED INDEX ix_city_name
ON salespeople (city);  

CREATE TABLE parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);

INSERT INTO 
    parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (5,'Shock Absorber'),
    (4,'Fork');

select * from parts where part_id = 5;

ALTER TABLE parts
ADD PRIMARY KEY(part_id);

select * from parts where part_id = 5;


select * from parts;

--create a table without pk
create table student_att(
student_id int,
att_dt date,
presence varchar(1));

insert into student_att values(101, '2024-01-01', 'P'),
(102, '2024-01-01', 'P'),(101, '2024-01-02', 'A');

select * from student_att;

ALTER TABLE student_att alter column student_Id int NOT NULL;

ALTER TABLE student_att
ADD PRIMARY KEY(student_id);

select * from student_att where student_id = 101;

--create a clustered index
CREATE CLUSTERED INDEX ix_student_id
ON student_att (student_id);  