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


--9. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시(BLAKE는 제외)
select distinct ename, hiredate, dno from employee 
where dno=(select dno from employee  where ename='BLAKE') and ename<>'BLAKE';


--10.부서 위치가 BUSAN인 사원의 이름과 부서번호 및 담당업무를 표시.(부산근무자 없음)  NEWYORK을 변경함 ㅎ
select * from employee where dno=(select dno from department where loc=(select loc from loc where cityname='NEWYORK'));
select * from employee where dno=(select dno from department d, loc l where d.loc=l.loc and cityname='NEWYORK');


--11. KING에게 보고하는 사원의 이름과 급여(상관이 KING인사람)
select ename, salary from employee where manager=(select eno from employee where ename='KING');


--12. 평균급여보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은부서에서 근무하는 사원(사원번호, 이름, 급여)
select eno, ename, salary from employee 
where salary > (select round(avg(salary)) from employee)
and dno in (select dno from employee where ename like '%M%');


--13. 담당업무가 ANALYST인 사원이 소속된 부서와 동일한 부서의 사원을 표시
select * from employee where dno in(select dno from employee where job='ANALYST');


--14. 부서번호, 부서명, 부서별 인원수를 출력
select dno, dname, (select count(dno) from employee where dno=d.dno)인원수 from department d;
select a.dno, a.dname, b.c from 
(select dno, dname from department) a, (select dno, count(dno) c from employee group by dno) b where a.dno = b.dno;
select a.dno, a.dname, b.c from department a, (select dno, count(dno) c  from employee group by dno) b where a.dno=b.dno(+);


--15. 각 근무 지역에 대해 근무지명, 지역번호, 지역별 사원수, 지역별 모든 사원의 평균급여 출력
select cityname, d.loc, count(eno), round(avg(salary)) 평균급여 from employee e, department d, loc l where e.dno=d.dno and d.loc=l.loc group by cityname, d.loc;
