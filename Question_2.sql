use hw_student;

create table teachers(
id_no int auto_increment,
Name varchar(60) not null default 'UNKNOWN USER',
Address varchar(100) null,
Age int not null,
primary key(id_no)
);

desc teachers;

insert into teachers(Name,Address,Age) VALUES ('Priety Goel','Shimla Road, Himachal Pradesh',35),
('Sunil Kumar Verma', 'LodhiRoad, New Delhi',28),
('Priyanka','Tonk,Rajasthan',31);
insert into teachers(Name) VALUES ('Anshika kapoor');
insert into teachers(Address,Age) VALUES ('Dwarka, Delhi',25),('Tonk,Rajasthan',38);
insert into teachers(Name,Age) VALUES ('Sakshi',28),('Sangam Jha',31);

select * from teachers;

UPDATE teachers SET Address='N/A' WHERE Address is null;

select * from teachers;

drop table students_data,teachers;

drop database hw_student;