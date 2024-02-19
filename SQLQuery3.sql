--students
select * from [Students]
--1
select * from [Students] where year(DoB)>1990
--2
select Firstname, Lastname, year(getdate())-year(DoB) as currentyear from [Students] where Country in ('Libya' ,'Georgia')
--3
INSERT INTO [Students] (Firstname,Email,Country)
VALUES 
('mariam','tsikhishvili@gmail.com','Georgia');
--4
select top 5 with ties Firstname,MiddleTest from Students order by MiddleTest
--5
delete Students output deleted.* where FinalTest=19
--6
update students
set FinalTest=0
where MiddleTest=1

--persons
select * from Persons
--1
select * from Persons where PrivateId like '163%'
--2
select * from Persons where Lastname=City
--3
select * from Persons where Country in ('Canada','Monaco')
--4
select Firstname,Lastname,PrivateId from Persons where Email IS NULL
--5
select * from Persons where Country in ('Spain','Turkey') and Salary between 1000 and 3000
--6
select WorkPlace from Persons where WorkPlace like '%LLC%' or WorkPlace like '%PC%' or WorkPlace like '%LLP%'
--7 
declare @dotCount INT;
select Email,iif(len(Email)-LEN(replace(Email,'.',''))>2,'more than 2 dots','less than 2 dots') as MAILINFO
from Persons
--8
select * from Persons where PINcode like '%51'
--9
select Country,AVG(Salary) as averageSalary, COUNT(*) from Persons group by Country 
