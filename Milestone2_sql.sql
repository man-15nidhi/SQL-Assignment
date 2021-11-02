Create database manavi_db;

use manavi_db;

create table shirts(
    shirt_id int not null auto_increment,
    article varchar(100),
    color varchar(100),
    shirt_size varchar(100),
    last_worn int,
    primary key(shirt_id)
    );

desc shirts;

insert into shirts (article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15),
('purple', 'polo shirt', 'medium', 50);

select * from shirts;

select article,color from shirts;

select * from shirts where shirt_size='M';

select article, color, shirt_size, last_worn from shirts where shirt_size='M';

update shirts set shirt_size='L' where article='polo shirt';
select * from shirts where article='polo shirt';

update shirts set last_worn='0' where last_worn='15';
select * from shirts where last_worn='0';

update shirts set color='off white',shirt_size='XS' where color='white';
select * from shirts where color='off white';

select * from shirts;

Delete from shirts where last_worn >=200;
select * from shirts;

Delete from shirts where article='tank top';
select * from shirts;

Delete from shirts;
select * from shirts;



/*PL/SQL (extra)
1.B -It will print
num: 95
num: 195

2.D - The variable c_id should be
declared as a type-compatible variable
as −
c_id customers.id%type := 1;

3. C - 10
*/