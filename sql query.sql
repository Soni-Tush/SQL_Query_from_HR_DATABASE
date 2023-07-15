/*SQL Script to Seed Sample Data. */
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT(15),
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT(10),
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(001, 5000, '16-02-20'),
		(002, 3000, '16-06-11'),
		(003, 4000, '16-02-20'),
		(001, 4500, '16-02-20'),
		(002, 3500, '16-06-11');
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2016-02-20 00:00:00'),
 (002, 'Executive', '2016-06-11 00:00:00'),
 (008, 'Executive', '2016-06-11 00:00:00'),
 (005, 'Manager', '2016-06-11 00:00:00'),
 (004, 'Asst. Manager', '2016-06-11 00:00:00'),
 (007, 'Executive', '2016-06-11 00:00:00'),
 (006, 'Lead', '2016-06-11 00:00:00'),
 (003, 'Lead', '2016-06-11 00:00:00');
  select * from worker;
 /*Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>. */
select FIRST_NAME from worker;
 /*Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case. */
select upper(FIRST_NAME) from worker;
 /* Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.*/
 select distinct(DEPARTMENT) from worker;
 /*Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table. */
 select left(FIRST_NAME,3) from worker;
select substring(FIRST_NAME,1,3) from worker;
/*  Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.*/
Select INSTR(FIRST_NAME, BINARY'a') from Worker where FIRST_NAME = 'Amitabh';
/*Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side. */
select rtrim(FIRST_NAME) from worker;
/*  Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.*/
select ltrim(FIRST_NAME) from worker;
/*Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length. */
select distinct(length(DEPARTMENT)) from worker;
/* Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.*/
select replace(FIRST_NAME,'a','A') from worker;
/* Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.*/
select concat_ws(' ',FIRST_NAME,LAST_NAME) as COMPLETE_NAME from worker;
/* Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.*/
select * from worker
order by FIRST_NAME asc, DEPARTMENT desc; 
/* Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.*/
select * from worker where FIRST_NAME = "Vipul" or First_NAME = "SATISH";
/* Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.*/
select * from worker where FIRST_NAME in ("Vipul", "SATISH");
/*  Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.*/
select * from worker where DEPARTMENT = "Admin";
/* Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.*/
Select * from Worker where INSTR(FIRST_NAME, BINARY'a') ;
/*  Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.*/
Select * from Worker where FIRST_NAME like '%a%';
/* Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.*/
Select * from Worker where FIRST_NAME like '%a';
/* Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets. */
Select * from Worker where FIRST_NAME like '_____h';
/*Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000. */
select * from worker where SALARY between 100000 and 500000;
/* Write an SQL query to print details of the Workers who joined in Feb’2014.*/
select * from worker where year(JOINING_DATE)= 2014 and month(JOINING_DATE) = 2;
/*Write an SQL query to fetch the count of employees working in the department ‘Admin’. */
select count(WORKER_ID) from worker where DEPARTMENT = "Admin";
/* Write an SQL query to fetch the no. of workers for each department in descending order.*/
SELECT DEPARTMENT,count(WORKER_ID) as No_of_workerse from worker group by DEPARTMENT order by count(WORKER_ID);
SELECT * from Title;
Select * from worker;
/* Write an SQL query to print details of the Workers who are also Managers.*/
Select * from worker join Title
ON WORKER_ID = WORKER_REF_ID
where WORKER_TITLE = "Manager";
/* Write an SQL query to fetch duplicate records having matching data in some fields of a table.*/
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*)
FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;
/*Write an SQL query to show only odd rows from a table. */
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) <> 0;
/*Write an SQL query to show only even rows from a table. */
SELECT * FROM Worker WHERE MOD (WORKER_ID, 2) = 0;
/* Write an SQL query to clone a new table from another table.*/
CREATE TABLE IF NOT EXISTS WORKER_1 
SELECT * FROM worker;
/* Write an SQL query to fetch intersecting records of two tables.*/
(SELECT * FROM worker)
INTERSECT
(SELECT * FROM WORKER_1);
/*Write an SQL query to show records from one table that another table does not have.*/
SELECT WORKER_ID,FIRST_NAME,LAST_NAME,SALARY,JOINING_DATE,DEPARTMENT FROM worker
LEFT OUTER JOIN Title
ON WORKER_ID=WORKER_REF_ID
Where WORKER_REF_ID;
/* Write an SQL query to show the current date and time.*/
Select curtime();
Select NOW();
SELECT getdate();
/* Write an SQL query to show the top n (say 10) records of a table.*/
SELECT * FROM worker ORDER BY SALARY DESC Limit 10;
/* Write an SQL query to determine the nth (say n=5) highest salary from a table.*/
SELECT * FROM Worker ORDER BY Salary DESC LIMIT 4,1;
/*Write an SQL query to determine the 5th highest salary without using the TOP or limit method. */
SELECT Salary
FROM Worker W1
WHERE 4 = (
 SELECT COUNT( DISTINCT ( W2.Salary ) )
 FROM Worker W2
 WHERE W2.Salary >= W1.Salary
 );
/* Write an SQL query to fetch the list of employees with the same salary.*/
Select distinct W.WORKER_ID, W.FIRST_NAME, W.Salary 
from Worker W, Worker W1 
where W.Salary = W1.Salary 
and W.WORKER_ID != W1.WORKER_ID;
/*Write an SQL query to show the second-highest salary from a table. */
SELECT * from Worker W1
where 2=(
select count(distinct (W2.salary))
from Worker W2
where W2.Salary >=W1.Salary
);
/*Write an SQL query to show one row twice in the results from a table. */
Select max(Salary) from Worker 
where Salary not in (Select max(Salary) from Worker);
/* */
select FIRST_NAME, DEPARTMENT from worker W where W.DEPARTMENT='HR'
union all 

select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';
/*Write an SQL query to fetch intersecting records of two tables. */
(SELECT * FROM Worker)
INTERSECT
(SELECT * FROM Worker_1);
/* Write an SQL query to fetch the first 50% of records from a table.*/
SELECT * from worker WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);
/*Write an SQL query to fetch the departments that have less than five people in them. */
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;
/*Write an SQL query to show all departments along with the number of people in there. */
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT;
/*Write an SQL query to show the last record from a table. */
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);
/* Write an SQL query to fetch the first row of a table.*/
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker);
/*Write an SQL query to fetch the last five records from a table. */
SELECT * FROM Worker WHERE WORKER_ID <=5
UNION
SELECT * FROM (SELECT * FROM Worker W order by W.WORKER_ID DESC) AS W1 WHERE W1.WORKER_ID <=5;
/*Write an SQL query to print the name of employees having the highest salary in each department. */
SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary from(SELECT max(Salary) as TotalSalary,DEPARTMENT from Worker group by DEPARTMENT) as TempNew 
Inner Join Worker t on TempNew.DEPARTMENT=t.DEPARTMENT 
and TempNew.TotalSalary=t.Salary;
/*Write an SQL query to fetch three max salaries from a table. */
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
/*Write an SQL query to fetch three min salaries from a table. */
SELECT distinct Salary from worker a WHERE 3 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary >= b.Salary) order by a.Salary desc;
/*Write an SQL query to fetch nth max salaries from a table. */
SELECT distinct Salary from worker a WHERE 5 >= (SELECT count(distinct Salary) from worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;
/*Write an SQL query to fetch departments along with the total salaries paid for each of them. */
SELECT DEPARTMENT, sum(Salary) from worker group by DEPARTMENT;
/* Write an SQL query to fetch the names of workers who earn the highest salary.*/
SELECT FIRST_NAME, SALARY from Worker WHERE SALARY=(SELECT max(SALARY) from Worker);
 