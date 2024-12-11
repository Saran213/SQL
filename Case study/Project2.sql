create database UserRoles;

use UserRoles;

--Creating user account table
create table UserAccount(
	ID int not null primary key,
	UserName varchar(100) not null,
	Email varchar(254) not null,
	Password varchar(200) not null,
	Password_Salt varchar(50) null,
	Password_Hash_Algorithm varchar(50) not null
);

create table role(
	ID int not null primary key,
	RoleName varchar(100) not null
);

create table UserHasRole(
	ID INT not null primary key,
	RoleStartTime datetime not null,
	RoleEndTime datetime null, --can't use timestamp more than one in a row
	UserAccountID INT not null,
	foreign key(UserAccountID) references UserAccount(ID),
	RoleID INT not null,
	foreign key(RoleID) references role(ID)
);

create table status(
	ID int not null primary key,
	StatusName varchar(100) not null,
	IsUserWorking bit not null
);

create table UserHasStatus(
	ID int not null primary key,
	StatusStartTime datetime not null,
	StatusEndTime datetime null, --can't use timestamp more than one in a row
	UserAccountID int not null,
	foreign key(UserAccountID) references UserAccount(ID),
	StatusID int not null,
	foreign key(StatusID) references status(ID)
);

/*Insert data into each of the above tables. With at least two 
rows in each of the tables. Make sure that you 
have created respective foreign keys.*/
insert into UserAccount values
(1, 'John', 'john001@gmail.com', 'Jon1345@', 'jn1234', 'sha-256'),
(2, 'Arun', 'arun1458@gmail.com', 'arn@123', 'an12345', 'aes'),
(3, 'Sharuk', 'sharuk435@gmail.com', 'srk@123', '145', 'md-5');

insert into role values
(305, 'Software developer'),
(403, 'Web developer'),
(501, 'Hardware engineer');

insert into UserHasRole values
(101, '2022-12-01 09:15:00', '2026-03-01 20:15:00', 1, 305),
(102, '2023-03-18 08:45:00', '2025-05-20 20:45:00', 2, 403),
(103, '2024-08-01 09:30:00', '2027-10-15 19:30:00', 3, 501);

insert into status values
(151, 'yet_to_start', 0),
(236, 'started', 1),
(314, 'yet_to_start', 0);

insert into UserHasStatus values
(101, '2022-12-01 09:15:00', '2026-03-01 20:15:00', 1, 151),
(102, '2023-03-18 08:45:00', '2025-05-20 20:45:00', 2, 236),
(103, '2024-08-01 09:30:00', '2027-10-15 19:30:00', 3, 314);

select * from UserAccount;
select * from role;
select * from UserHasRole;
select * from status;
select * from UserHasStatus;

--Delete all the data from each of the tables.
delete from UserAccount;
delete from UserHasRole;
delete from role;
delete from UserHasStatus;
delete from status;