select 'Oracle Database' from dual;  --dual �����ؽ�Ʈ
select upper('Oracle Database') from dual;
select lower('Oracle Database') from dual;
select initcap('don''t stop me') from dual; --initcap �ձ��ڸ� �빮�ڷ� �ٲ�/��������ǥ 2���� ������ ' �� ǥ��
select length('hello world') from dual; -- ���ڱ��� ��������
select length('�ȳ� �����') from dual;
select lengthb('hello world') from dual; --b�� ����Ʈ ũ�� ����� �� �� �� 1byte
select lengthb('�ȳ� �����') from dual;  --�ѱ۴� �� �� �� 3byte, ����� 1byte

select concat('Oracle', 'DATA' || 'world') from dual; -- concat ���� 2�������� �ռ�
select concat('Oracle',''||'world') from dual; --concat �ι�° ���ڸ� �������� �ְ� verticla var�� �ռ�����

select substr('hello world',1,4) from dual; --DB 1base�� ����/ 
select * from employee where substr (ename,3,2)='NG';

select instr('Hello World','W') from dual;  --�ι�° ���ڷ� �� ���ڰ� �� ��°���� ���   
select substrb('�ȳ� �����',3,11) from dual; --
select instrb('�ȳ� �����', '1') from dual;  --
select rpad(ename, 7,'*'), lpad(salary, 10,0) from employee; -- rightpadding ������ ������ �����������ͷ� ä�� / leftpdding ���ʰ����� ������ �����ͷ� ä��
select rpad(hiredate, 2,' ') from employee;
select substrb('������',1,6) from employee; --substrb substringbyte�� ���  �ι�°���� �ڸ����ں��� 3����Ʈ�� ����ؼ� �������Ҽ�����
select substrb('������',-6,6) from employee;


select regexp_replace('hello world', 'o', '') from dual; -- ���� 'o'�� ''�� ���ֹ���
select rtrim('   he  llo   ') from dual;  --rtrim, ltrim
select rtrim('   he  llo   ') from dual;
select ename, substr(ename,1,1) || regexp_replace(substr(ename,2),'[A-Z]', '*') from employee; 
select regexp_replace(ename, '[A-C]', '*') from employee;
select salary, translate (salary, '[012345678]', '*********') from employee;  -- ��ü �ϰ����ϴ� ���ڸ� �ι�° ���ڷ� ������, ����° ���ڷ� �ϰ����ϴ� ��ŭ ��ü�� ���ڸ� ������