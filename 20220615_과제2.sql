--1,2 테이블 생성 
create table dept2(dno number(2,0), dname varchar2(14), loc varchar2(13), regdate timestamp);
create table emp2(eno number(2), ename varchar2(14), dno number(2), regdate timestamp);

--3 테이블 column 타이틀 변경 
alter table emp2 modify(eno number(4,0), ename varchar2(25), regdate date);

--4 테이블 생성(자료복사) 
create table employee2(emp_id, name, sal, dept_id) as select eno, ename, salary, dno from employee;

--5 테이블 이름변경 
rename employee2 to emp3;

--6 테이블 지우기 
drop table emp2;
drop table emp3;

--7 테이블 행 지우기 
alter table dept2 drop column dname;

--8 unused 행 숨기기 
 alter table dept2 set unused(loc);
 
--9 drop unused
alter table dept2 drop unused columns;

--10 테이블 구조만 복사
create table emp_insert as select * from employee where 1=0;

--11,12  테이블에 열 삽입
insert into emp_insert values(5000, 'Nora', 'SALES', 7902 , sysdate, 1000, null, 10);
insert into emp_insert values(5000, 'Nora', 'SALES', 7902 , to_date(sysdate-1,'yyyy/mm/dd'), 1000, null, 10);

--13. 테이블 구조, 내용 복사
create table emp_copy as select*from employee;

--14, 15, 16 테이블 데이터 변경  
--(사원번호가 7788인 사원의 부서번호를 10번으로)
update emp_copy set dno=10 where eno=7788;
--(7788인 사원의 담당업무 및 급여를 7499와 일치시키기)
update emp_copy set(job, salary) = (select job, salary from emp_copy where eno=7499) where eno=7788;
--(사원번호가 7369의 업무가 동일한 모든 사원의 부서번호를 7369사원의 부서번호로 변경)
update emp_copy set dno = (select dno from emp_copy where eno =7369) where job=(select job from emp_copy where eno=7369);

--17. 테이블 구조, 내용 복사
create table dept_copy as select*from department;

--18. 열 제거
delete dept_copy where dname='RESEARCH'; --dname 리서치인 열 제거
delete dept_copy where dno in(10,40);



