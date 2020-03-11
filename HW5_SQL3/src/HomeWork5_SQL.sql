create database if not exists library  char set utf8;
  
 show databases;
 
 drop table if exists library.bookFive; 
 
 create table if not exists library.bookFive(
 id int primary key auto_increment,
 bookName varchar(120) not null,
 bookPrice int not null,
 description text,
 publishDate date not null default "2018-01-01",
category varchar (30) not null,
isbn bigint(13) not null unique,
amountPages int not null,
authorFirstName varchar (45) not null ,
authorLastName varchar (45) not null,
authorEmail varchar (50) not null unique,
authorAge int (3) not null, # at the moment when book was published.
authorBirthday date not null,
authorDied date default null,
authorAwards varchar (200) default null
 );
   
  insert into library.bookFive (bookName, bookPrice, description, publishDate, category, isbn, amountPages, authorFirstName, authorLastName, authorEmail, authorAge, authorBirthday, authorDied, authorAwards) 
  value 
("Чорний ворон", 135, "Боротьба українських повстанців проти радянської влади у 1920-х роках.", "2009-01-01", "Історичний роман", 9789661406628, 384, "Василь", "Шкляр", "vasylshkliar@gmail.com", 58, "1951-06-10", null, 
 "«Золоте перо», «Золотий Бабай», «Коронація слова», «Спіраль століть», Національна премія України імені Тараса Шевченка, Всеукраїнська літературна премія імені Василя Симоненка "),

 ("Ключ", 140, "Журналіст Андрій Крайній розкриває кримінальну історію зниклого чоловіка...", "1999-01-01", "Детектив", 9786171254176, 256, "Василь", "Шкляр", "vasylshkliar@hotmail.com", 48, "1951-06-10", null, 
 "«Золоте перо», «Золотий Бабай», «Коронація слова», «Спіраль століть», Національна премія України імені Тараса Шевченка, Всеукраїнська літературна премія імені Василя Симоненка "),
 
 ("Три мушкете́ри", 356, default, "1844-05-01", "Роман", 9785699458363, 736, "Олександр", "Дюма", "oleksandrduma@gmail.com", 42, "1802-07-24", "1870-12-05", "Орден Почесного легіону"),
 ("Граф Монте-Крісто", 478, "Основною ідеєю є те, що помста не приносить щастя.", "1844-10-01", "Історичний роман", 9785960304788, 464, "Олександр", "Дюма", "oleksandrduma@hotmail.com", 42, 
 "1802-07-24", "1870-12-05", "Орден Почесного легіону"),
 
 ("Перший козак в Америці", 55, "Про козаків", "1975-05-01", "Історичний роман", 9789824534279, 243, "Ірина", "Лаврівська", "irynalavrivska@gmail.com", 57, "1918-11-18", "2002-12-22", default),
 ("Собо́р Пари́зької Богома́тері", 58, "Про собор...", "1831-01-14", "Історичний роман", 9789661044325, 940, "Віктор", "Гюго", "viktorhugo@gmail.com", 29, "1802-02-26", "1885-05-22", "Орден Почесного легіону, Конкур женераль"),
 
 ("Жовтий князь", 62, "Про голодомор в Ураїні", "1963-01-14", "Історичний твір", 9789660338951, 320, "Василь", "Барка", "vasylbarka@gmail.com", 55, "1908-07-16", "2003-04-11", 
 "Премія фундації Антоновичів"),

("Чо́рна ра́да", 65, default, "1846-02-01", "Історичний роман", 9789660383036, 176, "Пантелеймон", "Куліш", "panteleimonkulish@gmail.com", 27, "1819-08-07", "1897-02-14", default),

("Роксоляна", 109, "Про українську дівчину, яка потрапила в татарський ясир.", default, "Історична повість", 9786177025343, 368, "Осип", "Назарук", "osypnazaruk@gmail.com", 43, "1883-08-31", "140-03-31", default),

("Війна і мир", 112, "Війна 1812 року...", "1869-09-07", "Філософський роман", 9785389071230, 1472, "Лев", "Товстий", "levtovstyi@gmail.com", 27, "1828-09-09", "1910-11-07", 
"Орден Святої Ганни 4-го ступеня, двома медалями до 50-ліття захисту Севастополя");
 
 select * from library.bookFive;
 
 update library.bookFive set authorLastName = "Kulish" where id = 8; 
 
 update library.bookfive  
 set authorLastName = "Tovstyi" 
where  authorLastName = "Товстий" and id <>0; 
 
 select count(*) as "Amount of writters whose have an award" from library.bookFive where authorAwards is not null;
 
 select min(amountPages) as "minimum number of pages" from library.bookFive;
 select * from library.bookFive where amountPages = (select min(amountPages) from library.bookFive);

select max(amountPages) as "maximum number of pages" from library.bookFive;
select * from library.bookFive where amountPages = (select max(amountPages) from library.bookFive);

select avg(amountPages) as "average value of number pages" from library.bookFive;        # 535.9000
select ceil(avg(amountPages)) as "average value of number pages" from library.bookFive;  # 536  
select floor(avg(amountPages)) as "average value of number pages" from library.bookFive; # 535  
select round(avg(amountPages)) as "average value of number pages" from library.bookFive; # 536  

select avg(bookPrice) from library.bookFive;
select count(category) from library.bookFive where category = "роман";
select count(category) from library.bookFive where not category = "роман";

select min(bookPrice) as "minimum price of a book", bookName from library.bookFive where bookPrice = (select min(bookPrice) from library.bookFive);
select * from library.bookFive where bookPrice = (select min(bookPrice) from library.bookFive);
select min(bookPrice) as "maximum price of a book" from library.bookFive ;

select max(bookPrice) as "maximum price of a book" from library.bookFive ;

 select round(bookPrice*1/1,4) as "bookPrice with 4 digits after point" from library.bookFive  ;
 select * from library.bookFive where bookPrice = round(bookPrice*1/1,4);

select * from library.bookFive order by id limit 5; 
select * from library.bookFive order by publishDate limit 3,10 ;

select * from library.bookFive where bookPrice like "5%";
select * from library.bookFive where publishDate like "%31%";
select * from library.bookFive where authorLastName like "%ий";
select * from library.bookFive where authorLastName not like "%ий";

select * from library.bookFive where bookPrice between 60 and 120;
select * from library.bookFive where bookPrice not between 60 and 80;

# select * from library.bookFive;
delete from library.bookFive where id=1;
delete from library.bookFive where bookName="роксоляна" and id <> 0;
delete from library.bookFive where isbn='9785960304788' and id <> 0;





