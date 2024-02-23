Use WorldEvents

--classwork
--1
select CountryName,ContinentName from [dbo].[Country] e
join Continent c on e.ContinentID=c.ContinentID
where ContinentName in ('Europe','North America')
--2
select * from Event
select * from Category
select CategoryName,EventName from [dbo].[Category] ca
join Event e on e.CategoryID=ca.CategoryID
where YEAR(EventDate) between 1980 and 1990
	and CategoryName in ('Transport','Economy') 
order by EventDate
--3
select * from Event
select * from Country
select CountryName,EventDetails from [dbo].Country co
join Event e on e.CountryID=co.CountryID
where YEAR(EventDate) between 1801 and 1900
--4
select * from Country
select * from Event
select * from Category
select distinct CountryName from [dbo].[Event] e
join Category ca on ca.CategoryID=e.CategoryID
join Country c on c.CountryID=e.CountryID
--5

select EventName,CountryName,ContinentName from [dbo].[Event] e
join Country co on co.CountryID=e.CountryID
join Continent c on c.ContinentID=co.ContinentID
where EventID in (1,9)

--subquery
--1
use WorldEvents
select * from Continent
select * from Country
select CountryName from Country
where ContinentID  in (
	select ContinentID from Continent where ContinentName='Europe' 
)
--2

select EventName, EventDate from Event
where CountryID in(
	select CountryID from Country
	where CountryName in ('Germany','Austria')
)
--3

select EventName,EventDate from Event
	where CategoryID in (
		select CategoryID from Category
		where CategoryName  not in ('Politics','Sports','Transport')
)
--3
select * from Continent
select * from Country
select CountryName from Country
where CountryName like 'S%'
and ContinentID not in (
	select ContinentID from Continent 
	where ContinentName in ('Asia','Africa')
)
--5
select * from Country
select * from Event
select * from Category
select * from Continent
select EventName from event
	where CountryID in (
		select CountryID from Country 
		where CountryName in ('United States','Canada') )
	and CategoryID in (
		select CategoryID from Category
		where CategoryName in ('Economy','Religion')
	)
