VASIREDDY VENKATADRI INSTITUTE OF TECHNOLOGY 
Department of CSE
DataBase Management Systems
Lab Cycle – I 
Create the following tables along with their tuples: 
Table Name: Programmer 
Column Name Null? Data Type Description 
PNAME Not Null Varchar2(20) Name of Programmer
DOB Not Null Date Date of Birth
DOJ Not Null Date Date of Joining
GENDER Not Null Char(1) Male/ Female
PROF1 Varchar2(10) Known Language 1
PROF2 Varchar2(10) Known Language 2
SALARY Not Null Number(7,2) Salary
Data in table Programmer 
PNAME DOB DOJ GENDER PROF1 PROF2 SALARY
Anand 21-apr-66 21-apr-92 M Pascal Basic 3200
Altaf 02-jul-64 13-nov-90 M Fortran Cobol 2800
Juliana 31-jan-68 21-apr-90 F Cobol Dbase 3000
Tulasi 30-oct-68 02-jan-92 F C Dbase 2900
Mary 24-jun-70 01-feb-91 F C++ Oracle 4500
Nelson 14-sep-65 11-oct-89 M Cobol Dbase 2500
Patrick 11-nov-65 21-apr-90 M Pascal Fortran 2800
Qadir 30-aug-65 21-apr-91 M Assembly C 3000
Ramesh 08-may-67 28-feb-91 M Pascal Dbase 3200
Rebacca 04-jan-67 01-dec-90 F Basic Cobol 2500
Remitha 19-apr-70 20-apr-93 F C Assembly 3600
Revathi 02-dec-69 02-jan-92 F Pascal Basic 3700
Vijaya 11-dec-65 02-may-92 F Foxpro C 3500
Table Name: Studies 
Column Name Null? Data Type Description 
PNAME Not Null Varchar2(20) Name of Programmer
SPLACE Not Null Varchar2(20) Place of Study
COURSE Not Null Varchar2(20) Course Name
COST Number(5) Course Cost
Data in table Studies 
PNAME SPLACE COURSE COST
Anand Sabhari PGDCA 4500
Altaf CBIT DCA 7200
Juliana BITS MCA 22000
Tulasi Pragathi DCP 5000
Mary Sabhari PGDCA 4500
Nelson Pragathi DAP 6200
Patrick Pragathi DCAP 5200
Qadir Apple HDCP 14000
Ramesh Sabhari PGDCA 4500
Rebacca Brilliant DCA&P 11000
Remitha BDPS DCS 5000
Revathi Sabhari DAP 5000
Vijaya BDPS DCA 48000
Table Name: Software 
Column Name Null? Data Type Description 
PNAME Not Null Varchar2(20) Name of Programmer
TITLE Not Null Varchar2(25) Title of Software Project
DEV_D Not Null Varchar2(10) Platform Used
SCOST Not Null Number(10,2) Per Product Selling Cost
DCOST Not Null Number(10,2) Development Cost
SOLD Number(4) Number of Products Sold
Data in table Software 
PNAME TITLE DEV_D SCOST DCOST SOLD
Anand Pharachutes Basic 399.95 6000 43
Anand Video Titling Pack Pascal 7500.00 16000 9
Juliana Inventory Control Cobol 3000 3500 0
Tulasi Payroll Package Dbase 9000 20000 7
Mary Financial Acc S/W Oracle 18000 85000 4
Mary Code Generation C 4500 20000 23
Patrick Read Me C++ 300 1200 84
Qadir Bombs Away Assembly 750 5000 11
Qadir Vaccines C 1900 3400 21
Ramesh Hotel Management Dbase 12000 35000 4
Ramesh Dead Lee Pascal 599.95 4500 73
Remitha PC Utilities C 725 5000 51
Remitha TSR Help Package Assembly 2500 6000 6
Revathi Hospital Management Pascal 1100 75000 2
Revathi Quiz Master Basic 3200 2100 15
Vijaya ISR Editor C 900 700 6
Execute the following queries: 
Part- I 
1. Find out the selling cost for the package(s) developed in Pascal 
select 
scost 
from software 
where dev_d = 'Pascal'; 
2. Display the names and ages of programmers 
select 
pname,(sysdate-dob)/365 age 
From programmer 
3. Display the names of programmers who have done the DAP course 
SELECT 
PNAME 
FROM studies 
where COURSE='DAP'; 
4. What is the highest number of copies sold by a package 
Query a: select 
max(sold) 
from software 
Query b: select 
title 
from software 
where sold=(Query a) 
Query c: substitute query a into query b 
select 
title 
from software 
where sold=(select m ax(sold) from software) 
5. Display the names and date of birth of all programmers born in January 
select 
pname,dob 
from Programmer 
where dob like '%JAN%' 
(or) 
select 
pname,dob 
from Programmer 
where substr(dob,4,3)=’JAN’ 
(or) 
SELECT dob,pname FROM programmer WHERE MONTH(dob) = '01' 
6. Display the lowest course fee 
Query a: SELECT MIN(COST) FROM Studies 
Query b: select course from Studies where cost=(query a) 
Query c: substitute query a in query b 
select course from Studies where cost=(select min(cost) from Studies) 
7. How many programmers have done the PGDCA course 
select 
count (*) 
FROM Studies 
where COURSE='PGDCA' 
8. How much revenue has been earned through the sale of packages developed in C 
SELECT 
SUM(scost*sold) 
FROM software 
WHERE dev_d='C' 
9. Display the details of software developed by Ramesh 
select 
* 
from Software 
where pname='Ramesh' 
10. How many programmers have studied at Sabhari 
select 
count(*) 
from Studies 
where splace='Sabhari' 
11. Display the details of packages whose sales have been crossed 2000 mark 
select 
* 
from software 
where (sold*scost)>2000 
12. Find out the number of copies, which should be sold in-order to recover the development 
cost of each package 
SELECT 
title,ROUND(dcost/scost) AS copies 
FROM software 
13. Display the details of the packages for which development cost have been recovered 
SELECT 
* 
FROM SOFTWARE 
WHERE DCOST<=SCOST*SOLD 
14. What is the price of the costlier software developed in Basic 
Query a: select 
Max(scost) 
 From software 
 Where dev_d=’Basic’ 
Query b: select 
title 
 From software 
 When dev_d=’Basic’ and scost=(query a) 
Query c: substitute query a in query b 
select 
title 
from Software 
where dev_d='Basic' and scost in (select 
max(scost) 
from Software 
where dev_d='Basic') 
15. How many packages were developed in dbase 
select 
count(*) 
from Software 
where dev_d='Dbase' 
16. How many programmers studied in Pragathi 
select 
count(*) "programmers studied in praghati" 
From studies 
where splace=’Pragathi’ 
17. How many programmers paid 5000-10000 for their course 
select count(*) from Studies where cost between 5000 and 10000 
(or) 
select count(*) from Studies where cost>=5000 and cost<=10000 
18. What is the average course fee 
select 
avg(cost) 
From studies 
19. Display the details of programmers knowing C 
select * from Programmer where PROF1='C' or PROF2='C' 
20. How many programmers know either Cobol or Pascal 
select 
count(*) 
from Programmer 
where prof1 in ('Cobol', 'Pascal') or prof2 in ('Cobol', 'Pascal') 
where prof1=‘Cobol’ or prof1=’Pascal’ or prof2=’Cobol’ or prof2=’Pascal’ 
21. How many programmers don’t know Pascal and C 
select 
count(*) 
from Programmer 
where prof1 not in ('C', 'Pascal') and prof2 not in ('C', 'Pascal') 
22. How old is the oldest male programmer 
select 
max(floor((sysdate-dob)/365)) "age of oldest male programmer" 
from Programmer 
where gender='M' 
23. What is the average age of female programmers 
select 
avg(floor((sysdate-dob)/365)) 
from Programmer 
where gender = 'F' 
24. Calculate the experience in years for each programmer and display along with their 
names in descending order 
select 
pname, floor((sysdate-doj)/365) as experience 
from Programmer 
order by experience desc 
25. Who are the programmers who celebrate their birthdays in the current month 
Query a: Select 
Substr(sysdate,4,3) from dual 
Query b: select 
pname 
 From programmer 
 Where substr(dob,4,3)=(query a) 
Query c: substitute query a in query b 
select pname from Programmer where substr(dob,4,3)=(select substr(sysdate,4,3) from dual) 
Mysql: 
select pname from programmer where month(dob) = month(curdate()) 
26. What are the languages known by male programmers 
select distinct(prof1) from Programmer where gender='M' union select 
distinct(prof2) from Programmer where gender='M' 
27. What is the average salary of programmers 
select 
avg(salary) "average salary" 
from Programmer 
28. How many male programmers are there 
select count(*) from Programmer where gender='M' 
29. How many people draw 2000-4000 
select count(*) from programmer where salary between 2000 and 4000 
select 
count(*) 
from Programmer 
where salary<=4000 and salary>=2000 
30. Display the details of programmers who don’t know Fortran, Cobol or Pascal 
select * from Programmer where prof1 not in ('cobol','pascal','fotron') and prof2 not in ('cobol','pascal','fotron') 
select 
 * 
from programmer 
where prof1!='Cobol' and prof1!='Fortran' and prof1!='Pascal' and prof2!='Cobol' and prof2!='Fortran' and 
prof2!='Pascal' 
31. In which month did most of the programmers join 
select substr(doj,4,3),count(*) from Programmer group by (substr(doj,4,3)) 
having count(*) in (select max(count(*)) from Programmer group by (substr(doj,4,3))) 
32. In which language are most of the programmers proficient 
Query a: merge the values under the columns prof1 and prof2 as one column 
 Select prof1 from programmer 
union 
select prof2 from programmer 
Query b: 
select Prof1, count(*) From (query a) 
 Group by prof1 
 
select Prof1, count(*) From (select prof1 from programmer 
 union all select prof2 from programmer) 
 Group by prof1 
Query c: find the max value in query b 
select max(count(*)) From (Select prof1 from programmer 
union all select prof2 from programmer) 
 Group by prof1 
Query d: query b having count(*) in query d 
select Prof1, count(*) From (Select prof1 from programmer 
union all select prof2 from programmer) 
 Group by prof1 
Having count(*) in (select max(count(*)) From (Select prof1 from programmer 
union all select prof2 from programmer) Group by prof1) 
33. Who are the female programmers earning more than the highest paid male programmer 
select pname from Programmer where gender='F' and salary>(select max(salary) from Programmer 
where gender='M') 
34. Which language have been stated as prof1 by most of the programmers 
Query a: number of programmers for each language in prof1 
 select Prof1, count(*) From programmer Group by prof1 
Query b: find the max value in query a 
 Select Max(count(*)) From programmer Group by prof1 
Query c: 
query a 
having count(*) in (query b) 
 select Prof1, count(*) From programmer 
 Group by prof1 Having count(*) in (Select Max(count(*)) From programmer 
 Group by prof1) 
35. Identify and include the keys (Primary Keys & Foreign Keys) in the tables 
Primary Keys: 
alter table Programmer add constraint p_pk primary key(pname) 
alter table Studies add constraint s_pk primary key(pname) 
alter table Software add constraint So_pk primary key(title)
Foreign Keys: 
alter table Software add constraint f1_k foreign key(pname) references Programmer 
alter table Software add constraint f1_k1 foreign key(pname) references Studies 
Part – II 
1. Display the number of packages developed in each language 
select dev_d,count(*) "packages developed" 
from Software 
group by dev_d 
2. Display the number of packages developed by each person 
select pname,count(*) from Software group by pname 
3. Display the number of male and female programmers 
select gender,count(*) from Programmer group by gender 
G COUNT(*) 
- ----------- 
M 7 
F 6 
G COUNT(*) G COUNT(*) 
- ----------- - ------------ 
M 7 F 6 
Select 
* 
from 
(Select gender, count(*) from programmer where gender=’M’), (Select gender, count(*) from 
programmer where gender=’F’) 
4. Display the costliest and highest selling package developed in each language 
Query a: find the cost of costliest package in each language 
 select Dev_d, max(scost) c From software group by dev_d 
Query b: find the title of project for each language in query a 
 select T1.dev_d,t1.scost,t1.title From software t1, (query a) t2 
 Where t1.dev_d=t2.dev_d and t1.scost=t2.c 
Query c: substitute query a in query b 
select T1.dev_d,t1.scost,t1.title From software t1, (select 
 Dev_d, max(scost) c From software 
 Group by dev_d) t2 
 Where t1.dev_d=t2.dev_d and t1.scost=t2.c 
Query a1: find the maximum sold value of project in each language 
select Dev_d, max(sold) c1 From software Group by dev_d 
Query b1:find the title of project for each language in query a1 
select T1.dev_d,t1.sold,t1.title From software t1, (query a1) t2 
 Where t1.dev_d=t2.dev_d and t1.sold=t2.c1 
Query c1: substitute query a1 in query b1 
select T1.dev_d,t1.sold,t1.title From software t1, (select 
 Dev_d, max(sold) c1 From software Group by dev_d) t2 
 Where t1.dev_d=t2.dev_d and t1.sold=t2.c1 
Query d: final statement 
 select t1.dev_d,t1.scost,t1.title,t2.sold,t2.title 
 From (query c) t1, (query c1) t2 where t1.dev_d=t2.dev_d 
5. Display the number of people born in each year 
select substr(dob,8,2),count(*) from programmer group by substr(dob,8,2) order by substr(dob,8,2) 
6. Display the number of people joined in each year 
select substr(doJ,8,2),count(*) from programmer group by substr(doJ,8,2) order by substr(doJ,8,2) 
7. Display the number of people born in each month 
select substr(dob,4,3) Month, count(*) from Programmer group by substr(dob,4,3) 
8. Display the number of people joined in each month 
select substr(doj,4,3) Month, count(*) from Programmer group by substr(doj,4,3) 
9. Display language wise count of prof1 
select prof1,count(*) from Programmer group by prof1 
10. Display language wise count of prof2 
select prof2,count(*) from Programmer group by prof2 
11. Display the number of people in each salary group 
select salary, count(*) from Programmer group by salary order by salary 
12. Display the number of people studied in each institute 
select splace, count(*) from studies group by splace 
13. Display the number of people studied in each course 
select course, count(*) from studies group by course 
14. Display the total development cost of packages developed in each language 
select dev_d, sum(dcost) from software group by dev_d 
15. Display the selling cost of packages developed in each language 
select dev_d, title, scost from software group by dev_d, scost 
16. Display the costs of packages developed by each programmer language wise 
select pname,dev_d, scost from Software group by pname, dev_d 
17. Display the number of packages sold by each programmer 
select pname,sum(sold) from Software group by pname 
18. Display the sales cost of the packages developed by each programmer 
select 
pname, dev_d, scost 
from Software 
order by pname 
19. Display the sales cost of the packages developed by each programmer language wise 
select 
pname, dev_d, scost 
from Software 
order by pname, dev_d 
20. Display the language name with average development cost, average selling cost and 
average price per copy 
select 
dev_d, avg(dcost), avg(scost) 
from software 
group by dev_d 
21. Display the programmers name, costliest package, cheapest package developed by him/ 
her 
Query a: select 
 Pname, max(scost) mx 
 From programmer 
 Group by pname 
Query b: select 
 T1.pname, t1.scost, t1.title 
 From programmer t1, (query a) t2 
 Where t1.pname=t2.pname and t1.scost=t2.mx 
Query c: substitute query a in query b 
select 
 T1.pname, t1.scost, t1.title 
 From programmer t1, (select 
 Pname, max(scost) mx 
 From programmer 
 Group by pname) t2 
 Where t1.pname=t2.pname and t1.scost=t2.mx 
 
select 
p1.pname,p2.title,p3.title 
from 
(select pname,max(scost) e,min(scost) e1 from Software group by pname) p1 , 
(selecttitle,scost,pname from Software) p2, 
(selecttitle,scost,pname from Software) p3 
where (p1.pname=p2.pname and p1.pname=p3.pname and p1.e=p2.scost and p1.e1=p3.scost) 
PNAME E E1 
Anand 7500 400 
TITLE SCOST PNAME TITLE SCOST PNAME 
T1 7500 Anand T1 7500 Anand 
T2 400 Anand T2 400 Anand 
Anand7500400 T1 7500 Anand T1 7500 Anand 
Anand7500400 T1 7500 Anand T2 400 Anand 
Anand7500 400 T2 400 Anand T1 7500 Anand 
Anand7500 400 T2 400 Anand T2 400 Anand 
select 
t1.pname, t1.title, t1.scost "costly", t2.title, t2.scost "cheap" 
from 
(selectt1.pname, t1.scost, t1.title from software t1, (selectpname, max(scost) mxfrom software group by pname) t2 
where t1.pname = t2.pname and t1.scost = t2.mx) t1, 
(selectt1.pname, t1.scost, t1.titlefrom software t1, (selectpname, min(scost) mnfrom softwaregroup by pname) t2 
where t1.pname = t2.pname and t1.scost = t2.mn) t2 
where t1.pname = t2.pname 
Anand 400 T1 7500 Anand
 T2 400 Anand 
T1 7500 AnandT2 400 Anand
22. Display each institute name with number of courses, average cost per course 
select 
splace, count(course), avg(cost) 
from studies 
group by splace 
23. Display each institute name with number of students 
select 
splace, count(pname) 
from studies 
group by splace 
24. Display the names of male and female programmers 
select 
pname,gender 
from Programmer 
order by gender 
25. Display the programmers name and their packages 
select pname, title from software order by pname, title 
26. Display the number of packages in each language except C and C++ 
select dev_d,count(title) from Software where dev_d!='C' and dev_d!='C++' group by dev_d 
27. Display the number of packages in each language for which the development cost is less 
than 1000 
select dev_d, count(*) from software where dcost<1000 group by dev_d 
28. Display the average difference between SCOST and DCOST for each language 
select dev_d, avg(abs(scost - dcost)) from software group by dev_d 
29. Display the total SCOST, DCOST and amount to be recovered for each programmer for 
those whose DCOST has not yet been recovered 
select 
pname,sum(dcost),sum(scost*sold),sum(scost*sold)-sum(dcost) 
from Software 
group by pname 
having sum(scost*sold)-sum(dcost)<0 
30. Display the highest, lowest and average salaries for those earning more than 2000 
select 
max(salary), min(salary), avg(salary) 
from programmer 
where salary>2000 
31. Display the name of programmer(s) with highest salary 
select 
pname 
from Programmer 
where salary=(select max(salary) from Programmer) 
32. Display the name of programmer(s) of second highest salary 
select 
pname 
from programmer 
where salary in (select 
max(salary) 
from programmer 
where salary not in (select 
max(salary) 
from programmer)) 
Part – III 
1. Who is the highest paid C programmer 
select pname,salary from Programmer 
where salary=(select max(salary) from Programmer 
 where prof1='C' or prof2='C') 
2. Who is the highest paid female Cobol programmer 
select pname,salary from Programmer 
where gender='F' and salary=(select max(salary) 
from Programmer 
where gender=‘F’ and (prof1='Cobol' or prof2='Cobol')) 
3. Display the name of the highest paid programmers for each language (prof1) 
select p1.prof1,p1.pname,p1.salary from Programmer p1,(select 
prof1,max(salary) ms from Programmer group by prof1) p2 
where p1.prof1=p2.prof1 and p1.salary=p2.ms 
4. Who is the least experienced programmer 
select pname from programmer where sysdate-doj in (select min(sysdate-doj) 
from programmer) 
5. Who is the most experienced male programmer knowing Pascal 
select pname from programmer 
where gender = 'M' and (prof1 = 'Pascal' or prof2 = 'Pascal') 
and sysdate-doj in (select max(sysdate-doj) 
from programmer 
where gender = 'M' and (prof1 ='Pascal' or prof2 = 'Pascal')) 
6. Which language does only one programmer know 
select prof1 from (select prof1 from Programmer union all select prof2 from Programmer) 
group by prof1 
having count(prof1)=1 
7. Who is the above programmer 
Select pname From programmer Where prof1 in ( 6) or prof2 in (6) 
select pname from Programmer where prof1 in (select prof1 from (select prof1 
from Programmer union all select prof2 from Programmer) 
group by prof1 
having count(prof1)=1) or prof2 in (select prof1 from (select prof1 from Programmer 
union all select prof2 from Programmer) group by prof1 having count(prof1)=1) 
8. Who is the youngest programmer knowing dbase 
select pname from Programmer 
where (prof1='Dbase' or prof2='Dbase') and(sysdate-dob) in (select min(sysdate-dob) 
from Programmer where prof1='Dbase' or prof2='Dbase') 
9. Which female programmer earning more than 3000 doesn’t know C, C++, Oracle or dbase 
select pname,salary from Programmer where gender='F' and salary>3000 
and prof1 not in ('C','C++','Oracle','Dbase') and prof2 not in ('C','C++','Oracle','Dbase') 
10. Which institute has the most number of students 
select splace from studies group by splace having count(pname) in (select max(count(pname)) from studies 
group by splace) 
11. Which course has been done by most of the students 
select course from studies group by course having count(course) in (select max(count(course)) from studies 
group by course) 
12. Display the names of the institute and course which has below average course fee 
select distinct splace, course from studies where cost< (select avg(cost) 
from studies) 
13. Which is the costliest course 
select course from studies where cost in (select max(cost) from studies) 
14. Which institute conducts the costliest course 
select splace from studies where cost in (select max(cost) from studies) 
15. Which course has the below average number of students 
select course from studies group by course having count(*) < (select avg(count(*)) 
from studies group by course) 
16. Which institute conducts the above courses 
select course, splace from studies where course in (select course from studies 
group by course having count(*) < (select avg(count(*)) from studies group by course)) 
17. Display the number of courses whose fee are within the average fee 
select count(unique(course)) from studies where cost in (select avg(cost) from studies) 
18. Which package has highest development cost 
select title from software where dcost in (select max(dcost) from software) 
19. Which package has lowest development cost 
select title from software where dcost in (select min(dcost) from software) 
20. Who developed the package that has sold least number of copies 
select pname from software where sold in (select min(sold) from software) 
21. Which language was used to develop the package which has the highest sales amount 
select dev_d from software where sold*scost in (select max(sold*scost) from software) 
22. Display the package that has the least difference between development and selling cost 
select title from software where abs(dcost-scost) in (select min(abs(dcost-scost)) from software) 
23. Which is the costliest package developed in Pascal 
select title, dev_d, dcost from software where dev_d = 'Pascal' and dcost in (select max(dcost) 
from software where dev_d = 'Pascal') 
24. Which language was used to develop the most number of packages 
select dev_d from software group by dev_d 
having count(title) in (select max(count(title)) 
from software group by dev_d) 
25. Which programmer has developed the highest number of packages 
select pname from software group by pname 
having count(title) = (select max(count(title)) from software 
group by pname) 
26. Who is the author of the costliest package 
select pname from Software 
where scost in(select max(scost) from Software) 
27. Display the names of the packages which have sold less than the average number of 
copies 
select title from Software where sold <(select avg(sold) from Software) 
28. Who are the authors of the packages who have recovered more than the double the 
development cost 
select pname from Software where dcost*2<scost*sold 
29. Display the programmers name and his cheapest package developed by him in each 
language 
select pname,s1.dev_d,title from Software s1, 
(select dev_d,min(scost) scost from Software group by dev_d) s2 
where s1.dev_d=s2.dev_d and s1.scost=s2.scost 
30. Display the language used by each programmer to develop the highest selling and lowest 
selling package 
select s1.pname,s2.dev_d,s2.dev_d 
from (select pname,min(sold) x,max(sold) y from Software group by pname) s1,Software s2,Software s3 
where s1.pname=s2.pname and s1.pname=s3.pname and s1.x=s2.sold and s1.y=s3.sold 
31. Who is the youngest male programmer born in 1965 
select pname from Programmer 
where gender='M' and substr(dob,8,2)=65 and sysdate-dob in (select 
min(sysdate-dob) from Programmer where substr(dob,8,2)=65 and gender='M') 
32. Who is the oldest female programmer joined in 1982 
select pname from Programmer where gender='F' and substr(dob,8,2)=82 and sysdate-dob in (select 
max(sysdate-dob) from Programmer where substr(dob,8,2)=82 and gender='F') 
33. In which year did most of the programmers join 
select year from (select substr(doj, 8, 2) year from programmer) 
group by year having count(*) in (select max(count(*)) from programmer 
group by substr(doj, 8, 2)) 
34. Display the details of those who will be completed 20 years of service this year 
select pname from programmer where (sysdate-doj)/365 >20 
35. Calculate the amount to be recovered for those packages whose development cost has not 
yet been recovered 
select title, dcost-scost*sold from software where dcost-scost*sold>0 
36. List the packages which have not been sold so far 
select title from Software where sold=0 
37. Find out the cost of the software developed by Mary 
select pname,title,dcost from Software where pname='Mary' 
38. Display the institute name from studies table without duplicates 
select unique(splace) from Studies 
39. How many different courses are mentioned in the studies table 
select count(unique(course)) from studies 
40. Display the names of the programmers whose names contain 2 occurrences of the letter 
‘a’ 
select pname from programmer where pname like '%a%a%' 
41. Display the names of programmers whose names contains up to 5 characters 
select pname from programmer where length(pname)<=5 
42. How many female programmers knowing Cobol have more than 2 years experience 
select count(*) from Programmer 
where gender='F' and (prof1='Cobol' or prof2='Cobol') and round((sysdate-doj)/365)>2 
43. What is the length of the shortest name in the programmers table 
select min(length(pname)) from Programmer 
44. What is the average development cost of a package developed in Cobol 
select avg(dcost) from software where dev_d = 'Cobol' 
45. Display the name, sex, dob (dd/ mmm/ yy format), doj (dd/ mmm/ yy format) for all 
programmers without using the conversion function 
select pname, gender, replace(dob, '-', '/') dob, replace(doj, '-', '/') doj 
from programmer 
46. Who are the programmers who were born on the last day of the month 
select pname from programmer 
where (substr(dob, 4, 3) in ('JAN', 'MAR', 'MAY', 'JULY', 'AUG', 'OCT', 'DEC') and substr(dob, 0, 2) = 31) or 
(substr(dob, 4, 3) in ('APR', 'JUNE', 'SEP, NOV') and substr(dob, 0, 2) = 30) or (substr(dob, 4, 3) = 'FEB' and 
substr(dob, 0, 2) = 28) 
47. What is the amount paid salaries of male programmers who don’t know Cobol 
select pname,salary from Programmer 
where gender='M' and prof1!='Cobol' and prof2!='Cobol' 
48. Display the title, scost, dcost and difference between scost and dcost in descending order 
of difference 
select title, scost, dcost, abs(scost-dcost) diff from software 
order by diff desc 
49. Display the names of the packages whose name contain more than one word 
select title from software where title like '% %' 
50. Display the name, job, dob, doj of those month of birth and month of joining are same 
select pname, dob, doj from programmer where substr(dob, 4, 3) = substr(doj, 4, 3) 
Part – IV 
1. Display the details of those who are drawing the same salary 
select p1.name,p1.salary,p2.pname, p2.salary 
from Programmer p1,Programmer p2 
where p1.salary=p2.salary and p1.pname!=p2.pname 
order by p1.salary 
2. Display the details of the software developed by the male programmers earning more than 
3000 
select s.* from programmer p, software s 
where p.pname = s.pname and p.gender = 'M' and p.salary> 3000 
3. Display the details of the packages developed in Pascal by female programmers 
select s.* from software s,programmer p 
where s.pname=p.pname and p.gender='F' and s.dev_d='Pascal' 
4. Display the details of software developed in C by female programmers of Pragathi 
select 
s.*, st.splace 
from programmer p, software s, studies st 
where p.pname = s.pname and p.pname = st.pname and p.gender = 'F' and s.dev_d='C' and st.splace = 
'Pragathi' 
5. Display the number of packages, number of copies sold and sales value of each 
programmer institute wise 
select t1.*,t2.splace 
from(select pname,count(*) packages,sum(sold) copies,sum(scost*sold) sales from software group by pname) 
t1,studies t2 where t1.pname=t2.pname 
order by t2.splace 
6. Display the details of the software developed in dbase by male programmers who being to 
the institute in which most number of programmer studied 
select s.* from software s, studies st, programmer p 
Where s.pname = st.pname and s.pname=p.pname and 
s.dev_d='Dbase' and p.gender='M' and st.splace=(select splace from studies 
group by splace 
Having count(pname) = (select max(count(pname)) from studies group by splace)) 
7. Display the details of the software developed by male programmers who salary less 2500 
and female programmers whose salary greater than 2500 
select s.* from software s, programmer p 
where s.pname = p.pname and 
((p.gender='M' and p.salary<2500) or (p.gender='F' and p.salary>2500)) 
Or 
select s.* from software s 
where pname in ((select pname from programmer where gender='M' and salary<2500) 
union 
(select pname from programmer where gender='F' and salary>2500)) 
or 
select s.* from software s, programmer p where s.pname = p.pname and p.gender='M' and p.salary<2500 
union 
select s.* from software s, programmer p where s.pname = p.pname and p.gender='F' and p.salary>2500 
8. Display the details of the software that was developed in the language that is not 
programmers first proficiency 
select * from software where dev_d not in (select prof1 From programmer) 
(or) 
select s.* from Software s,Programmer p where s.pname=p.pname and s.dev_d !=p.prof1 
9. Display the details of the software that was developed in the language that is neither the 
first nor the second proficiency of the programmer 
select * from software where dev_d not in (select prof1 from programmer) and dev_d not in (select prof2 from 
programmer) 
(or) 
select s.* from Software s,Programmer p wheres.pname=p.pname and s.dev_d!=p.prof1 and s.dev_d!=p.prof2 
Select 
s.* 
From software s, programmer p 
Where s.pname=p.pname and s.dev_d!=p.prof1 
INTERSECT 
Select 
s.* 
From software s, programmer p 
Where s.pname=p.pname and s.dev_d!=p.prof2 
10. Display the details of the software that was developed by the male students of Sabhari 
select s.* From software s, studies st, programmer p 
Where s.pname = st.pname and s.pname=p.pname and st.splace=’Sabhari’ and p.gender=’M’ 
11. Display the names of programmers who have not developed any package 
select pname from Programmer 
MINUS 
select pname from Software 
12. What is the total cost of the software developed by the programmer in apple 
Select Sum(scost) From software s, studies st 
Where s.pname=st.pname and st.splace = 'apple' 
