--1. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����϶�.
select max(salary) �޿��ְ��, min(salary) �޿�������, sum(salary) �Ѿ�, round(avg(salary)) ��վ� from employee;

select to_char(max(salary),'$9,999,999') �޿��ְ��, to_char(min(salary),'$9,999,999') �޿�������, 
to_char(sum(salary),'$9,999,999') �Ѿ�, to_char(round(avg(salary)),'$9,999,999') ��վ� from employee;

--2. �� ��� ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��վ��� ����Ͻÿ�.
select job, max(salary) �޿��ְ��, min(salary) �޿�������, sum(salary) �Ѿ�, round(avg(salary)) ��վ� from employee  group by job;

select job, to_char(sum(salary),'$9,999,999')as �ѱ޿�, to_char(avg(salary),'$9,999,999')as ��ձ޿�,
    to_char(max(salary),'$9,999,999') as ���ο� from employee group by job;

--3. count(*)�Լ��� �̿��Ͽ� �������� ������ ������� ����Ͻÿ�
select job, count(*) from employee group by job ;

--4. ������ ���� �����Ͻÿ�.
select job, count(job) from employee group by job;
select job, count(job) from employee group by job  having  job='MANAGER';
select * from employee where eno in (select distinct manager from employee where manager is not null);

--5. �޿� �ְ�װ� �������� ���̸� ����Ͻÿ�.
select �޿��ְ��-�޿������� from
(select  max(salary) �޿��ְ��, min(salary) �޿�������  from employee);

--6. ���޺� ����� ���� �޿��� ����Ͻÿ�, �����ڸ� �� �� ���� ��� �� ���� �޿��� 2000 �̸��� �׷��� ���ܽ�Ű�� ����� �޿��� ���� ������������ �����Ͽ� ����Ͻÿ�.
select * from
(select  job, min(salary) �޿�������  from employee group by job order by �޿�������) where �޿�������>2000;

select job,  min(salary) from employee where manager is not null group by job having min(salary) >=2000 order by min(salary);

--7. �� �μ��� ���� �μ���ȣ, �����, �μ� ���� ��� ����� ��� �޿��� ����Ͻÿ�.
select job, count(*), round(avg(salary)) ��վ� from employee group by job;
select dno, count(eno), round(avg(salary)) from employee group by dno;

--8. �� �μ��� ���� �μ���ȣ, �̸�, ������, �����, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�.
select e.dno, dname, cityname, count(e.dno), round(avg(salary))
from employee e, department d, loc l 
where e.dno=d.dno and d.loc=l.loc group by e.dno, d.dname, cityname;

--9. ������ ǥ���� ���� �ش� ������ ���� �μ���ȣ�� �μ��� �� �μ� 10,20,30�� �޿� �Ѿ��� ���� ����Ͻÿ�. 
--�� �÷��� ��Ī�� ���� job, �μ� 10, �μ� 20, �μ� 30, �Ѿ����� �����Ͻÿ�.
select  dno, sum(salary) from employee group by dno order by dno;
select job, e.dno, (select dname from department where dno=e.dno)dname, sum(salary) 
from employee e group by job, dno order by job, dno;




--1. Equi ������ ����Ͽ� scott ����� �μ���ȣ�� �μ��̸��� ����Ͻÿ�.
select ename from employee;
select ename, e.dno, dname from employee e, department d where e.dno=d.dno and ename='SCOTT'; 

--2. inner join �� on �����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����Ͻÿ�.
select ename, dname, cityname 
from employee e inner join department d on(e.dno=d.dno) inner join loc l on(d.loc=l.loc);

--3. inner join�� using �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� ��� ������ �������(�� ������ ǥ��)�� �μ��� �������� �����Ͽ� ����Ͻÿ�.
select dname, dno, job, loc, cityname 
from employee inner join department using(dno) inner join loc using(loc) where dno=10;


--4. natural join�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ���, �������� ����Ͻÿ�.
select ename, commission, dno, dname, cityname
from employee natural inner join department natural inner join loc
where commission is not null and commission <>0;


--5. equi ���ΰ� wildcard�� ����Ͽ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.
select ename, d.dno, dname, cityname
from employee e, department d, loc l
where e.dno=d.dno and d.loc=l.loc and ename like '%A%';


--6. natural join�� ����Ͽ� Newyork�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�.
select ename, dno, ename, cityname from employee natural inner join department natural inner join loc
where cityname='NEWYORK';


--7. self join�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����Ͻÿ�.
select e.eno, e.ename, e.manager, m.ename 
from employee e, employee m where e.manager = m.eno;


--8. outer join, self join�� ����Ͽ� �����ڰ� ���� �����  �����Ͽ� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.
select e.eno, e.ename, e.manager, m.ename from employee e, employee m
where e.manager=m.eno(+) order by e.eno desc;
 
select e.eno, e.ename, e.manager, m.ename from employee e left outer join employee m
on(e.manager=m.eno) order by e.eno desc;

--9. self join �� ����Ͽ� �����, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�.
select t.ename, t.dno from employee s, employee t
where s.dno=t.dno and s.ename='SCOTT' and t.ename<>'SCOTT';
select ename, dno from employee where dno = (select dno from employee where ename='SCOTT');


--10. self join �� ����Ͽ� ward ������� �ʰ� �Ի��� ������̸��� �Ի����� ����Ͻÿ�.
select f.ename, f.hiredate from employee w, employee f
where w.hiredate < f.hiredate and w.ename ='WARD'
order by f.hiredate;


--11. self join�� ����Ͽ� ������ ���� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ����Ͻÿ�.
select e.eno, e.ename, e.hiredate
from employee e left outer join  employee m on(e.manager=m.eno)
where e.hiredate < m.hiredate and e.manager=m.eno order by e.hiredate;

