/*
 
Part-1: Use ITI DB
1.Display instructor Name and Department Name
Note: display all the instructors if they are attached to a department or not*/
use ITI
select Ins_Name ,Dept_Name
from Instructor I left outer join department D
on D.Dept_Id = I.Dept_Id

 /*2. Display student full name and the name of the course he is taking
For only courses which have a grade*/
select St_Fname+' '+St_Lname [full name] ,Crs_Name
from student s, course c, stud_course sc
where s.St_Id=sc.St_Id and c.Crs_Id=sc.Crs_Id

/*3. Display number of courses for each topic name*/
select Top_Name , count(Crs_Name) as num_courses
from Topic T , Course C
where T.Top_Id=C.Top_Id
group by T.Top_Name
/*4. Display max and min salary for instructors*/
/////
select max(salary) as max_salary ,min(salary) as min_salary
from Instructor
/*5. Display instructors who have salaries less than the average salary of all
instructors.*/

//////
select Ins_Name
from Instructor
where salary < avg(salary)
/*6. Display the Department name that contains the instructor who receives the
minimum salary.*/
/////
select Dept_Name 
from Department D,Instructor I
where D.Dept_Id=I.Dept_Id and min(salary)



////////////////////////////////////////////////////////////////////////

use AdventureWorks2012
 /*1. Display the SalesOrderID, ShipDate of the SalesOrderHearder table (Sales
schema) to designate SalesOrders that occurred within the period
‘7/28/2008’ and ‘7/29/2014’ */
//////
select SalesOrderID ,ShipDate
from [Sales].[SalesOrderHeader]
where OrderDate between '7-28-2008' and   '7-2-2014'

/*2. Display only Products with a StandardCost below $110.00 (show ProductID,
Name only) */

select ProductID , Name   --,StandardCost
from [Production].[Product]
where StandardCost<110.00       /*where StandardCost<'$110.00'*/
/*3. Display ProductID, Name if its weight is unknown */

select ProductID , Name
from [Production].[Product]
where Weight is null

/*4. Display all Products with a Silver, Black, or Red Color */
select *
from [Production].[Product]
where Color IN('Silver', 'Black' ,'Red')
/* 5. Display any Product with a Name starting with the letter B*/
select *
from [Production].[Product]
where Name like 'B%'
/*6. Transfer the rowguid ,FirstName, SalesPerson from Customer table in a
newly created table named [customer_Archive] updated */
/*Note: Check your database to see the new table and how many rows in it?
-Try the previous query but without transferring the data*/
 ////// 

select c.PersonID ,P.FirstName,c.rowguid 
into[customer_Archive2]
from Sales.Customer C ,Person.Person P
where p.BusinessEntityID =c.PersonID

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

use Company_SD

/*1. Display the Department id, name and SSN and the name of its manager.*/
 select Dnum ,Dname,SSN ,Fname +' '+ Lname [fullname]
 from Employee ,Departments
 where SSN=MGRSSN
/* 2. Display the name of the departments and the name of the projects under
its control.*/
select Dname ,Pname
from Departments D ,Project P
where D.Dnum=P.Dnum
/*3. display all the employees in department 30 whose salary from 1000 to 2000
LE monthly. */
select *
from Employee  
where Dno=30 and Salary between 1000 and 2000


/*4. Retrieve the names of all employees in department 10 who works more
than or equal10 hours per week on &quot;AL Rabwah&quot; project.*/
\\

select Fname+' '+Lname [fullname]
from Employee E  ,Project J ,Works_for W 
where E.SSN=W.ESSn and J.Pnumber=W.Pno and E.Dno=10 and Hours>= 10 and Pname ='Al Rabwah'
/*5. Find the naanmes of the employees who directly supervised with Kamel
Mohamed. */

select y.Fname+' '+y.Lname [fullname]
from Employee y,Employee x
Where x.SSN=y.Superssn and x.Fname ='Kamel' and x.Lname='Mohamed'

/*6. Retrieve the names of all employees and the names of the projects they are
working on, sorted by the project name. */

select Fname+' '+Lname [fullname],Pname
from Employee ,Project ,Works_for
where SSN=ESSn and Pnumber=Pno
order by Pname


/*7. For each project located in Cairo City , find the project number, the
controlling department name ,the department manager last name ,address
and birthdate */

 select Pnumber ,Dname ,Lname ,Address,Bdate
 from Project P ,Departments D, Employee
 where SSN=MGRSSN and D.Dnum=P.Dnum and City='Cairo'

/*8. Display All Data of the mangers */

select *
from Employee E, Departments
where SSN=MGRSSN

/* 9. Display All Employees data and the data of their dependents even if they
have no dependents*/

select *
from Employee left outer join Dependent 
on SSN=ESSN 

/*10. For each department, retrieve the department name and the maximum,
minimum and average salary of its employees.*/
///
select d.Dname , max(salary) as max_salary ,min(salary) as min_salary,avg(salary) as avg_salary
from Departments d ,Employee
where Dno=Dnum
group by Dname
/*Bouns
Display results of the following two statements and explain what is the meaning
of @@AnyExpression
select @@VERSION
select @@SERVERNAME*/
select @@VERSION
/*Returns system and build information for the current installation of SQL Server.*/
select @@SERVERNAME
/*Returns the name of the local server that is running SQL Server*/