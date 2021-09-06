6:
declare
    a number :=5;
    b number :=6;
    c number;
begin
    c :=a+b;
    dbms_output.put_line('sum of' ||a|| 'and' ||b|| 'is' ||c);
end;

7:
declare
    a number :=2;
begin
    if(mod(a,2)=0) then
        dbms_output.put_line(a || 'is even');
    else
        dbms_output.put_line(a || 'is odd');
    end if;
end;














8: using while loop 
declare
    a number :=8;
    i number :=1;
begin
    if(a>0) then
        while(i<=a)
        loop
        dbms_output.put_line(i);
        i:=i+1;
        end loop;
    end if;
end;
  using for loop
declare
    a number :=8;
    i number :=1;
begin
    if(a>0) then
        for i in 1..a
        loop
        dbms_output.put_line(i);
        end loop;
    end if;
end;






9:
declare
    a number :=5;
    b number :=6;
    c number :=2;
    d number ;
    r1 number ;
    r2 number ;
begin
    d:=b*b-4*a*c;
    if(d>0) then
        r1:=(-b+sqrt(d))/(2*a);
        r2:=(-b-sqrt(d))/(2*a);
        dbms_output.put_line('the roots are' ||r1|| 'and' ||r2);
else if(d=0) then
    r1:=-b/(2*a);
    dbms_output.put_line('the roots are' ||r1|| 'and' ||r1);
else
    r1:=-b/(2*a);
    r2:=sqrt(-d)/(2*a);
    dbms_output.put_line('the roots are' ||r1|| 'and' ||'+i'||r2||r1||'-i'||r2);
    end if;
end if;
end;







10
declare
    n number :=2;
    i number :=1;
    cnt number :=0;
begin
    for i in 1..n
    loop
    if(mod(n,i)=0) then
        cnt :=cnt+1;
    end if;
    end loop;
    if(cnt=2) then
        dbms_output.put_line(n ||'is prime');
    else
        dbms_output.put_line(n ||'is not prime');
    end if;
end;













11
declare
    m number :=10;
    j number;
    n number;
    c number;
    i number;
begin
    i :=2;
    for i in 1..m
        loop
            c :=0;
            j :=1;
    for j in 1..i
        loop
            if(mod(i,j)=0) then
            c:=c+1;
end if;
end loop;
if(c=2) then
dbms_output.put_line(i);
end if;
end loop;
end;







12
declare
    n number :=5;
    i number :=1;
begin
    for i in 1..10
        loop
        dbms_output.put_line(n ||'*'||i||'='||n*i);
        end loop;
end;

13
declare
    n number :=65;
    rem number :=0;
    tot number :=0;
    k number :=0;
begin
    k :=n;
    while(n>0)
        loop
        rem :=mod(n,10);
        tot :=tot*10+rem;
        n :=trunc(n/10);
        end loop;
    if(tot=k) then
        dbms_output.put_line(k || 'is palindrome');
    else
        dbms_output.put_line(k || 'is not palindrome');
    end if;
end;
14
declare
    g varchar2(20);
    r varchar2(20);
    i number(4);
begin
    g:='mam';
    for i in reverse 1..length(g)
    loop
        r:=r||substr(g,i,1);
    end loop;
    dbms_output.put_line('reverse string is' ||r);
    if r=g then
        dbms_output.put_line('string is palindrome');   
    else
        dbms_output.put_line('string is not palindrome');
    end if;
end;

15
declare
	pn programmer.pname%type:='Mary';
	db programmer.dob%type;
begin
	select dob into db from programmer where pname=pn;
	dbms_output.put_line('Date of birth is   '||db);
exception
	when no_data_found then
		dbms_output.put_line('No data');
	
end;
16
declare
	cursor s is select * from programmer;
	t s%rowtype;
begin
	open s;
	loop
		fetch s into t;
		exit when s%notfound;
		dbms_output.put_line('Pname  '||t.pname||'  '||'Date of Birth   '||t.dob);
	end loop;
	close s;
end;

17
declare
	pn software.pname%type:='Mary';
	cursor s is select * from software where pname=pn;
	t s%rowtype;
begin
	open s;
	loop
		fetch s into t;
		exit when s%notfound;
		dbms_output.put_line(t.title);
	end loop;
	close s;
end;

	

18
declare
	t software.title%type:='Read Me';
	pn software.pname%type;
begin
	select pname into pn from software where title=t;
	dbms_output.put_line('Name  '||pn);
exception
	when no_data_found then
	dbms_output.put_line('No Data');
end;

19
First create radius and circle table then execute the following code:
declare
    cursor s is select * from radius;
    t s%rowtype;
begin
    open s;
    loop
        fetch s into t;
        exit when s%notfound;
        insert into circle values(t.radius,3.14*t.radius*t.radius,2*3.14*t.radius);
    end loop;
end;






20
A
create or replace procedure product(a in number,b in number)as c number;
begin
    c:=a*b;
    dbms_output.put_line('Product of'||a||'and'||b||'is'||c);
end;

b
declare
    x number:=100;
    y number:=6;
begin
    product(x,y);
end;

21
a
create or replace procedure db(p in programmer.pname%type) as
	d programmer.dob%type;
begin
	select dob into d from programmer where pname=p;
	dbms_output.put_line('Dob is  '||d);
exception
	when no_data_found then
    	dbms_output.put_line('NO DATA');
end;




b
declare
    x programmer.PNAME%type:='Altaf';
begin
    db(x);
end;

22
a
create or replace function add2(a in number,b in number)return number as c number;
begin
    c:=a+b;
    return(c);
end;

b
declare
    x number:=5;
    y number:=12;
    r number;
begin
    r:=add2(x,y);
    dbms_output.put_line('Sum is :'||r);
end;







23
A
create or replace function getdb(p in programmer.pname%type) return date as
	d programmer.dob%type;
begin
	select dob into d from programmer where pname=p;
	return(d);
end;

b
declare
	x programmer.pname%type:='Altaf';
	r programmer.dob%type;
begin
	r:=getdb(x);
	dbms_output.put_line('Date of birth is   '||r);
end;














24
A
create or replace procedure getname(sp in studies.splace%type) as
	cursor s is select * from studies where splace=sp;
	t s%rowtype;
begin
	open s;
	loop
		fetch s into t;
		exit when s%notfound;
		dbms_output.put_line(t.pname);
		end loop;
	close s;
end;

b
declare
	x studies.splace%type:='BITS';
begin
	getname(x);
end;










25
A
create or replace function gettot(p in software.pname%type) return number as
	r number;
	cursor s is select * from software where pname=p;
	t s%rowtype;
begin
	r:=0;
	open s;
	loop
		fetch s into t;
		exit when s%notfound;
		r:=r+t.dcost;
	end loop;
	close s;
	return(r);
end;
b
declare
	res number;
	p software.pname%type:='Vijaya';
begin
	res:=gettot(p);
	dbms_output.put_line('Total development cost is   '||res);
end;






26
A
create or replace package my_pack1 is
     procedure product_table(a in number);
     function product(a in number,b in number)return number;
end;

b
create or replace package body my_pack1 as
     procedure product_table(a in number)as
        i number;
        begin
            i:=1;
            while(i<=10)
            loop
                dbms_output.put_line(a||'*'||i||'='||a*i);
                i:=i+1;
            end loop;
        end product_table;
        function product(a in number,b in number)return number as c number;
            begin
                c:=a*b;
                return c;
            end product;
        end;






c
declare
    x number:=12;
    y number:=2;
    z number;
begin
    my_pack1.product_table(x);
    z:=my_pack1.product(x,y);
    dbms_output.put_line('Product of'||x||'and'||y||'is:'||z);
end;













27
a
create or replace package pack1 is
    procedure p1(p in programmer.pname%type);
    function f1(t in software.TITLE%type)return software.PNAME%type;
end;


b
create or replace package body pack1 as
    procedure p1(p in programmer.pname%type)as 
        s programmer.SALARY%type;
    begin
        select SALARY into s from programmer where PNAME=P;
        dbms_output.put_line('Salary is :'||s);
    end p1;
    function f1(t in software.TITLE%type)return
        software.PNAME%type as
        x software.PNAME%type;
        begin
            select PNAME into x from software where TITLE=t;
            return x;
        end f1;
    end;

c
declare
    a programmer.PNAME%type:='Mary';
    b software.TITLE%type:='Dead Lee';
    r software.PNAME%type;
begin
    pack1.p1(a);
    r:=pack1.f1(b);
    dbms_output.put_line('PNAME og given project :' ||r);
end;




28
A
create or replace package pack2 is
    procedure p2(x in software.DEV_D%type);
    function f2(y in studies.PNAME%type)return studies.SPLACE%type;
end;

b
create or replace package body pack2 is
    procedure p2(x in software.DEV_D%type) as
        cursor s is select*from software where DEV_D=x;
        t s%rowtype;
        begin
            open s;
            loop
                fetch s into t;
                exit when s%notfound;
                dbms_output.put_line(t.TITLE);
            end loop;
            close s;
        end p2;
        function f2(y in studies.PNAME%type)return studies.SPLACE%type as
            r studies.SPLACE%type;
            begin
                select SPLACE into r from studies where PNAME=r;
                return r;
            end f2;
        end;
 


  c
declare
    a programmer.pname%type:='Anand';
    b software.title%type:='Read Me';
    r software.pname%type;
begin
    pack1.p1(a);
    r:=pack1.f1(b);
    dbms_output.put_line('pname of given project:'||r);
end;

30
A
create table student1(rollno number(3) primary key,
sname varchar2(15),
marks1 number(3),
marks2 number(3),
total number(4));

b
create or replace trigger auto_cal before insert on student1 for each row
declare
begin
	:new.total := :new.marks1 + :new.marks2;
end;

c
select * from student1;



31
A
create table prog as select pname, salary from programmer;

b
create table update_prog
(pname varchar2(20),
old_salary number(7,2),
new_salary number(7,2),
dt date,
time varchar2(10));

c
create or replace trigger update_status after update on prog for each row 
begin
	insert into update_prog values(:old.pname, :old.salary, :new.salary, sysdate, substr(current_timestamp,11,8));
end;

d
select * from update_prog;

32
A
create table student
(roll number(3) primary key,
sname varchar2(15),
age number(3));



b
create or replace trigger age before insert on student 
declare
begin
	update student set age=age+1;
end;

c
select * from student;


 

		








