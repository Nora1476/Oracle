select to_char(sum(salary),'$9,999,999') as �ѱ޿�,to_char(avg(salary),'$9,999.0') as ��ձ޿�,
 to_char(max(salary),'$9,999.0') as �ְ��,to_char(min(salary),'$9,999.0') as ������
from employee;

select job,to_char(sum(salary),'$9,999,999') as �ѱ޿�,to_char(avg(salary),'$9,999.0') as ��ձ޿�,
 to_char(max(salary),'$9,999.0') as �ִ�޿�,to_char(min(salary),'$9,999.0') as �ּұ޿�,
 count(nvl(commission,0)) as ���ο� from employee group by job;
desc employee; 
select job, count(job) from employee group by job;

select job, count(job) from employee GROUP BY JOB having job='MANAGER';
select * from employee where eno in(select distinct manager from employee where manager is not null);

select max(salary)-min(salary) as ���� from employee;

SELECT JOB, MIN(SALARY) FROM EMPLOYEE WHERE MANAGER IS NOT NULL group by job having min(salary) >=2000
order by min(salary) desc;

select dno, count(eno), round(AVG(salary)) from employee group by dno;

select dno, sum(salary) from employee group by dno order by job;

select dno, count(eno), round(AVG(salary)) from employee group by dno;

--8. �� �μ��� ���� �μ���ȣ, �̸�, ������, �����, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�.
select e.dno, dname, cityname, count(e.dno), round(avg(salary))
from employee e, department d, loc l
where e.dno=d.dno and d.loc=l.loc group by e.dno, d.dname, l.cityname;


--9. ������ ǥ���� ���� �ش� ������ ���� �μ���ȣ�� �μ��� �� �μ� 10,20,30�� �޿� �Ѿ��� ���� ����Ͻÿ�. �� �÷��� ��Ī�� ���� job, �μ� 10, �μ� 20, �μ� 30, �Ѿ����� �����Ͻÿ�.
select job, e.dno, (select dname from department where dno=e.dno)dname, sum(salary) 
from employee e group by job, dno order by job, dno;