CREATE TABLE Worker (
	WORKER_ID INT  PRIMARY KEY identity(1,1),
	FIRST_NAME varchar(25),
	LAST_NAME varchar(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT varchar(25)
)
drop table worker
INSERT INTO Worker values( 'Monika', 'Arora', 100000, 14-02-20 , 'HR')
INSERT INTO Worker values( 'Niharika', 'Verma', 80000, 14-06-11 , 'Admin')
INSERT INTO Worker values( 'Vishal', 'Singhal', 300000, 14-02-20 , 'HR')
INSERT INTO Worker values( 'Amitabh', 'Singh', 500000, 14-02-20 , 'Admin')
INSERT INTO Worker values( 'Vivek', 'Bhati', 500000, 14-06-11 , 'Admin')
INSERT INTO Worker values( 'Vipul', 'Diwan', 200000, 14-06-11 , 'Account')
INSERT INTO Worker values( 'Satish', 'Kumar', 75000, 14-01-20 , 'Account')
INSERT INTO Worker values( 'Geetika', 'Chauhan', 90000, 14-04-11 , 'Admin')

select * from Worker

CREATE TABLE Bonus (
	WORKER_ID INT,
	Bonus_id int primary key identity(1,1),
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	constraint FK_WORKER_Bonus FOREIGN KEY(WORKER_ID) REFERENCES Worker(WORKER_ID)
)
INSERT INTO Bonus VALUES(1, 5000, 16-02-20)
INSERT INTO Bonus VALUES(2, 3000, 16-06-11)
INSERT INTO Bonus VALUES(3, 4000, 16-02-20)
INSERT INTO Bonus VALUES(1, 4500, 16-02-20)
INSERT INTO Bonus VALUEs(2, 3500, 16-06-11)

select * from Bonus
drop table bonus
CREATE TABLE Title (
	WORKER_ID INT,
	WORKER_TITLE varchar(25),
	AFFECTED_FROM DATETIME,
	constraint FK_WORKER_ID FOREIGN KEY (WORKER_ID) REFERENCES Worker(WORKER_ID)
)

INSERT INTO Title VALUES(1, 'Manager', 2016-02-20)
 INSERT INTO Title VALUES(2, 'Executive', 2016-06-11 )
 INSERT INTO Title VALUES(8, 'Executive', 2016-06-11)
 INSERT INTO Title VALUES(5, 'Manager', 2016-06-11)
 INSERT INTO Title VALUES(4, 'Asst. Manager', 2016-06-11)
 INSERT INTO Title VALUES(7, 'Executive', 2016-06-11)
 INSERT INTO Title VALUES(6, 'Lead', 2016-06-11)
 INSERT INTO Title VALUES(3, 'Lead', 2016-06-11)

 select * from title
 drop table title
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.

select first_name as worker_name from Worker

--Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.

select upper(first_name) from Worker

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.

select distinct(department) from Worker

--Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.

select SUBSTRING( first_name, 1, 3 ) FROM Worker

--Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.

Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh'


--Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.

Select RTRIM(FIRST_NAME) from Worker

--Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.

Select LTRIM(DEPARTMENT) from Worker

--Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.

SELECT DISTINCT department, LEN(department)  FROM Worker

--Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’

Select REPLACE(FIRST_NAME,'a','A') from Worker

--Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME. A space char should separate them.

Select CONCAT(FIRST_NAME, ' ', LAST_NAME) AS 'COMPLETE_NAME' from Worker

--Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

select * from worker  order by first_name asc

--Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from worker order by first_name asc ,department desc

--Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.

select * from worker where first_name in ('Vipul','Satish')

--Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.


select * from worker where first_name not in ('Vipul','Satish')

--Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

select * from worker where department='Admin'
--or
Select * from Worker where DEPARTMENT like 'Admin%'

--Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

select * from worker where first_name like '%a%'

--Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

select * from worker where first_name like '%a'

--Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

select * from worker where first_name like '_____h'

--Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

select * from worker where salary between 100000 and 500000

--Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.

Select * from Worker where year(JOINING_DATE) = 2014 and month(JOINING_DATE) = 2

--Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

select count(*) from worker where department='Admin'

--Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) As Worker_Name, Salary
FROM worker 
WHERE WORKER_ID IN 
(SELECT WORKER_ID FROM worker 
WHERE Salary BETWEEN 50000 AND 100000)

--Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.

SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers 
FROM worker 
GROUP BY DEPARTMENT 
ORDER BY No_Of_Workers DESC 

--Q-24. Write an SQL query to print details of the Workers who are also Managers.

SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE FROM 
Worker W
INNER JOIN 
Title T
ON W.WORKER_ID = T.WORKER_ID
AND T.WORKER_TITLE in ('Manager')

--or

select * from worker inner join title on worker.worker_Id = title.worker_id and worker_title='manager'

--Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1

--Q-26. Write an SQL query to show only odd rows from a table.

SELECT * FROM Worker WHERE WORKER_ID % 2 <> 0

--
--Q-27. Write an SQL query to show only even rows from a table.

select * from worker where worker_id % 2 =0

--Q-28. Write an SQL query to clone a new table from another table.

SELECT * INTO WorkerClone FROM Worker

--Q-29. Write an SQL query to fetch intersecting records of two tables.

select * from worker
intersect
select * from WorkerClone

--Q-30. Write an SQL query to show records from one table that another table does not have.

SELECT * FROM Worker 
minus
SELECT * FROM Title

--Q-31. Write an SQL query to show the current date and time.

select getdate()

--Q-32. Write an SQL query to show the top n (say 10) records of a table.

select top 5 * from worker 

--Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.

--not double 
select top 1 salary from (select distinct top 3 salary from worker order by salary desc) as wor order by salary asc

--double also count
SELECT TOP 1 Salary FROM (SELECT  TOP 5 Salary FROM Worker  ORDER BY Salary DESC) as wor ORDER BY Salary ASC

--Q-34. Write an SQL query to determine the 5th highest salary without using TOP or limit method.

SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 )

 --Q-35. Write an SQL query to fetch the list of employees with the same salary.

 Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID

--Q-36. Write an SQL query to show the second highest salary from a table.

SELECT TOP 1 Salary FROM (SELECT  TOP 2 Salary FROM Worker  ORDER BY Salary DESC) as wor ORDER BY Salary ASC

--Q-37. Write an SQL query to show one row twice in results from a table.

select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR' 
union all 
select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR'

--Q-38. Write an SQL query to fetch intersecting records of two tables.

(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM WorkerClone)

--Q-39. Write an SQL query to fetch the first 50% records from a table.

SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker)

--Q-40. Write an SQL query to fetch the departments that have less than five people in it.

SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5

--Q-41. Write an SQL query to show all departments along with the number of people in there.

SELECT DEPARTMENT, COUNT(DEPARTMENT) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT

--Q-42. Write an SQL query to show the last record from a table.

Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker)

--or
select * from worker where worker_id=1

--Q-43. Write an SQL query to fetch the first row of a table.

Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker)

--or
select * from worker where worker_id=1

--Q-44. Write an SQL query to fetch the last five records from a table.



--Q-45. Write an SQL query to print the name of employees having the highest salary in each department.

SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary

 --Q-46. Write an SQL query to fetch three max salaries from a table.

 SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc

 --Q-47. Write an SQL query to fetch three min salaries from a table.

 SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc

-- Q-48. Write an SQL query to fetch nth max salaries from a table.

SELECT distinct Salary from worker a WHERE n >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc

 --Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.

  SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT

--Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.

SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker)






