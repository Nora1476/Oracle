selcet 98.7654 from dual;

--�ݿø�
select round(98.7654) from dual;
select round(98.7654,3) from dual;  --�Ҽ��� 3��° �ڸ����� �ݿø�
select round(98.7654,-1) from dual; 

--����
select trunc(98.7654) from dual;
select trunc(98.7654,2) from dual;
select trunc(98.7654,-1) from dual;

--�ø�
select ceil(98.7654) from dual;   --�ø� �Ҽ��� �ڸ� �����ؼ� �ø��� �Ұ�
select ceil(98.7654*power(10,2))/power(10,2) from dual;
select sum(salary) from employee;
select avg(salary) from employee;

--�μ���ȣ�� 10���� ������� �޿� �հ� ����� ���ϵ� ����� �Ҽ� 2��° �ڸ����� ǥ���Ͻÿ�.
select dno, sum(salary), trunc(avg(salary),2)  from employee where dno in(10) group by dno;

--������ ������
select mod(10,3) from dual;

--��Ʈ
select sqrt(16) from dual;
