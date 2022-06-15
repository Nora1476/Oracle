--테이블 생성  
--create table 테이블이름 (열)
create table dept (dno number(2,0), dname varchar2(14), loc varchar2(13));
desc dept;


--서브쿼리로 테이블 만들때
create table dept2 as select * from department ;
select *from dept2;


--구조는 복사되지만 내용은 복사X
create table dept3 as select * from department where 1=0;
select *from dept3;


--column comment생성방법
--남,여 숫자로 코멘트 생성 (시험출제)
comment on table dept is 'department'; 
comment on column dept.dno is '부서번호';
comment on column dept.dname is '부서명';
comment on column dept.loc is '지역코드';

select * from  user_tab_comments where table_name='DEPT'; --테이블 추가된 코멘트는 확인할때
select * from  user_col_comments where table_name='DEPT'; --행에 추가된 코멘트는 확인할때


--truncate 테이블 안에 내용 삭제
truncate table dept2;
select * from  dept2;


--drop 테이블 삭제
drop table dept2;


--내가 만든 테이블 모두보기
select * from tab;
select * from user_tables;
select * from all_tables;


--테이블 이름 변경
rename dept3 to dept2;
select * from tab;


select * from user_objects; --사용자가 만든 object 보기
select * from user_objects where object_type='TABLE';
