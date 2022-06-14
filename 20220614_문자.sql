--�ý��� ��¥ ���
select sysdate from dual;

SELECT sysdate +1 from dual;
SELECT sysdate -1 from dual;
SELECT sysdate-1 as ����, sysdate as ���� ,sysdate+1 as ���� from dual;
SELECT sysdate-(sysdate-1) from dual;
select sysdate + 100/24 from dual;  -- 100�ð�/24  �ð��� ��¥�� ��ȯ
select sysdate, localtimestamp from dual;


--��¥ > ���� 
select to_char(round(sysdate,'cc'), 'yyyymmdd') from dual; -- full year�� �� cc �� �ڷ� �⵵ ǥ�� 50�̻��̵ɰ�� 100���� �Ѿ

-- �ݿø�
select to_char(round(to_date(20510101,'yyyymmdd'),'cc'), 'yyyymmdd') from dual; --cc: full year�� �� cc �� �ڷ� �⵵ ǥ�� 50�̻��̵ɰ�� 100���� �Ѿ
select to_char(round(to_date(20510630,'yyyymmdd'),'yy'), 'yyyymmdd') from dual;
select to_char(round(to_date(20510701,'yyyymmdd'),'yy'), 'yyyymmdd') from dual; 
select to_char(round(to_date(20510215,'yyyymmdd'),'q'), 'yyyymmdd') from dual; --quarter: �ش�⵵�� �б�
select to_char(round(to_date(20510211,'yyyymmdd'),'mm'), 'yyyymmdd') from dual;  --mm: date�� �������� �ش� �� �ݿø�
select to_char(round(to_date(20220616,'yyyymmdd'),'d'), 'yyyymmdd') from dual; --day: �ش� ��¥ �������� �������� �ݿø�
select to_char(round(to_date('20220616 072901','yyyymmdd hhmiss'),'hh'), 'yyyymmdd hh:mi:ss') from dual; --hh: ���� �������� �ݿø�(30���ϰ�� �ð� �ݿø�
select to_char(round(to_date('20220616 070030','yyyymmdd hhmiss'),'mi'), 'yyyymmdd hh:mi:ss') from dual;--mi: �ʸ� �������� ���� �ݿø�(30���� ���)

--����
select to_char(trunc(to_date(20510101,'yyyymmdd'),'cc'), 'yyyymmdd') from dual; --100���� �ֱ�� ����
select to_char(trunc(to_date(20510630,'yyyymmdd'),'yy'), 'yyyymmdd') from dual;
select to_char(trunc(to_date(20510315,'yyyymmdd'),'q'), 'yyyymmdd') from dual; --�б⸦ �������� ����
select to_char(trunc(to_date(20220616,'yyyymmdd'),'d'), 'yyyymmdd') from dual; --day: �ش� ��¥ �������� �������� �ݿø�


select ename, hiredate, ceil(sysdate-hiredate) as �ٹ����� from employee group by ename, hiredate;
select ename, round(months_between(sysdate,hiredate)/12) �ٹ���� from employee;  --months_between �ش� ���� ���ڸ�ŭ �˾Ƽ� ���
select sysdate, last_day(sysdate) from dual;  --(����)�ش���� ������ ����
select sysdate, to_date(20220301,'yyyymmdd')-1 from dual;  --�ش���� ������ ���� ���ϴ� ���


--��¥ > ����, ���� > ����
select ename, to_char(hiredate, 'day') from employee;  -- to_chart����Ͽ� ������ ���ڵ����ͷ� ��ȯ
select ename, to_char(hiredate, 'dy') from employee;
select ename, to_char(salary, 'L9,999.00') from employee;
select ename, to_char(salary, 'L0,000.00') from employee;  --����������ʹ� 0���� ä��


--���� > ����
select to_number('100,000', '999,999') from dual; --���� 100,000�� ���ڵ����ͷ� ����


select nullif('A','A'), nullif('A','B') from dual; --nullif �� ������ ������ null���� ���
select ename, salary, commission, coalesce(commission, salary, 0) from employee; --commission�� null�̸� salary�� ��ü salary�� null�̸� 0���� ��ü


--decode �Լ�
select ename, dno, decode(dno, 10, 'ȸ��', 20, '����', 30, '�濵', '��Ÿ') from employee;

select ename, dno, case when dno=10 then 'ȸ��' when dno=20 then '����' 
when dno=30 then '�濵' when dno=40 then '��Ÿ' end as dname from employee;

select ename,job, salary, decode(job, 'ANALYST', salary+500, 'CLERK', salary+500,'SALESMAN', salary+500, 'MANAGER', salary+200) �λ�޿� from employee order by job;


select ename, job, salary, case when job='ANALYST' then salary+500 when job='CLERK' then salary+100 
when job='SALESMAN' then salary+300 when job='MANAGER' then salary+200 end as dname from employee order by job;


--sub query �̿��� �λ�޿� �հ�, ���, �ִ밪, �ּҰ�
select count(�λ�޿�), sum(�λ�޿�) ,round(avg(�λ�޿�)) , max(�λ�޿�), min(�λ�޿�) from 
    (select ename,job, salary, decode(job, 'ANALYST', salary+500, 'CLERK', salary+100,'SALESMAN', salary+300, 
    'MANAGER', salary+200, 'PRESIDENT', salary+600 ) �λ�޿� from employee);

select count(*) from employee;
select count(commission) from employee;  --null���� count�� ���� �ȵ�




select distinct dno from employee;  --�ߺ����� �� ������ ���� ���
select distinct job from employee;
select distinct job, sum(salary) from employee group by job;  --�������� �մ� �Ӽ��� ���� ���������� ��� distinct group by �ٿ��ֱ�
select distinct job, sum(salary) from employee group by job having sum(salary)>5000;



--�����Լ� rank() over/ dense_rank() over
select ename, salary, rank() over(order by salary desc) ���� from employee;
select ename, salary, hiredate, dense_rank() over(order by salary desc, hiredate desc) ���� from employee;  -- dense_rank() over �߰� ������ �������� ������ ������ ����
select dno, ename, salary, hiredate, dense_rank() over(partition by dno order by salary desc, hiredate desc) ���� from employee; --��ŷ�� ���¿��� �μ����� �����ϰ������ partition by


--�����Լ� topn
select rownum R, ename, salary, ���� from 
(select ename, salary, dense_rank() over(order by salary desc) ���� from employee);  --���������

select*from(select rownum R, ename, salary, ���� from 
(select ename, salary, dense_rank() over(order by salary desc) ���� from employee)) a where a.����<=5;  --top5 �������

select * from employee order by salary desc fetch first 5 rows only; --(����Ŭ 11�̻�������� ����)

select * from
(select rownum r ,eno, ename, salary from(select eno,  ename, salary from employee order by salary desc)) A
where a.r>=6 and a.r<=10;
--rownum�� 6~10���� ���(rownum�� ������(orderby�� �Ǿ��ִ� �����ͷ� ������ ����))