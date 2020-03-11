
drop database if exists librarymodel_six;
create database if not exists librarymodel_six;

create table librarymodel_six.producing_country (
producing_country_id int not null unique,
 producing_country varchar(30) not null 
);

create table librarymodel_six.car_country(
country_id int not null unique,
 country_register_brand varchar(30) not null,
 producing_country_id int not null ,
 foreign key(producing_country_id) references librarymodel_six.producing_country (producing_country_id)
);

create table librarymodel_six.car_engine_cylinders (
cylinders_number_id int not null unique,
 cylinders_number int(2) not null # amount of cylinders
);

create table librarymodel_six.car_engine_power (
engine_horse_power_id int not null unique,
 engine_horse_power int(3) not null #amount horses
);

create table librarymodel_six.car_engine_capacity(
engine_capacity_id int not null unique,
engine_capacity float4(2) not null # liter
);


create table librarymodel_six.car_engine (
engine_id int not null unique,
engine_type varchar(30), #disel petrol electric
cylinders_number_id int not null unique,
horse_power_id int not null unique,
engine_capacity_id int null unique,
foreign key(cylinders_number_id) references librarymodel_six.car_engine_cylinders (cylinders_number_id),
foreign key(horse_power_id) references librarymodel_six.car_engine_power (engine_horse_power_id),
foreign key(engine_capacity_id) references librarymodel_six.car_engine_capacity (engine_capacity_id)
);

create table librarymodel_six.cars (
car_id int not null primary key auto_increment,
model varchar(30) not null unique,
product_country_id int not null unique,
engine_type_id int not null unique,
foreign key(product_country_id) references librarymodel_six.car_country (country_id),
foreign key(engine_type_id) references librarymodel_six.car_engine (engine_id)
);


