--���̺� ����  
--create table ���̺��̸� (��)
create table dept (dno number(2,0), dname varchar2(14), loc varchar2(13));
desc dept;


--���������� ���̺� ���鶧
create table dept2 as select * from department ;
select *from dept2;


--������ ��������� ������ ����X
create table dept3 as select * from department where 1=0;
select *from dept3;


--column comment�������
--��,�� ���ڷ� �ڸ�Ʈ ���� (��������)
comment on table dept is 'department'; 
comment on column dept.dno is '�μ���ȣ';
comment on column dept.dname is '�μ���';
comment on column dept.loc is '�����ڵ�';

select * from  user_tab_comments where table_name='DEPT'; --���̺� �߰��� �ڸ�Ʈ�� Ȯ���Ҷ�
select * from  user_col_comments where table_name='DEPT'; --�࿡ �߰��� �ڸ�Ʈ�� Ȯ���Ҷ�


--truncate ���̺� �ȿ� ���� ����
truncate table dept2;
select * from  dept2;


--drop ���̺� ����
drop table dept2;


--���� ���� ���̺� ��κ���
select * from tab;
select * from user_tables;
select * from all_tables;


--���̺� �̸� ����
rename dept3 to dept2;
select * from tab;


select * from user_objects; --����ڰ� ���� object ����
select * from user_objects where object_type='TABLE';
