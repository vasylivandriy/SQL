drop database if exists library_seven;
create database if not exists library_seven char set utf8;
 
 create table if not exists library_seven.categoryseven(
category_id int unique,
category varchar (30) default null 
 );
 
create table if not exists library_seven.bookAuthorseven(
book_author_id int not null unique,
authorFirstName varchar (45) not null ,
authorLastName varchar (45) not null,
authorEmail varchar (50) not null unique,
authorBirthday date not null
 );
 
 create table if not exists library_seven.bookseven(
 book_id int primary key auto_increment,
 bookName varchar(120) not null,
 category_id int,
 bookPrice int not null,
 description text default null,
 isbn bigint(13) not null unique,
 author_id int not null,
 constraint bookCategory_FK foreign key (category_id) references library_seven.categoryseven (category_id),
 constraint bookAuthor_FK foreign key (author_id) references library_seven.bookAuthorseven (book_author_id)
 );
    

 
 insert into library_seven.categoryseven (category_id, category)
   values
   (1, "Історичний роман"),
   (2, "Детектив"),
   (3, "Роман"),
   (4, "Історичний твір"),
   (5, "Історична повість"),
   (6, "Філософський роман");
   
  insert into library_seven.bookAuthorseven(book_author_id, authorFirstName, authorLastName, authorEmail, authorBirthday) 
  values 
 (1, "Василь", "Шкляр", "vasylshkliar@gmail.com", "1951-06-10"),
 (2, "Олександр", "Дюма", "oleksandrduma@gmail.com", "1802-07-24"),
 (3, "Ірина", "Лаврівська", "irynalavrivska@gmail.com", "1918-11-18"),
 (4, "Віктор", "Гюго", "viktorhugo@gmail.com", "1802-02-26"),
 (5, "Василь", "Барка", "vasylbarka@gmail.com", "1908-07-16"),
 (6, "Пантелеймон", "Куліш", "panteleimonkulish@gmail.com", "1819-08-07"),
 (7, "Осип", "Назарук", "osypnazaruk@gmail.com", "1883-08-31"),
 (8, "Лев", "Товстий", "levtovstyi@gmail.com", "1828-09-09");
 
 
insert into library_seven.bookseven (bookName, category_id, bookPrice, description, isbn, author_id) 
  values 
("Чорний ворон", 1, 135, "Боротьба українських повстанців проти радянської влади у 1920-х роках.", 9789661406628, 1),
("Ключ", null, 140, "Журналіст Андрій Крайній розкриває кримінальну історію зниклого чоловіка...", 9786171254176, 1),
("Три мушкете́ри", 3, 356, default, 9785699458363, 2),
 ("Граф Монте-Крісто", 1, 478, "Основною ідеєю є те, що помста не приносить щастя.", 9785960304788, 2),
 ("Перший козак в Америці", 1, 55, "Про козаків", 978982453427922, 3),
 ("Собо́р Пари́зької Богома́тері", 1, 58, "Про собор...", 9789661044325, 4),
 ("Жовтий князь", 4, 62, "Про голодомор в Ураїні", 9789660338951, 5),
("Чо́рна ра́да", 1, 65, default, 9789660383036, 6),
("Роксоляна", 5, 109, "Про українську дівчину, яка потрапила в татарський ясир.", 9786177025343, 7),
("Війна і мир", 6, 112, "Війна 1812 року...", 9785389071230, 8);
   
     
select * from library_seven.bookseven as b
join library_seven.categoryseven cat
on b.category_id = cat.category_id;

select * from library_seven.bookseven as b
left join library_seven.categoryseven cat
on b.category_id = cat.category_id;

select * from library_seven.bookseven as b
right join library_seven.categoryseven cat
on b.category_id = cat.category_id;

select * from library_seven.bookseven as b
right join library_seven.categoryseven cat
on b.category_id = cat.category_id;

select * from library_seven.bookseven as b
join library_seven.categoryseven cat
on b.category_id = cat.category_id
where description is not null order by bookPrice;

select bookName, bookPrice as price 
from library_seven.bookseven as b
join library_seven.categoryseven cat
on b.category_id = cat.category_id
where category = "історичний роман"
order by b.book_id
limit 3;

select bookName, cat.*, a.* 
from library_seven.bookseven as b
join library_seven.categoryseven as cat
join library_seven.bookAuthorseven as a 
on b.author_id = a.book_author_id and b.category_id = cat.category_id
where cat.category like "%ро%" and cat.category_id >=3
order by a.authorBirthday
limit 4;

