--insert 데이터값 삽입

select * from dept2; 
desc dept2;
insert into dept2 values(10,'accounting',40); --열에 value 삽입
insert into dept2(dno) values('30');
-- dno열값에 not null 속성을 줌. null값을 없애므로써 데이터 무결성 확보
alter table dept2 modify dno not null;

insert into dept2 select*from department;
rollback;
commit;

alter table dept2 add regdate date;
insert into dept2 values(40,'CLERK', 10, to_date('20220614','yyyymmdd'));

insert all 
into dept2 values(60,'A',10,sysdate)
into dept2 values(70,'A',20,sysdate)
into dept2 values(80,'A',30,sysdate)
into dept2 values(90,'A',40,sysdate)
select * from dual;

