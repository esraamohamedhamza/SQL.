/*1) Restore Company DB then
Try to create the following Queries:
1. Display all the employees Data.*/
use Company_SD
select * from Employee
/*2. Display the employee First name, last name, Salary and Department number.
*/
select Fname,Lname ,Salary ,Dno from Employee

/*3. Display all the projects names, locations and the department which is responsible
about it.*/
select Pname ,Plocation, Dnum from Project

/*4. If you know that the company policy is to pay an annual commission for each
employee with specific percent equals 10% of his/her annual salary .Display each
employee full name and his annual commission in an ANNUAL COMM column
(alias).*/
select Fname+''+Lname as fullname ,(salary*12)*10/100 as alias from Employee



/*5. Display the employees Id, name who earns more than 1000 LE monthly.*/
select SSN ,Fname+''+Lname as fullname from Employee where Salary>1000

/*6. Display the employees Id, name who earns more than 10000 LE annually.*/
select SSN ,Fname+''+Lname as fullname from Employee where (Salary*12)>10000

/*7. Display the names and salaries of the female employees*/
select Fname+''+Lname as fullname ,Salary from Employee where Sex='f'

/*8. Display each department id, name which managed by a manager with id equals
968574.*/
-----if need name of emp
select Dname ,Dnum ,Fname+''+Lname as fullname from Departments ,Employee where SSN=MGRSSN and MGRSSN=968574
----
select Dname ,Dnum from Departments where MGRSSN=968574
/*9. Dispaly the ids, names and locations of the pojects which controled with department
10.*/

select Pname ,Plocation,Pnumber from Project where Dnum=10

/*10. For each department, retrieve the department name and the maximum, minimum and
average salary of its employees.*/
//
select max(Salary) as max_salary ,min(Salary) as min_salary ,avg(Salary) as avg_salary ,Dname
from Departments, Employee
where  Dnum=Dno
group by Dname

/*DML
Data Manipulating Language:
1. Insert your personal data to the employee table as a new employee in department number
30, SSN = 102672, Superssn = 112233, salary=3000.*/

insert into Employee(Dno,SSN ,Superssn ,Salary)
values (30, 102672 ,112233 ,3000)
select* from Employee where SSN=102672
/*2. Insert another employee with personal data your friend as new employee in department
number 30, SSN = 102660, but don’t enter any value for salary or manager number to
him.*/
insert into Employee(Dno,SSN,Fname,Lname)
values(30,102660,'esraa','mohamed')
/*3. Upgrade your salary by 20 % of its last value.*/
update Employee set Salary=Salary+Salary*20/100 