select * from dept2; 
desc dept2;
--DML: insert, update, delete   =�ݵ�� ������ ����Ͽ� �ٲٱ�
--update ���̺�� set �ٲ��ʵ�� where����;
update dept2 set dname = 'MANAGER' where dno=60;
update dept2 set dname = 'CLERK' where dno=30;
update dept2 set dname = 'developer' where dno in(select dno from dept2 where dname = 'A');
update dept2 set loc = 10 where loc is null;
update dept2 set regdate = sysdate where regdate is null;


--delete
delete dept2 where dno=90;
create table dept3 as  select * from department;
rollback;
--DML: insert, update, delete --DDL: create, alter, drop, truncate 
--sql�� ���� �ٸ� ��ɾ� ���� �ڵ����� commit�� �Ǳ� ������ delete dept2 where dno=90; �������·� �ǵ����� ���� 
