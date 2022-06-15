--sub query
--1)column�� ���� ���
select eno, ename, dno, (select dname from department where dno=e.dno) �μ��� from employee e;

--eno, ename, manager, �Ŵ�����
select eno, ename, manager,(select ename from employee  where eno=e.manager)����� from employee e;

--�μ���ȣ�� 10���� �����޿����� �� �������
--2)sub query�� �������� ���� ��� 
select min(salary) from employee where dno=10;
select ename, dno from employee where salary <(select min(salary) from employee where dno=10);

--3) table
--A�� �ڿ� �ִ� from�� ���� 
select rownum r, A.* from (select eno, ename, salary from employee order by salary desc) A;

select*from
(select rownum r, A.* from (select eno, ename, salary from employee order by salary desc) A)
where r between 6 and 10;  --oder by, rownum�� �ѹ��� ���� �� ���� ��� rownum�� �ű� ���̺�� �ѹ��� ������


--4)���� ��
--�μ����� �޿��� ���� ���� ���
select min(salary) from employee;
select dno, min(salary) from employee group by dno;
select eno, ename, dno, salary from employee where salary in (select min(salary) from employee group by dno);


--5) having
--scott�� ���� �μ� �� �ٸ� �μ��� ��� �޿��� ����� ���Ͻÿ�  multi row subquery
select eno,ename, salary, dno from employee where salary in
(select min(salary) from employee group by dno 
having  dno <> (select dno from employee where ename='SCOTT'));


--6) exists
--exists Ȯ�ε� ���縸 ��� <> (not exists)
select eno, ename, dno from employee e where exists
(select dno, dname from department where e.dno=10);


--�μ���ȣ�� 30,20,10�� ���� ���
select dno, eno from employee where dno in(30,20,10) order by 1,2;
select dno, eno from employee where exists(select dno from department where dno in(30,20,10)) order by 1,2;


--all, any
--all : select�� ������ ����
--any : select�� ������ ����
select eno, ename, job, salary from employee 
where salary <= all(select salary from employee where job='SALESMAN');

select eno, ename, job, salary from employee 
where salary >= any(select salary from employee where job='SALESMAN');
