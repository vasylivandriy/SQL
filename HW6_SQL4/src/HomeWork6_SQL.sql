show databases;

drop database if exists library_six;
create database if not exists library_six char set utf8;

drop table if exists library_six.bookSix;  
drop table if exists library_six.categorySix;  
 
 create table if not exists library_six.bookSix(
 book_id int primary key auto_increment,
 bookName varchar(120) not null,
 bookPrice int not null,
 description text default null,
 isbn bigint(13) not null unique,
constraint book_FK foreign key (book_id) references library_six.categorySix (category_id)
 );
    
create table if not exists library_six.categorySix(
category_id int unique,
category varchar (30) default null 
 );
   
insert into library_six.bookSix (bookName, bookPrice, description, isbn) 
  values 
("Чорний ворон", 135, "Боротьба українських повстанців проти радянської влади у 1920-х роках.", 9789661406628),
("Ключ", 140, "Журналіст Андрій Крайній розкриває кримінальну історію зниклого чоловіка...", 9786171254176),
("Три мушкете́ри", 356, default, 9785699458363),
 ("Граф Монте-Крісто", 478, "Основною ідеєю є те, що помста не приносить щастя.", 9785960304788),
 ("Перший козак в Америці", 55, "Про козаків", 9789824534279-22),
 ("Собо́р Пари́зької Богома́тері", 58, "Про собор...", 9789661044325),
 ("Жовтий князь", 62, "Про голодомор в Ураїні", 9789660338951),
("Чо́рна ра́да", 65, default, 9789660383036),
("Роксоляна", 109, "Про українську дівчину, яка потрапила в татарський ясир.", 9786177025343),
("Війна і мир", 112, "Війна 1812 року...", 9785389071230);
   
   insert into library_six.categorySix (category_id, category)
   values
   (1, "Історичний роман"),
   (2, "Детектив"),
   (3, "Роман"),
   (4, "Історичний роман"),
   (5, "Історичний роман"),
   (6, "Історичний роман"),
   (7, "Історичний твір"),
   (8, "Історичний роман"),
   (9, "Історична повість"),
   (10, "Філософський роман");
   
   select * from library_six.bookSix ;
   select * from library_six.categorySix;
   