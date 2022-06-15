--sub query
--1)column에 붙은 경우
select eno, ename, dno, (select dname from department where dno=e.dno) 부서명 from employee e;

--eno, ename, manager, 매니저명
select eno, ename, manager,(select ename from employee  where eno=e.manager)상관명 from employee e;

--부서번호가 10번의 최저급여보다 더 작은사람
--2)sub query가 조건절에 붙은 경우 
select min(salary) from employee where dno=10;
select ename, dno from employee where salary <(select min(salary) from employee where dno=10);

--3) table
--A는 뒤에 있는 from을 받음 
select rownum r, A.* from (select eno, ename, salary from employee order by salary desc) A;

select*from
(select rownum r, A.* from (select eno, ename, salary from employee order by salary desc) A)
where r between 6 and 10;  --oder by, rownum은 한번에 같이 쓸 수가 없어서 rownum을 매길 테이블로 한번더 감싸줌


--4)조건 절
--부서별로 급여가 제일 적은 사원
select min(salary) from employee;
select dno, min(salary) from employee group by dno;
select eno, ename, dno, salary from employee where salary in (select min(salary) from employee group by dno);


--5) having
--scott이 속한 부서 외 다른 부서의 취소 급여자 목록을 구하시오  multi row subquery
select eno,ename, salary, dno from employee where salary in
(select min(salary) from employee group by dno 
having  dno <> (select dno from employee where ename='SCOTT'));


--6) exists
--exists 확인된 존재만 출력 <> (not exists)
select eno, ename, dno from employee e where exists
(select dno, dname from department where e.dno=10);


--부서번호가 30,20,10인 직원 출력
select dno, eno from employee where dno in(30,20,10) order by 1,2;
select dno, eno from employee where exists(select dno from department where dno in(30,20,10)) order by 1,2;


--all, any
--all : select한 범위를 제외
--any : select한 범위를 포함
select eno, ename, job, salary from employee 
where salary <= all(select salary from employee where job='SALESMAN');

select eno, ename, job, salary from employee 
where salary >= any(select salary from employee where job='SALESMAN');
