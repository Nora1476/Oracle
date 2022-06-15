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


--9. BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ��(BLAKE�� ����)
select distinct ename, hiredate, dno from employee 
where dno=(select dno from employee  where ename='BLAKE') and ename<>'BLAKE';


--10.�μ� ��ġ�� BUSAN�� ����� �̸��� �μ���ȣ �� �������� ǥ��.(�λ�ٹ��� ����)  NEWYORK�� ������ ��
select * from employee where dno=(select dno from department where loc=(select loc from loc where cityname='NEWYORK'));
select * from employee where dno=(select dno from department d, loc l where d.loc=l.loc and cityname='NEWYORK');


--11. KING���� �����ϴ� ����� �̸��� �޿�(����� KING�λ��)
select ename, salary from employee where manager=(select eno from employee where ename='KING');


--12. ��ձ޿����� ���� �޿��� �ް� �̸��� M�� ���Ե� ����� �����μ����� �ٹ��ϴ� ���(�����ȣ, �̸�, �޿�)
select eno, ename, salary from employee 
where salary > (select round(avg(salary)) from employee)
and dno in (select dno from employee where ename like '%M%');


--13. �������� ANALYST�� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ��
select * from employee where dno in(select dno from employee where job='ANALYST');


--14. �μ���ȣ, �μ���, �μ��� �ο����� ���
select dno, dname, (select count(dno) from employee where dno=d.dno)�ο��� from department d;
select a.dno, a.dname, b.c from 
(select dno, dname from department) a, (select dno, count(dno) c from employee group by dno) b where a.dno = b.dno;
select a.dno, a.dname, b.c from department a, (select dno, count(dno) c  from employee group by dno) b where a.dno=b.dno(+);


--15. �� �ٹ� ������ ���� �ٹ�����, ������ȣ, ������ �����, ������ ��� ����� ��ձ޿� ���
select cityname, d.loc, count(eno), round(avg(salary)) ��ձ޿� from employee e, department d, loc l where e.dno=d.dno and d.loc=l.loc group by cityname, d.loc;
