Create database hw_student;

Use hw_student;

Create table students_data(
    roll_no int NOT NULL auto_increment,
    first_name varchar(30) NOT NULL default'UNKNOWN',
    last_name varchar(30) NULL,
    class_rank int not null,
    primary key(roll_no)
    );
    
 desc students_data;
 
 insert into students_data(roll_no, first_name, last_name, class_rank) values (1,'Kavita','Gupta',17);
 insert into students_data(first_name, last_name, class_rank) values 
 ('Vidya','Balan',3), ('Nidhi','Sharma',27);
 insert into students_data(first_name, last_name, class_rank) values('Riya','Kumar',12);
 insert into students_data(first_name,class_rank) values 
 ('Drishti',7),
 ('Samiksha',1),
 ('Poornima',6),
 ('Kavya',25);
 insert into students_data(class_rank) values (2),(15);
 insert into students_data(first_name,last_name,class_rank) values 
 ('Harshita','Mehra',4),
 ('Avni','Chaturvedi',5),
 ('Nidhi','KUmari',8),
 ('Pawan','Kumar',10);
 
 select * from students_data;
 
 select roll_no,first_name,class_rank
 from students_data;
 
 select  roll_no as 'Roll number', first_name as 'First name', Last_name as 'last name', class_rank as 'Rank'
 from students_data;
 