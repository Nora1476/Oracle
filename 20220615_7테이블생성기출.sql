--sql - TCL
--transaction : 하나의 데이터 처리 작업단위
--목적 : All-Or-Nothiing

drop table EMPS;
create table EMPS (사원번호 number(2,0), 이름 varchar2(14), 부서 varchar2(13));
desc dept;

insert all
into EMPS values(10,'김기획','기획부')
into EMPS values(20,'박인사','인사부')
into EMPS values(30,'최재무','재무부')
into EMPS values(40,'오영업','영업부')
select * from dual;

select*from EMPS;
commit;
delete EMPS where 사원번호=40;
delete EMPS where 사원번호=30;  --책갈피commit효과
savepoint s1;
delete EMPS where 사원번호=20;
savepoint s2;
delete EMPS where 사원번호=10;
select *from EMPS;
rollback to s2;