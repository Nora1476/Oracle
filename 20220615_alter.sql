select * from tab;

alter table dept add (reg_date date); --dept reg_date행 추가 
alter table dept rename column reg_date to reg;--추가한 행 이름 변경
alter table dept modify reg varchar2(20); --행 타입변경
alter table dept drop column reg; --reg행 지우기
alter table dept set unused(dno); --dno 행 숨기기
alter table detp drop unused columns;  --숨긴테이블 지워버리기
desc dept;--dept 테이블 보기