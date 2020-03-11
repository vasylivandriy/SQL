 drop database if exists library_six;
 create database if not exists library_six char set utf8;

 create table if not exists library_six.categorySix(
category_id int unique,
category varchar (30) default null 
 );
 
 create table if not exists library_six.bookAuthorSix(
author_id int(7) not null unique,
authorFirstName varchar (45) not null ,
authorLastName varchar (45) not null,
authorEmail varchar (50) not null unique,
authorBirthday date not null
 );
 
 create table if not exists library_six.bookSix(
 book_id int primary key auto_increment,
 bookName varchar(120) not null,
 category_id int not null unique,
 bookPrice int not null,
 description text default null,
 isbn bigint(13) not null unique,
 author_id int(7) not null,
constraint book_FK foreign key (category_id) references library_six.categorySix (category_id),
constraint bookAuthor_FK foreign key (author_id) references library_six.bookAuthorSix (author_id)
 );
    
