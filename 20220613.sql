select * from employee;
select * from employee where dno = 10;
select eno, ename, job, salary from employee;
select ename || '(' || dno ||')', job, salary from employee;
select ename, job, salary, commission, salary*12+nvl(commission,0) as "1년치 연봉" from employee;

select eno, ename, e.dno, dname from employee e, department d
where e.dno= d.dno;


select dno, dname, loc.loc, cityname from department , loc 
where loc.loc = department.loc order by loc.loc desc;


select *from employee order by dno asc, salary desc;

select * from employee where ename = upper('smith');
select eno, lower(ename) from employee where ename = upper('smith');

select * from employee where hiredate>'85/01/01';

select* from employee where dno='10' or dno='20' order by dno;
select* from employee where dno in(10,20) order by dno;

select * from employee where salary >=1000 and salary <=2000;
select * from employee where  salary between 1000 and 2000;

select * from employee where commission is not null;

select * from employee where dno <> 30;
select * from employee where not(dno=30);
select * from employee where dno not in(20,30);

select * from employee where nvl(commission, 0) = 0; 
select eno, ename, commission, nvl2(commission, commission*12,0) a from employee;
select eno, ename, commission, nvl(commission, 0) a from employee;

select * from employee where ename like '%A%';



select eno 사원번호, ename 사원명 , salary 현재급여, salary+300 as "인상급여"  from employee; --1
select ename 사원명, salary 급여, salary*12 as "연간 총수입" from employee order by  salary*12 desc; --2
select ename, salary from employee where salary >2000 order by salary desc;  --3
select ename, eno from employee where eno='7788'; --4
select ename, eno, salary from employee where salary not between 2000 and 3000;  --5
select * from employee where hiredate between '1981/02/20' and '1981/05/01';  --6
select ename, dno from employee where dno in(20,30) order by ename  desc;   --7
select ename, salary, dno from employee where salary between 2000 and 3000 and dno in(20,30) order by ename;  --8
select ename, hiredate from employee where hiredate like '81%';  --9
select ename, job from employee where manager is null;  --10
select ename, salary, commission from employee where commission is not null order by commission desc;  --11
select * from employee where ename like '__R%';  --12
select * from employee where ename like '%A%E%';  --13
select * from employee where ename like '%A%' and ename like '%E%';
select ename, job, salary from employee where job in ('CLERK','SALESMAN') and salary not in(1600,950,1300);  --14
select ename, salary, commission from employee where commission >=500;  --15

