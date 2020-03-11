
drop database if exists librarymodel_six;
create database if not exists librarymodel_six;

create table librarymodel_six.producing_country (
producing_country_id int not null unique,
 producing_country varchar(30) not null 
);

insert into librarymodel_six.producing_country(producing_country_id, producing_country)
values
(1, "China"),
(2, "USA"),
(3, "Germny"),
(4, "Ukraine"),
(5, "France"),
(6, "Japan");

create table librarymodel_six.car_country(
country_id int not null unique,
 country_register_brand varchar(30) not null,
 producing_country_id int not null ,
 foreign key(producing_country_id) references librarymodel_six.producing_country (producing_country_id)
);

insert into librarymodel_six.car_country(country_id, country_register_brand, producing_country_id)
values
(1, "China", 1),
(2, "USA", 1),
(3, "USA", 2),
(4, "Germny", 1),
(5, "Germny", 3),
(6, "Ukraine", 4),
(7, "France", 5),
(8, "Japan", 6);


create table librarymodel_six.car_engine_cylinders (
cylinders_number_id int not null unique,
 cylinders_number int(2) not null # amount of cylinders
);

insert into librarymodel_six.car_engine_cylinders (cylinders_number_id, cylinders_number)
values
(1, 2),
(2, 4),
(3, 6),
(4, 8),
(5, 10),
(6, 12);


create table librarymodel_six.car_engine_power (
engine_horse_power_id int not null unique,
 engine_horse_power int(3) not null #amount horses
);

insert into librarymodel_six.car_engine_power (engine_horse_power_id, engine_horse_power)
values
(1, 75),
(2, 88),
(3, 120),
(4, 150),
(5, 200),
(6, 250),
(7, 450);

create table librarymodel_six.car_engine_capacity(
engine_capacity_id int not null unique,
engine_capacity float4(2) not null # liter
);

insert into librarymodel_six.car_engine_capacity (engine_capacity_id, engine_capacity)
values
(1, 1.1),
(2, 1.6),
(3, 1.8),
(4, 2.0),
(5, 3.5),
(6, 5.5),
(7, 6);


create table librarymodel_six.car_engine (
engine_id int not null unique,
engine_type varchar(30), #disel petrol electric
cylinders_number_id int ,
horse_power_id int not null,
engine_capacity_id int,
foreign key(cylinders_number_id) references librarymodel_six.car_engine_cylinders (cylinders_number_id),
foreign key(horse_power_id) references librarymodel_six.car_engine_power (engine_horse_power_id),
foreign key(engine_capacity_id) references librarymodel_six.car_engine_capacity (engine_capacity_id)
);

insert into librarymodel_six.car_engine (engine_id, engine_type, cylinders_number_id, horse_power_id, engine_capacity_id)
values
(1, "disel", 1, 1, 1),
(2, "electric", null, 5, null),
(3, "disel", 4, 3, 2),
(4, "petrol", 4, 5, 5),
(5, "petrol", 3, 4, 4),
(6, "electric", null, 7, null);


create table librarymodel_six.cars (
car_id int not null primary key auto_increment,
model varchar(30) not null unique,
product_country_id int not null ,
engine_type_id int not null ,
foreign key(product_country_id) references librarymodel_six.car_country (country_id),
foreign key(engine_type_id) references librarymodel_six.car_engine (engine_id)
);

insert into librarymodel_six.cars (model, product_country_id, engine_type_id)
values
("Reno Cangoo", 1, 1),
("Tesla model s", 2, 2),
("Lexus rx450", 3, 6),
("Mersedes ml550", 5, 2),
("Daewoo Lanos ", 1, 3),
("Mazda cx5", 4, 3);

select car.car_id, car.model, eng.engine_type, ec.engine_capacity, ep.engine_horse_power, cy.cylinders_number, c.country_register_brand, pc.producing_country
from librarymodel_six.cars as car
join librarymodel_six.car_country as c
join librarymodel_six.car_engine as eng
join librarymodel_six.car_engine_capacity as ec
join librarymodel_six.car_engine_power as ep
join librarymodel_six.producing_country as pc
join librarymodel_six.car_engine_cylinders as cy
on  car.product_country_id = c.country_id and eng.cylinders_number_id = cy.cylinders_number_id 
and eng.horse_power_id = ep.engine_horse_power_id and eng.engine_capacity_id = ec.engine_capacity_id and c.producing_country_id = pc.producing_country_id;