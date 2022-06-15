select * from dept2; 
desc dept2;
--DML: insert, update, delete   =반드시 조건절 사용하여 바꾸기
--update 테이블명 set 바꿀필드면 where조건;
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
--sql간 범위 다른 명령어 사용시 자동으로 commit이 되기 때문에 delete dept2 where dno=90; 이전상태로 되돌릴수 없음 
