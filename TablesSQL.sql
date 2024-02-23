--homework
use TSQL2012
	select * from [HR].[Employees]
	select * from [Production].[Categories]
	select * from [Production].[Products]
	select * from [Production].[Suppliers]
	select * from [Sales].[Orders]
	select * from [Sales].[Customers]
	select * from [Sales].[OrderDetails]
	select * from [Sales].[Shippers]
	select * from [Stats].[Scores]
	select * from [Stats].[Tests]
--1
select * from [Sales].[Orders]
select * from [Sales].[Customers]
select contactname,city,orderdate from [Sales].[Customers] cu
join [Sales].[Orders] ord on ord.custid=cu.custid
where city in ('London','Madrid')
--2
select * from [Production].[Categories]
select * from [Production].[Products]
select upper(productname),unitprice,categoryname from [Production].[Products] p
join [Production].[Categories] c on c.categoryid=p.categoryid
where unitprice between 20 and 40
--3
select * from [HR].[Employees]
select * from [Sales].[Orders]
select lastname,firstname,orderid from  [HR].[Employees] e
join [Sales].[Orders] o on o.empid=e.empid
where title = 'Sales manager' and freight>50
--4
select * from [Sales].[Customers]
select * from [Sales].[Orders]
select orderdate,contactname,city,address from [Sales].[Orders] o
join [Sales].[Customers] cu on cu.custid=o.custid
where YEAR(shippeddate)=2007 and shipcountry='USA'
--5
select * from [HR].[Employees]
select * from [Sales].[Orders]
select distinct shipcity from [Sales].[Orders] o
join [HR].[Employees] e on e.empid=o.empid
--6
select orderid,country,city from sales.Customers cu
join [Sales].[Orders] o on o.custid=cu.custid
where shipcountry in ('Germany','Austria')

--7
select * from [Production].[Suppliers] s
join [Production].[Products] p on p.supplierid=s.supplierid
where discontinued>0 and city='Tokyo'
--8
select productname from [Production].[Categories] ca
join [Production].Products p on p.categoryid=ca.categoryid
join [Production].[Suppliers] s on s.supplierid=p.supplierid
where country='Japan' and categoryname in ('Seafood','Beverages')
--9
select * from [HR].[Employees]
select * from [Sales].[Orders]
select * from [Sales].[Customers]
select firstname,lastname,companyname from [HR].[Employees] e
join [Sales].[Orders] o on o.empid=e.empid
join [Sales].[Customers] c on c.custid=o.custid
where lastname in ('Davis','Cameron') 
	and firstname in ('Sara','Maria')
	and YEAR(shippeddate)=2007
--10
select * from [Production].[Categories]
select productname,categoryname from [Production].[Products] p
	join  [Production].[Categories] c on c.categoryid=p.categoryid
	join [Production].[Suppliers] s on s.supplierid=p.supplierid
	where country in ('USA')
		and categoryname not in ('Seafood','Beverages')
--11
select * from [HR].[Employees]
select * from [Sales].[Orders]
select * from [Sales].[Customers]
select orderid,lastname,firstname,e.city,contactname from [HR].[Employees] e
	join  [Sales].[Orders] o on o.empid=e.empid
	join [Sales].[Customers] c on c.custid=o.custid
		where e.city=c.city
--12			
select * from [Production].[Categories]
select * from [Production].[Products]
select * from [Production].[Suppliers]
select distinct contactname from [Production].[Categories] c 
join [Production].[Products] p on p.categoryid=c.categoryid
join [Production].[Suppliers] s on s.supplierid=p.supplierid
	where categoryname in ('Dairy Products','Beverages')


--hardware
use Hardware
--1
select * from Manufacturers
select * from Products
select p.Name, price from Products p 
	where ManufacturerId in (
		select ManufacturerId from Manufacturers
			where Name='Hewlett-Packard'
			)
--2
select p.Name, Price from Products p 
	where ManufacturerId in (
		select ManufacturerId from Manufacturers
		where Name not in ('Fujitsu')
	)
--3
select p.Name,Price from Products p
 where ManufacturerId in (
	select ManufacturerId from Manufacturers
		where Name in ('Sony','Fujitsu','IBM','Intel')
		)

--4
select m.Name from Manufacturers m
	where ManufacturerId in (
		select ManufacturerId from Products
			where price>200)
--5
select p.Name,Price from Products p
 where ManufacturerId in (
	select ManufacturerId from Manufacturers
		where Name not in ('Genius','Dell')
		)
--6
select Count(p.Name) from Products p
 where ManufacturerId in (
	select ManufacturerId from Manufacturers
		where Name in ('drive')
		)
--7
select count(ProductId) from Products
	where ManufacturerId in (
		select ManufacturerId from Manufacturers 
			where Name='Intel'
			and price >= (select avg(price) from products 
								where ManufacturerId in 
									(select ManufacturerId from Manufacturers 
											where Name='Intel')))
--worldevents
use WorldEvents
select * from Event
select * from Continent
select * from Country
select * from Category
--1
select COUNT(EventName) from Event 
	where CountryID in (
		select CountryID from Country 
			where ContinentID in (
				select ContinentID from Continent
				where ContinentName='Europe'))
		
--2
select min(YEAR(EventDate)) from Event
	where CountryID in (
		select CountryID from Country 
		where ContinentID in (select ContinentID from Continent 
		where ContinentName='Africa'))
--3
select count(CountryName) from Country 
	where ContinentID in (
		select ContinentID from Continent 
			where ContinentName in ('North America','South America'))
--4
select count(EventName) from Event 
where ((MONTH(EventDate)=12 and DAY(EventDate)=31) or
		(MONTH(EventDate)=01 and DAY(EventDate)=01))
		and CategoryID	in (
		 select CategoryID from Category
		 where CategoryName='Economy')
--5
select max(year(EventDate)) from Event
	where CountryID in (
		select CountryID from Country
			where ContinentID in(
			select ContinentID from Continent
			where ContinentName='Europe'))
	and CategoryID in (
	select CategoryID from Category 
	where CategoryName='Sports')