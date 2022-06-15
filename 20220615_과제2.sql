--1,2 ���̺� ���� 
create table dept2(dno number(2,0), dname varchar2(14), loc varchar2(13), regdate timestamp);
create table emp2(eno number(2), ename varchar2(14), dno number(2), regdate timestamp);

--3 ���̺� column Ÿ��Ʋ ���� 
alter table emp2 modify(eno number(4,0), ename varchar2(25), regdate date);

--4 ���̺� ����(�ڷẹ��) 
create table employee2(emp_id, name, sal, dept_id) as select eno, ename, salary, dno from employee;

--5 ���̺� �̸����� 
rename employee2 to emp3;

--6 ���̺� ����� 
drop table emp2;
drop table emp3;

--7 ���̺� �� ����� 
alter table dept2 drop column dname;

--8 unused �� ����� 
 alter table dept2 set unused(loc);
 
--9 drop unused
alter table dept2 drop unused columns;

--10 ���̺� ������ ����
create table emp_insert as select * from employee where 1=0;

--11,12  ���̺� �� ����
insert into emp_insert values(5000, 'Nora', 'SALES', 7902 , sysdate, 1000, null, 10);
insert into emp_insert values(5000, 'Nora', 'SALES', 7902 , to_date(sysdate-1,'yyyy/mm/dd'), 1000, null, 10);

--13. ���̺� ����, ���� ����
create table emp_copy as select*from employee;

--14, 15, 16 ���̺� ������ ����  
--(�����ȣ�� 7788�� ����� �μ���ȣ�� 10������)
update emp_copy set dno=10 where eno=7788;
--(7788�� ����� ������ �� �޿��� 7499�� ��ġ��Ű��)
update emp_copy set(job, salary) = (select job, salary from emp_copy where eno=7499) where eno=7788;
--(�����ȣ�� 7369�� ������ ������ ��� ����� �μ���ȣ�� 7369����� �μ���ȣ�� ����)
update emp_copy set dno = (select dno from emp_copy where eno =7369) where job=(select job from emp_copy where eno=7369);

--17. ���̺� ����, ���� ����
create table dept_copy as select*from department;

--18. �� ����
delete dept_copy where dname='RESEARCH'; --dname ����ġ�� �� ����
delete dept_copy where dno in(10,40);



