create database if not exists library  char set utf8;
  
-- alter database library character set utf8 collate utf8_general_ci;

-- show databases;
-- use library;
 
 drop table if exists library.bookFour; 
 
 create table if not exists library.bookFour(
 id int primary key auto_increment,
 bookName varchar(120) not null,
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

describe bookFour;
    
  insert into library.bookFour (bookName, description, publishDate, category, isbn, amountPages, authorFirstName, authorLastName, authorEmail, authorAge, authorBirthday, authorDied, authorAwards) 
  value 
 ("Чорний ворон", "Боротьба українських повстанців проти радянської влади у 1920-х роках.", "2009-01-01", "Історичний роман", 9789661406628, 384, "Василь", "Шкляр", "vasylshkliar@gmail.com", 58, "1951-06-10", null, 
 "«Золоте перо», «Золотий Бабай», «Коронація слова», «Спіраль століть», Національна премія України імені Тараса Шевченка, Всеукраїнська літературна премія імені Василя Симоненка "),

 ("Ключ", "Журналіст Андрій Крайній розкриває кримінальну історію зниклого чоловіка...", "1999-01-01", "Детектив", 9786171254176, 256, "Василь", "Шкляр", "vasylshkliar@hotmail.com", 48, "1951-06-10", null, 
 "«Золоте перо», «Золотий Бабай», «Коронація слова», «Спіраль століть», Національна премія України імені Тараса Шевченка, Всеукраїнська літературна премія імені Василя Симоненка "),
 
 ("Три мушкете́ри", default, "1844-05-01", "Роман", 9785699458363, 736, "Олександр", "Дюма", "oleksandrduma@gmail.com", 42, "1802-07-24", "1870-12-05", "Орден Почесного легіону"),
 ("Граф Монте-Крісто", "Основною ідеєю є те, що помста не приносить щастя.", "1844-10-01", "Історичний роман", 9785960304788, 464, "Олександр", "Дюма", "oleksandrduma@hotmail.com", 42, 
 "1802-07-24", "1870-12-05", "Орден Почесного легіону"),
 
 ("Перший козак в Америці",  "Про козаків", "1975-05-01", "Історичний роман", 9789824534279, 243, "Ірина", "Лаврівська", "irynalavrivska@gmail.com", 57, "1918-11-18", "2002-12-22", default),
 ("Собо́р Пари́зької Богома́тері", "Про собор...", "1831-01-14", "Історичний роман", 9789661044325, 940, "Віктор", "Гюго", "viktorhugo@gmail.com", 29, "1802-02-26", "1885-05-22", "Орден Почесного легіону, Конкур женераль"),
 
 ("Жовтий князь", "Про голодомор в Ураїні", "1963-01-14", "Історичний твір", 9789660338951, 320, "Василь", "Барка", "vasylbarka@gmail.com", 55, "1908-07-16", "2003-04-11", 
 "Премія фундації Антоновичів"),

("Чо́рна ра́да", default, "1846-02-01", "Історичний роман", 9789660383036, 176, "Пантелеймон", "Куліш", "panteleimonkulish@gmail.com", 27, "1819-08-07", "1897-02-14", default),

("Роксоляна", "Про українську дівчину, яка потрапила в татарський ясир.", default, "Історична повість", 9786177025343, 368, "Осип", "Назарук", "osypnazaruk@gmail.com", 43, "1883-08-31", "140-03-31", default),

("Війна і мир", "Війна 1812 року...", "1869-09-07", "Філософський роман", 9785389071230, 1472, "Лев", "Товстий", "levtovstyi@gmail.com", 27, "1828-09-09", "1910-11-07", 
"Орден Святої Ганни 4-го ступеня, двома медалями до 50-ліття захисту Севастополя");
 
 
 select * from library.bookFour;
 select * from library.bookFour where id = 5 or id = 8 or id = 10;
 select * from library.bookFour where amountPages>150;
 select * from library.bookFour where authorAge>30;
 select * from library.bookFour where authorAwards is null;
 select * from library.bookFour where authorEmail = "oleksandrduma@gmail.com" ;
 select * from library.bookFour where isbn = 9786171254176 ;
 
 select * from library.bookFour where category = "роман";
 select * from library.bookFour where category = "історичний роман";
 select * from library.bookFour where category = "детектив";
 
 select * from library.bookFour where amountPages>200 and authorAge>25;
 select * from library.bookFour where category = "детектив" or category = "роман"; 
 select * from library.bookFour order by bookName ;
 select * from library.bookFour order by authorEmail;
 select * from library.bookFour order by amountPages desc ;
 select  distinct category from library.bookFour;
 select  distinct authorLastName from library.bookFour;
 select * from library.bookFour where publishData > "2000-01-01";
 select * from library.bookFour where publishData < "2010-01-01";
 
 select distinct authorLastName as authorSurname from library.bookFour where authorDied is null;
 select distinct * from library.bookFour where authorDied is not null;
 
 



