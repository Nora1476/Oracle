--1. ���μ��� ��� �޿��� ���Ͽ� -500, +500������ ������ �ִ� ����� �μ���ȣ, �����ȣ, �̸�, �޿�.
select dno, eno, ename, salary 
from employee 
where salary > any(select round(avg(salary))-500 from employee)
    and salary < any(select round(avg(salary))+500 from employee);


--2. �����ȣ�� 7788�� ����� �������� ���� ���(����̸� ������)
select ename, job from employee where job=(select job from employee where eno='7788');


--3. �����ȣ�� 7499�� ������� �޿��� ���� ���ǥ��(����̸�, ������)
select ename, job from employee where salary>(select salary from employee where eno='7499');


--4, job ���� ��ձ޿��� ���� ���� job�� ��� �޿��� ǥ��
select job, min(��ձ޿�) from (select job, round(avg(salary))��ձ޿� from employee group by job);


--5.�� �μ� �ּ� �޿��� �޴� ����� �̸�, �޿��� ǥ��
 select ename, salary, dno from employee where salary in (select min(salary) from employee group by dno);
 
 
 --6. �������� �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м����� �ƴ� �����(�ÿ���ȣ, ������, �޿�)
select eno, job, salary from employee 
where salary <= all(select salary from employee where job='ANALYST') and job <>'ANALYST';


--7. ���������� ���� ����� �̸� (manager ���� �����ȣ�� ���»��)
select ename from employee where eno not in (select distinct manager from employee where manager is not null);


--8. ���������� �ִ� ����� �̸�
select ename from employee where eno in (select distinct manager from employee where manager is not null);


--