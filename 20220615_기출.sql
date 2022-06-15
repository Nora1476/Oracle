--1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하라.
select max(salary) 급여최고액, min(salary) 급여최저액, sum(salary) 총액, round(avg(salary)) 평균액 from employee;

select to_char(max(salary),'$9,999,999') 급여최고액, to_char(min(salary),'$9,999,999') 급여최저액, 
to_char(sum(salary),'$9,999,999') 총액, to_char(round(avg(salary)),'$9,999,999') 평균액 from employee;

--2. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하시오.
select job, max(salary) 급여최고액, min(salary) 급여최저액, sum(salary) 총액, round(avg(salary)) 평균액 from employee  group by job;

select job, to_char(sum(salary),'$9,999,999')as 총급여, to_char(avg(salary),'$9,999,999')as 평균급여,
    to_char(max(salary),'$9,999,999') as 총인원 from employee group by job;

--3. count(*)함수를 이용하여 담당업무가 동일한 사원수를 출력하시오
select job, count(*) from employee group by job ;

--4. 관리자 수를 나열하시오.
select job, count(job) from employee group by job;
select job, count(job) from employee group by job  having  job='MANAGER';
select * from employee where eno in (select distinct manager from employee where manager is not null);

--5. 급여 최고액과 최저액의 차이를 출력하시오.
select 급여최고액-급여최저액 from
(select  max(salary) 급여최고액, min(salary) 급여최저액  from employee);

--6. 직급별 사원의 최저 급여를 출력하시오, 관리자를 알 수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select * from
(select  job, min(salary) 급여최저액  from employee group by job order by 급여최저액) where 급여최저액>2000;

select job,  min(salary) from employee where manager is not null group by job having min(salary) >=2000 order by min(salary);

--7. 각 부서에 대해 부서번호, 사원수, 부서 내의 모든 사원의 평균 급여를 출력하시오.
select job, count(*), round(avg(salary)) 평균액 from employee group by job;
select dno, count(eno), round(avg(salary)) from employee group by dno;

--8. 각 부서에 대해 부서번호, 이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여를 출력하시오.
select e.dno, dname, cityname, count(e.dno), round(avg(salary))
from employee e, department d, loc l 
where e.dno=d.dno and d.loc=l.loc group by e.dno, d.dname, cityname;

--9. 업무를 표시한 다음 해당 업무에 대해 부서번호별 부서명 및 부서 10,20,30의 급여 총액을 각각 출력하시오. 
--각 컬럼의 별칭은 각각 job, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오.
select  dno, sum(salary) from employee group by dno order by dno;
select job, e.dno, (select dname from department where dno=e.dno)dname, sum(salary) 
from employee e group by job, dno order by job, dno;




--1. Equi 조인을 사용하여 scott 사원의 부서번호와 부서이름을 출력하시오.
select ename from employee;
select ename, e.dno, dname from employee e, department d where e.dno=d.dno and ename='SCOTT'; 

--2. inner join 과 on 연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오.
select ename, dname, cityname 
from employee e inner join department d on(e.dno=d.dno) inner join loc l on(d.loc=l.loc);

--3. inner join과 using 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 고유목록(한 번씩만 표시)을 부서의 지역명을 포함하여 출력하시오.
select dname, dno, job, loc, cityname 
from employee inner join department using(dno) inner join loc using(loc) where dno=10;


--4. natural join을 사용하여 커미션을 받는 모든 사원의 이름, 부서명, 지역명을 출력하시오.
select ename, commission, dno, dname, cityname
from employee natural inner join department natural inner join loc
where commission is not null and commission <>0;


--5. equi 조인과 wildcard를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하시오.
select ename, d.dno, dname, cityname
from employee e, department d, loc l
where e.dno=d.dno and d.loc=l.loc and ename like '%A%';


--6. natural join을 사용하여 Newyork에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select ename, dno, ename, cityname from employee natural inner join department natural inner join loc
where cityname='NEWYORK';


--7. self join을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력하시오.
select e.eno, e.ename, e.manager, m.ename 
from employee e, employee m where e.manager = m.eno;


--8. outer join, self join을 사용하여 관리자가 없는 사원을  포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
select e.eno, e.ename, e.manager, m.ename from employee e, employee m
where e.manager=m.eno(+) order by e.eno desc;
 
select e.eno, e.ename, e.manager, m.ename from employee e left outer join employee m
on(e.manager=m.eno) order by e.eno desc;

--9. self join 을 사용하여 사원명, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오.
select t.ename, t.dno from employee s, employee t
where s.dno=t.dno and s.ename='SCOTT' and t.ename<>'SCOTT';
select ename, dno from employee where dno = (select dno from employee where ename='SCOTT');


--10. self join 을 사용하여 ward 사원보다 늦게 입사한 사원의이름과 입사일을 출력하시오.
select f.ename, f.hiredate from employee w, employee f
where w.hiredate < f.hiredate and w.ename ='WARD'
order by f.hiredate;


--11. self join을 사용하여 관리자 보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
select e.eno, e.ename, e.hiredate
from employee e left outer join  employee m on(e.manager=m.eno)
where e.hiredate < m.hiredate and e.manager=m.eno order by e.hiredate;

