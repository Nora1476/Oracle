--sql - TCL
--transaction : �ϳ��� ������ ó�� �۾�����
--���� : All-Or-Nothiing

drop table EMPS;
create table EMPS (�����ȣ number(2,0), �̸� varchar2(14), �μ� varchar2(13));
desc dept;

insert all
into EMPS values(10,'���ȹ','��ȹ��')
into EMPS values(20,'���λ�','�λ��')
into EMPS values(30,'���繫','�繫��')
into EMPS values(40,'������','������')
select * from dual;

select*from EMPS;
commit;
delete EMPS where �����ȣ=40;
delete EMPS where �����ȣ=30;  --å����commitȿ��
savepoint s1;
delete EMPS where �����ȣ=20;
savepoint s2;
delete EMPS where �����ȣ=10;
select *from EMPS;
rollback to s2;