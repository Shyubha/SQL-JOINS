
create table paintings
(
paintingid int primary key,
name varchar(10),
artistId int,
price decimal
)
insert into paintings values(11,'miracle',1,300),
(12,'miracle',1,700),
(13,'miracle',2,2800),
(14,'miracle',2,2300),
(15,'miracle',3,250),
(16,'miracle',3,5000),
(17,'miracle',3,50),
(18,'miracle',4,1300);

update paintings set name='Barbie'  -----update 
where paintingid in(11);

update paintings set name='Sunshine' 
where paintingid in(12);

update paintings set name='Mountain'  
where paintingid in(13);

update paintings set name='cool'  
where paintingid in(14);

update paintings set name='Bright' 
where paintingid in(15);


update paintings set name='miracle'  
where paintingid in(16);


update paintings set name='Barbie'  -----update
where paintingid in(17);

create table artists
(
artistId int,
name varchar(20),
)

insert into artists values(1,'Rahul'),
(2,'Kishor'),
(3,'Amol'),
(4,'Prashant');

create table collectors
(
collectorid int,
name varchar(20),
)

insert into collectors values(101,'Pooja'),
(102,'Nikita'),
(103,'Sonali'),
(104,'Nikhil');

create table sales
(
id int,
saledate varchar(20),
paintingid int,
artistId int,
collectorid int,
salesprice decimal
)

insert into sales values(1001,'2022-4-17',13,2,104,2500),
(1002,'2022-3-16',14,2,102,2300),
(1003,'2022-5-13',11,1,102,300),
(1004,'2022-6-15',16,3,103,4000),
(1005,'2022-5-14',15,3,103,200),
(1005,'2022-4-21',17,3,103,50);

select *from paintings

select*from artists

select*from collectors

select*from sales

select * from paintings where price>= 
(select avg(price) as avgprice from paintings);


--Inner Join---
--*Get the data from sales & collectors table, name the collectors with their sales price 

select c.name,s.salesprice,s.saledate
from collectors c
inner join sales s ON s.collectorid=c.collectorid   

--Left Join--
--*1. to get all records from left table & matching records from right table

select s.id,c.name,s.salesprice from sales s
left join collectors c on c.collectorid=s.collectorid

--Right Join---
--*1.to get all records from right table & matching records from left table.

select s.id,c.name,s.salesprice from sales s
right join collectors c on c.collectorid=s.collectorid

--Full Join---
--*1.Return all records from both the tables, it is combination of left & right join

select c.name,s.salesprice,p.name
from collectors c
full join sales s ON s.collectorid=c.collectorid 
full join paintings p ON p.paintingid=s.paintingid 

--Ineer Join
--*1.Fetch the records group by collectors name with their total purchase & count

select c.name,sum(s.salesprice) as Amount, count(salesprice) as TotalCoount 
from collectors c 
inner join sales s on s.collectorid=c.collectorid
group by c.name

---Cross Join---

create table Students_ForCrossJoin
(
studId varchar(10) ,
course varchar(50) not null,
joinyear int not null
)

insert into Students_ForCrossJoin values('s1','.NET',2020),
                                        ('s3','JAVA',2021),
										('s2','CSS',2020),
										('s2','HTML',2021),
										('s1','Angular',2020),
										('s4','.NET',2021);

select*from Students_ForCrossJoin

--Find the student who join for different course with their year of join

select s1.studId,s1.joinyear
from Students_ForCrossJoin as s1, Students_ForCrossJoin as s2
where s1.studId=s2.studId AND s1.course <>s2.course
