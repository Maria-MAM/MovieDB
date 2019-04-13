-- creez baza de date
create database filme;

-- utilizez baza de date
use filme;

-- creez tabelele
create table gen (
id_gen int not null auto_increment primary key,
nume_gen varchar(20));

create table premiu (
id_premiu int not null auto_increment primary key,
nume_academie varchar(50),
categorie varchar(100));

create table actor (
id_actor int not null auto_increment primary key,
nume_scena varchar(50),
nume_complet varchar(70),
data_nastere date,
loc_nastere varchar(50));

create table regizor (
id_regizor int not null auto_increment primary key,
nume_regizor varchar(50),
data_nastere date,
loc_nastere varchar(70));

create table film (
id_film int not null auto_increment primary key,
nume_film varchar(50),
an int,
durata smallint,
ecranizare_carte enum('DA', 'NU'),
id_regizor int,
foreign key (id_regizor) references regizor(id_regizor)
);

create table rating (
id_rating int not null auto_increment primary key,
nota int,
nr_votanti int,
id_film int,
foreign key (id_film) references film(id_film)
);

create table gen_film (
id_gen_film int not null auto_increment primary key,
id_film int,
id_gen int,
foreign key (id_film) references film(id_film),
foreign key (id_gen) references gen(id_gen)
);

create table premiu_film (
id_premiu_film int not null auto_increment primary key,
id_film int,
id_premiu int,
foreign key (id_film) references film(id_film),
foreign key (id_premiu) references premiu(id_premiu)
);

create table rol (
id_rol int not null auto_increment primary key,
id_actor int,
id_film int,
rol varchar(50),
foreign key (id_actor) references actor(id_actor),
foreign key (id_film) references film(id_film));

-- populez tabelele
insert into regizor values 
(1,'Quentin Tarantino','1963-03-27','Knoxville, Tennessee, U.S.'),
(2,'James Cameron','1954-08-16','Kapuskasing, Ontario, Canada'),
(3,'Sam Mendes','1965-08-01','Reading, Berkshire, England'),
(4,'Giorgio Serafini','1962-04-03','Bruxelles, Belgium'),
(5,'Guy Ritchie','1968-09-10','Hatfield, Hertfordshire, England'),
(6,'Alexander Payne','1961-02-10','Omaha, Nebraska, U.S.'),
(7,'Declan Donnellan','1953-08-04','England'),
(8,'Roman Polanski','1933-08-18','Paris, France'),
(9,'Francis Lawrence','1971-03-26','Vienna, Austria'),
(10,'Sylvester Stallone','1946-07-06','Manhattan, New York, U.S.'),
(11,'Simon West','1961-01-01','Letchworth, Hertfordshire, England'),
(12,'Patrick Hughes','1978-09-09','Australia');

insert into film values 
(1,'Pulp Fiction',1994,154,'NU',1),
(2,'Inglourious Basterds',2009,153,'NU',1),
(3,'Titanic',1997,195,'NU',2),
(4,'Revolutionary Road',2008,119,'DA',3),
(5,'Blood of Redemption',2013,85,'NU',4),
(6,'Snatch',2000,102,'cv',5),
(7,'The Descendants',2011,115,'NU',6),
(8,'Downsizing',2017,135,'NU',6),
(9,'Bel Ami',2012,92,'DA',7),
(10,'Carnage',2011,80,'DA',8),
(11,'Water for Elephants',2011,120,'DA',9),
(12,'The Expendables',2010,103,'NU',10),
(13,'The Expendables 2',2012,103,'NU',11),
(14,'The Expendables 3',2014,126,'NU',12),
(15,'Skyfall',2012,143,'DA',3),
(16,'Spectre',2015,148,'DA',3),
(17,'Django Unchained',2012,165,'NU',1);

-- am verificat de ce am eroare la executare 
select * from film
where nume_film ='Snatch';

-- am modificat valoarea coloanei ecranizare_carte pentru filmul Snatch
update film 
set ecranizare_carte='NU'
where nume_film='Snatch';

insert into rating values
(1,8.9,1613253,1),
(2,8.3,1100952,2),
(3,7.8,942021,3),
(4,7.3,176246,4),
(5,4.6,1388,5),
(6,8.3,709374,6),
(7,7.3,222351,7),
(8,5.7,72436,8),
(9,5.4,16935,9),
(10,7.2,110437,10),
(11,6.9,105086,11),
(12,6.5,305200,12),
(13,6.6,275313,13),
(14,6.1,154328,14),
(15,7.8,587449,15),
(16,6.8,348332,16),
(17,8.4,1190549,17);

insert into premiu values
(1,'Academy Awards aka Oscar','Best Picture'),
(2,'Academy Awards aka Oscar','Best Director'),
(3,'Academy Awards aka Oscar','Best Original Song'),
(4,'Academy Awards aka Oscar','Best Visual Effects'),
(5,'Academy Awards aka Oscar','Best Supporting Actor'),
(6,'Academy Awards aka Oscar','Best Screenplay'),
(7,'BAFTA Awards','Best Supporting Actor'),
(8,'BAFTA Awards','Best Picture'),
(9,'Cannes Film Festival','Best Actor'),
(10,'Cannes Film Festival','Palme d\'Or'),
(11,'Golden Globe Award','Best Supporting Actor '),
(12,'Golden Globe Award','Best Actress '),
(13,'Golden Globe Award','Best Picture'),
(14,'Golden Globe Award','Best Director'),
(15,'Golden Globe Award','Best Original Song'),
(16,'Golden Globe Award','Best Screenplay'),
(17,'Golden Globe Award','Best Actor'),
(18,'Satellite Award','Best Picture'),
(19,'Satellite Award','Best Director'),
(20,'Satellite Award','Best Original Song'),
(21,'Satellite Award','Best Supporting Actor'),
(22,'Satellite Award','Best Screenplay'),
(23,'Satellite Award','Best Costume Design'),
(24,'Golden Raspberry','Worst Director');

insert into premiu_film values
(1,3,1),
(2,3,2),
(3,3,3),
(4,15,3),
(5,3,4),
(6,2,5),
(7,17,5),
(8,1,6),
(9,7,6),
(10,2,7),
(11,17,7),
(12,1,7),
(13,15,8),
(14,2,9),
(15,1,10),
(16,2,11),
(17,17,11),
(18,4,12),
(19,3,13),
(20,7,13),
(21,3,14),
(22,3,15),
(23,15,15),
(24,1,16),
(25,17,16),
(26,7,17),
(27,3,18),
(28,7,18),
(29,3,19),
(30,3,20),
(31,2,21),
(32,10,21),
(33,6,21),
(34,15,21),
(35,7,22),
(36,11,23),
(37,12,24);

insert into gen values
(1,'action'),
(2,'black comedy'),
(3,'comedy'),
(4,'crime'),
(5,'disaster'),
(6,'drama'),
(7,'epic'),
(8,'revisionist Western'),
(9,'romance'),
(10,'sf'),
(11,'spy'),
(12,'thriller'),
(13,'tragedy'),
(14,'war');

insert into gen_film values
(1,1,4),
(2,1,12),
(3,1,6),
(4,2,2),
(5,2,14),
(6,3,7),
(7,3,9),
(8,3,5),
(9,4,9),
(10,4,13),
(11,5,4),
(12,5,1),
(13,5,12),
(14,6,4),
(15,6,3),
(16,7,3),
(17,7,6),
(18,8,10),
(19,8,3),
(20,8,6),
(21,9,6),
(22,10,2),
(23,10,6),
(24,11,9),
(25,11,6),
(26,12,1),
(27,13,1),
(28,14,1),
(29,15,11),
(30,16,11),
(31,17,8);

insert into actor values
(1,'Kate Winslet','Kate Elizabeth Winslet','1975-10-05','Reading, Berkshire, England'),
(2,'Leonardo DiCaprio','Leonardo Wilhelm DiCaprio','1974-11-11','Los Angeles, California, U.S.'),
(3,'Uma Thurman','Uma Karuna Thurman','1970-04-29','Boston, Massachusetts, U.S.'),
(4,'Billy Zane','William George Zane Jr.','1966-02-24','Chicago, Illinois, U.S.'),
(5,'John Travolta','John Joseph Travolta','1954-02-18','Englewood, New Jersey, U.S.'),
(6,'Samuel L. Jackson','Samuel Leroy Jackson','1948-12-21','Washington, D.C., U.S.'),
(7,'Bruce Willis','Walter Bruce Willis','1955-03-19','Idar-Oberstein, Rhineland-Palatinate, West Germany'),
(8,'Vinnie Jones','Vincent Peter Jones','1965-01-05','Watford, Hertfordshire, England'),
(9,'Brad Pitt','William Bradley Pitt','1963-12-18','Shawnee, Oklahoma, U.S.'),
(10,'Jason Statham','Jason Statham','1967-07-26','Shirebrook, Derbyshire, England'),
(11,'Matthew Damon','Matthew Paige Damon','1970-10-08','Cambridge, Massachusetts, U.S.'),
(12,'Christoph Waltz','Christoph Waltz','1956-10-04','Vienna, Austria'),
(13,'Robert Pattinson','Robert Douglas Thomas Pattinson','1986-05-13','London, England'),
(14,'Jodie Foster','Alicia Christian Foster','1962-11-19','Los Angeles, California, U.S.'),
(15,'Reese Witherspoon','Laura Jeanne Reese Witherspoon','1976-03-22','New Orleans, Louisiana, U.S.'),
(16,'Dolph Lundgren','Hans Lundgren','1957-11-03','Spanga, Sweden'),
(17,'Jamie Foxx','Eric Marlon Bishop','1967-12-13','Terrell, Texas, U.S.'),
(18,'Michael Fassbender','Michael Fassbender','1977-04-02','Heidelberg, Baden-Württemberg, West Germany'),
(19,'Daniel Craig','Daniel Wroughton Craig','1968-03-02','Chester, Cheshire, England'),
(20,'Judi Dench','Judith Olivia Dench','1934-12-09','Heworth, North Riding of Yorkshire, England'),
(21,'George Clooney','George Timothy Clooney','1961-05-06','Lexington, Kentucky, U.S.'),
(22,'Arnold Schwarzenegger','Arnold Alois Schwarzenegger','1947-07-30','Thal, Styria, Austria');

insert into rol values
(1,1,3,'Rose DeWitt Bukater'),
(2,1,4,'April Wheeler'),
(3,1,10,'Nancy Cowan'),
(4,2,3,'Jack Dawson'),
(5,2,4,'Frank Wheeler'),
(6,2,17,'"Monsieur" Calvin J. Candie'),
(7,3,1,'Mia Wallace'),
(8,3,9,'Madeleine Forestier'),
(9,4,3,'Cal Hockley'),
(10,4,5,'Forte Grimaldi'),
(11,5,1,'Vincent Vega'),
(12,6,1,'Jules Winnfield'),
(13,6,17,'Stephen'),
(14,7,1,'Butch Coolidge'),
(15,7,12,'Mr. Church'),
(16,7,13,'Mr. Church'),
(17,8,6,'Bullet Tooth Tony'),
(18,8,5,'Campbell'),
(19,9,6,'Mickey O\'Neil'),
(20,9,2,'Aldo "The Apache" Raine'),
(21,10,12,'Lee Christmas'),
(22,10,13,'Lee Christmas'),
(23,10,14,'Lee Christmas'),
(24,10,6,'Turkish'),
(25,11,8,'Paul Safranek'),
(26,12,2,'Col. Hans Landa '),
(27,12,11,'August Rosenbluth'),
(28,12,10,'Alan Cowan'),
(29,12,17,'Dr. King Schultz'),
(30,12,16,'Ernst Stavro Blofeld'),
(31,12,8,'Dusan Mirkovic'),
(32,13,9,'Georges Duroy'),
(33,13,11,'Jacob Jankowski'),
(34,14,10,'Penelope Longstreet'),
(35,15,11,'Marlena Rosenbluth'),
(36,16,12,'Gunner Jensen'),
(37,16,13,'Gunner Jensen'),
(38,16,14,'Gunner Jensen'),
(39,16,5,'Axel "The Swede"'),
(40,17,17,'Django Freeman'),
(41,18,2,'Archie Hicox'),
(42,19,15,'James Bond'),
(43,19,16,'James Bond'),
(44,20,16,'Mallory\'s predecessor M'),
(45,21,7,'Matthew "Matt" King'),
(46,22,12,'Trench Mauser'),
(47,22,13,'Trench Mauser');

-- mi-am dat seama ca tipul ratingului e intreg si eu vreau cu zecimala
select * from rating; 

-- am schimbat tipul notei ratingului ca sa apara cu zecimala
alter table rating modify nota decimal(3,1);

-- am modificat continului coloanei nota ca sa apara cu zecimala
update rating set nota=8.9 where id_rating=1;
update rating set nota=8.3 where id_rating=2;
update rating set nota=7.8 where id_rating=3;
update rating set nota=7.3 where id_rating=4;
update rating set nota=4.6 where id_rating=5;
update rating set nota=8.3 where id_rating=6;
update rating set nota=7.3 where id_rating=7;
update rating set nota=5.7 where id_rating=8;
update rating set nota=5.4 where id_rating=9;
update rating set nota=7.2 where id_rating=10;
update rating set nota=6.9 where id_rating=11;
update rating set nota=6.5 where id_rating=12;
update rating set nota=6.6 where id_rating=13;
update rating set nota=6.1 where id_rating=14;
update rating set nota=7.8 where id_rating=15;
update rating set nota=6.8 where id_rating=16;
update rating set nota=8.4 where id_rating=17;

-- sau putem sa modificam si in alt fel
update rating r 
join (
	select 1 as id_rating, 8.9 as new_nota
    union all 
    select 2, 8.3
      union all 
    select 3, 7.8
      union all 
    select 4, 7.3
      union all 
    select 5, 4.6
      union all 
    select 6, 8.3
      union all 
    select 7, 7.3
      union all 
    select 8, 5.7
      union all 
    select 9, 5.4
      union all 
    select 10, 7.2
      union all 
    select 11, 6.9
      union all 
    select 12, 6.5
      union all 
    select 13, 6.6
      union all 
    select 13, 6.6
      union all 
    select 14, 6.1
      union all 
    select 15, 7.8
      union all 
    select 16, 6.8
      union all 
    select 17, 8.4
) vals on r.id_rating=vals.id_rating
set nota=new_nota;

-- am testat modificarea
select * from rating
where nota=7.8;

-- vreau sa vad filmele care au aparut dupa anul 2010 si care au fost adaptate dupa o carte
select * from film
where an>2010
and ecranizare_carte='DA';

-- vreau sa afisez toate filmele (si rolurile) in care a jucat Kate Winslet 
select nume_scena, nume_film, rol from film f
inner join rol r on r.id_film=f.id_film
inner join actor a on a.id_actor=r.id_actor
where nume_scena='Kate Winslet';

-- vreau sa afisez toate filmele (si rolurile si regizorii) in care a jucat Leonardo DiCaprio 
select nume_scena, nume_film, rol, nume_regizor from rol r
inner join actor a on r.id_actor=a.id_actor
inner join film f on r.id_film=f.id_film
inner join regizor reg on f.id_regizor=reg.id_regizor
where nume_scena like '%caprio%';

-- vreau sa afisez toate filmele (si rolurile si regizorii) in care a jucat Kate Winslet  si Leonardo DiCaprio
select nume_scena, nume_film, rol, nume_regizor from rol r
inner join actor a on r.id_actor=a.id_actor
inner join film f on r.id_film=f.id_film
inner join regizor reg on f.id_regizor=reg.id_regizor
where nume_scena='Kate Winslet'
union 
select nume_scena, nume_film, rol, nume_regizor from rol r
inner join actor a on r.id_actor=a.id_actor
inner join film f on r.id_film=f.id_film
inner join regizor reg on f.id_regizor=reg.id_regizor
where nume_scena='Leonardo DiCaprio';

-- vreau sa afisez toate filmele (si rolurile si regizorii) in care a jucat Kate Winslet care au ratingul mai mare ca 7;
select nume_scena, nume_film, rol, nume_regizor, nota from rol r
inner join actor a on r.id_actor=a.id_actor
inner join film f on r.id_film=f.id_film
inner join regizor reg on f.id_regizor=reg.id_regizor
inner join rating rat on rat.id_film=f.id_film
where nume_scena='Kate Winslet'
and nota>7;

-- vreau sa imi afiseze cel mai tanar actor care a jucat intr-un film care a luat un premiul
select nume_scena, year(curdate())-year(data_nastere) varsta_actor
	from film f
inner join premiu_film pf on pf.id_film=f.id_film
inner join premiu p on p.id_premiu=pf.id_premiu
inner join rol r on r.id_film=f.id_film
inner join actor a on a.id_actor=r.id_actor
group by nume_scena
order by varsta_actor asc
limit 1;



