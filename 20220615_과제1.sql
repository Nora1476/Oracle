--1. 각부서별 평균 급여에 대하여 -500, +500사이의 범위에 있는 사원의 부서번호, 사원번호, 이름, 급여.
select dno, eno, ename, salary 
from employee 
where salary > any(select round(avg(salary))-500 from employee)
    and salary < any(select round(avg(salary))+500 from employee);


--2. 사원번호가 7788인 사원과 담당업무가 같은 사원(사원이름 담당업무)
select ename, job from employee where job=(select job from employee where eno='7788');


--3. 사원번호가 7499인 사원보다 급여가 많은 사원표기(사원이름, 담당업무)
select ename, job from employee where salary>(select salary from employee where eno='7499');


--4, job 별로 평균급여가 가장 적은 job의 평균 급여를 표시
select job, min(평균급여) from (select job, round(avg(salary))평균급여 from employee group by job);


--5.각 부서 최소 급여를 받는 사원의 이름, 급여를 표시
 select ename, salary, dno from employee where salary in (select min(salary) from employee group by dno);
 
 
 --6. 담당업무가 분석가(ANALYST)인 사원보다 급여가 적으면서 업무가 분석가가 아닌 사원들(시원번호, 담당업무, 급여)
select eno, job, salary from employee 
where salary <= all(select salary from employee where job='ANALYST') and job <>'ANALYST';


--7. 부하직원이 없는 사원의 이름 (manager 행이 사원번호가 없는사람)
select ename from employee where eno not in (select distinct manager from employee where manager is not null);


--8. 부하직원이 있는 사원의 이름
select ename from employee where eno in (select distinct manager from employee where manager is not null);


--