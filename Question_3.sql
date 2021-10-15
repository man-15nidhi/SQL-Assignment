Create database pastry_shop;

Show databases;

Use pastry_shop;

Create table menu(
 s_no int not null auto_increment,
 pastry_name varchar(30) not null default 'UNAVAILABLE',
 price int not null default '9999',
 primary key(s_no)
 );
 
desc menu;
 
insert into menu(pastry_name,price) values ('Vanilla pastry',70),('Butter cookie pastry',78),('Chocolate pastry',88),
('Cream & nut pastry',99),('Light vegan pastry',99),('Red velvet pastry',89);
insert into menu(s_no,pastry_name,price) values (9,'Honey cream pastry',76),
(100,'Fruit & nut pastry',88),
(150,'Mixed fruit pastry ',85);
insert into menu(pastry_name,price) values ('Dark forest pastry',89),('mango pastry',75);
insert into menu(price) values (88),(90),(76);
insert into menu(pastry_name) values('Strawberry pastry'),('Ice cream and pastry combo');

select * from menu;
 
 