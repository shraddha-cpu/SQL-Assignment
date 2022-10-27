
create table customers(cId int identity(1,1) primary key,cname varchar(20),country varchar(30),city varchar(20),postalcode int)
select * from customers  
insert customers values('alexa','UK','London',121100)
insert customers values('maria','Maxico','D.F',123100)
insert customers values('birla','CK','London',121100)
insert customers values('ana','Germany','Berlin',121110)
insert customers values('farah','Norway','Lulea',121107)
insert customers values('thomas','Sweden','London',141100)
----------------------------------------------------------------------------------------------------------------------------------------
create table product(pId int identity(1,1) primary key,pname varchar(20),price int)
select * from product
insert product values('tv',20)
insert product values('Geitost',11)
insert product values('Pavlova',28)
insert product values('Tab',9)
insert product values('PC',40)

--------------------------------------------------------------------
---------ASSIGNMENT-------
----------------------------------------------------------------------------------------------------------------------------------


--1.Write a statement that will select the City column from the Customers table.

select city from customers

--2.Select all the different values from the Country column in the Customers table

select distinct country from customers

--3.Select all records where the City column has the value "London".

select * from customers where city='London'

--4.Use the NOT keyword to select all records where City is NOT "Berlin".

select * from customers where not city='Berlin'

--5.Select all records where the CustomerID column has the value 23.

select * from customers where cId=23

--6.Select all records where the City column has the value 'Berlin' and the PostalCode column has the value 121110

select * from customers where city='Berlin' and postalcode=121110

--7.Select all records where the City column has the value 'Berlin' or 'London'.

select * from customers where city='Berlin' or city='London'

--8.Select all records from the Customers table, sort the result alphabetically by the column City.

select * from customers order by city

--9.Select all records from the Customers table, sort the result reversed alphabetically by the column City.

select * from customers order by city desc

--10.Select all records from the Customers table, sort the result alphabetically, first by the column Country, then, by the column City.

select * from customers order by country,city

--11.Select all records from the Customers where the PostalCode column is empty.

select * from customers where postalcode is null

--12.Select all records from the Customers where the PostalCode column is NOT empty.

select * from customers where postalcode is not null

--13.Set the value of the City columns to 'Oslo', but only the ones where the Country column has the value "Norway".

update customers set city='oslo' where country='Norway'

--14.Delete all the records from the Customers table where the Country value is 'Norway'.

delete from customers where country='Norway'

--15.Use the MIN function to select the records with the smallest value of the Price column.

select min(price) from product

--16.Use an SQL function to select the record with the highest value of the Price column.

select max(price) from product

--17.Use the correct function to return the number of records that have the Price value set to 18.

select  count(*) from product where price=18

--18.Use an SQL function to calculate the average price of all products.

select avg(price) from product

--19.Use an SQL function to calculate the sum of all the Price column values in the Products table.

select sum(price) from product

--20.Select all records where the value of the City column starts with the letter "a".

select * from customers where city like 'a%'

--21.Select all records where the value of the City column ends with the letter "a".

select * from customers where city like '%a'

--22.Select all records where the value of the City column contains the letter "a".

select * from customers where city like '%a%'

--23.Select all records where the value of the City column starts with letter "a" and ends with the letter "b".

select * from customers where city like 'a%b'

--24.Select all records where the value of the City column does NOT start with the letter "a".

select * from customers where city not like 'a%'

--25.Select all records where the second letter of the City is an "a".

select * from customers where city like '_a%'

--26.Select all records where the first letter of the City is an "a" or a "c" or an "s".

select * from customers where city like '[acs]%'

--27.Select all records where the first letter of the City starts with anything from an "a" to an "f".

select * from customers where city like '[a-f]%'

--28.Select all records where the first letter of the City is NOT an "a" or a "c" or an "f".

select * from customers where city not like '[acf]%'

--29.Use the IN operator to select all the records where Country is either "Norway" or "France".

select * from customers where country  in ('Norway','France')

--30.Use the IN operator to select all the records where Country is NOT "Norway" and NOT "France".

select * from customers where country not in ('Norway','France')

--31.Use the BETWEEN operator to select all the records where the value of the Price column is between 10 and 20.

select * from product where price between 10 and 20

--32.Use the BETWEEN operator to select all the records where the value of the Price column is NOT between 10 and 20.

select * from product where price not between 10 and 20

--33.Use the BETWEEN operator to select all the records where the value of the ProductName column is alphabetically between 'Geitost' and 'Pavlova'.

select * from product where pname between 'Geitost' and 'Pavlova'

--34.When displaying the Customers table, make an ALIAS of the PostalCode column, the column should be called Pno instead.

select cname,postalcode as pno from customers

--35.When displaying the Customers table, refer to the table as Consumers instead of Customers.

select * from customers as consumers

--36.List the number of customers in each country.

select count(cId),country from customers 
group by country

--37.List the number of customers in each country, ordered by the country with the most customers first.

select count(cId),country from customers
group by country
order by count(cId) desc

--38.Write the correct SQL statement to create a new database called testDB.

create database testDB

--39.Write the correct SQL statement to delete a database named testDB.

drop database testDB

--40.Add a column of type DATE called Birthday in person table.

alter table person add Birthday  DATE 

--41.Delete the column Birthday from the Persons table.

alter table person drop column Birthday

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------

-------********-------------Assignment----------------*********-------

--1.Write a query to display first_name and last_name using alias ‘First Name’ & ‘Last Name’ from employee table

select * from Employee where name='First Name' and  email='Last Name' 

----------------------------------------------------------------------------------------------------------------------------
--2.Write a query to get unique department ID from employee table

select count(distinct DeptId) from Employee
----------------------------------------------------------------------------------------------------------------------------------
--3.Write a query to get all employee details from employee table display in descending order

 select * from Employee  order by  Name Desc

 ----------------------------------------------------------------------------------------------------------------------
--4.Write a query to display employee details with salary, calculate the PF as 12 % of basic salary & display as separate column
 
select Id , Name,Email,Salary,city,DeptId,Salary*.12 PF from Employee 
------------------------------------------------------------------------------------------------------------------------------
--5.Write a query to get total salaries payable to all employees from employee table

select sum(salary) from Employee
---------------------------------------------------------------------------------------------------------------
--6.Write a query to get max and min salary of employee

select max(Salary) as maxsalary ,  min(Salary) as minsalary from Employee
---------------------------------------------------------------------------------------------------------------------
--7.Write a query to get number of employees are working in company

select count(*) from Employee
----------------------------------------------------------------------------------------------------------------------
--8.Write a query to get the number of unique designation in the company

select count(distinct Id)  from Employee
----------------------------------------------------------------------------------------------------------------------
--9.Write a query to display emp_name as ‘Name1’ in upper case

select  upper(name) as name1 from Employee
----------------------------------------------------------------------------------------------------------------------
--10.Write a query to get first 10 records from the employee table

select top 5 * from Employee 
----------------------------------------------------------------------------------------------------

--add city col in emp table, update the city as well
alter table Employee add city varchar(20)

update Employee set city ='mumbai' where Id=1
update Employee set city ='pune' where Id=2
update Employee set city ='satara' where Id=3
update Employee set city ='pune' where Id=4
update Employee set city ='kolhapur' where Id=5
update Employee set city ='nashik' where Id=6

--select emp who work in dev dept & salary is grater than 25000 
 select * from Employee  where DeptName='Devlopment' and Salary >= 25000

 -------------------------------------------------------------------------------------------------------------------------------------

 --select emp who work in hr dept & city is mumbai/satara
 select * from Employee where DeptName='HR' and city ='satara'
----------------------------------------------------------------------------------------------------------------------------------------

 -- select emp who work in Testing dept & name start with a
select * from Employee where DeptName='Testing' and  Name like  'a%'

--------------------------------------------------------------------------------------------------------------------------------

-- select emp order by asc by their name
select * from Employee order by Name

---------------------------------------------------------------------------------------------------------------------------------

-- select emp from dev dept & order by name desc
select * from Employee where DeptName='Devlopment' order by Name Desc

-----------------------------------------------------------------------------------------------------------------------------------------------


















