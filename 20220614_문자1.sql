select 'Oracle Database' from dual;  --dual 더미텍스트
select upper('Oracle Database') from dual;
select lower('Oracle Database') from dual;
select initcap('don''t stop me') from dual; --initcap 앞글자만 대문자로 바꿈/작은따옴표 2개로 문자의 ' 을 표기
select length('hello world') from dual; -- 글자길이 공백포함
select length('안녕 세상아') from dual;
select lengthb('hello world') from dual; --b는 바이트 크기 영어는 한 자 당 1byte
select lengthb('안녕 세상아') from dual;  --한글는 한 자 당 3byte, 공백는 1byte

select concat('Oracle', 'DATA' || 'world') from dual; -- concat 변수 2개까지만 합성
select concat('Oracle',''||'world') from dual; --concat 두번째 문자를 공백으로 주고 verticla var로 합성가능

select substr('hello world',1,4) from dual; --DB 1base로 시작/ 
select * from employee where substr (ename,3,2)='NG';

select instr('Hello World','W') from dual;  --두번째 인자로 온 글자가 몇 번째인지 출력   
select substrb('안녕 세상아',3,11) from dual; --
select instrb('안녕 세상아', '1') from dual;  --
select rpad(ename, 7,'*'), lpad(salary, 10,0) from employee; -- rightpadding 오른쪽 공백을 정해진데이터로 채움 / leftpdding 왼쪽공백을 정해진 데이터로 채움
select rpad(hiredate, 2,' ') from employee;
select substrb('조봉희',1,6) from employee; --substrb substringbyte의 경우  두번째인자 자리숫자부터 3바이트로 계산해서 나오게할수있음
select substrb('조봉희',-6,6) from employee;


select regexp_replace('hello world', 'o', '') from dual; -- 글자 'o'만 ''로 없애버림
select rtrim('   he  llo   ') from dual;  --rtrim, ltrim
select rtrim('   he  llo   ') from dual;
select ename, substr(ename,1,1) || regexp_replace(substr(ename,2),'[A-Z]', '*') from employee; 
select regexp_replace(ename, '[A-C]', '*') from employee;
select salary, translate (salary, '[012345678]', '*********') from employee;  -- 대체 하고자하는 숫자만 두번째 인자로 적어줌, 세번째 인자로 하고자하는 만큼 대체될 문자를 적어줌