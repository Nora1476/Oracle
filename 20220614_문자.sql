--시스템 날짜 출력
select sysdate from dual;

SELECT sysdate +1 from dual;
SELECT sysdate -1 from dual;
SELECT sysdate-1 as 어제, sysdate as 오늘 ,sysdate+1 as 내일 from dual;
SELECT sysdate-(sysdate-1) from dual;
select sysdate + 100/24 from dual;  -- 100시간/24  시간을 날짜로 변환
select sysdate, localtimestamp from dual;


--날짜 > 문자 
select to_char(round(sysdate,'cc'), 'yyyymmdd') from dual; -- full year의 끝 cc 두 자로 년도 표기 50이상이될경우 100년이 넘어감

-- 반올림
select to_char(round(to_date(20510101,'yyyymmdd'),'cc'), 'yyyymmdd') from dual; --cc: full year의 끝 cc 두 자로 년도 표기 50이상이될경우 100년이 넘어감
select to_char(round(to_date(20510630,'yyyymmdd'),'yy'), 'yyyymmdd') from dual;
select to_char(round(to_date(20510701,'yyyymmdd'),'yy'), 'yyyymmdd') from dual; 
select to_char(round(to_date(20510215,'yyyymmdd'),'q'), 'yyyymmdd') from dual; --quarter: 해당년도의 분기
select to_char(round(to_date(20510211,'yyyymmdd'),'mm'), 'yyyymmdd') from dual;  --mm: date를 기준으로 해당 월 반올림
select to_char(round(to_date(20220616,'yyyymmdd'),'d'), 'yyyymmdd') from dual; --day: 해당 날짜 일주일을 기준으로 반올림
select to_char(round(to_date('20220616 072901','yyyymmdd hhmiss'),'hh'), 'yyyymmdd hh:mi:ss') from dual; --hh: 분을 기준으로 반올림(30분일경우 시간 반올림
select to_char(round(to_date('20220616 070030','yyyymmdd hhmiss'),'mi'), 'yyyymmdd hh:mi:ss') from dual;--mi: 초를 기준으로 분을 반올림(30분일 경우)

--내림
select to_char(trunc(to_date(20510101,'yyyymmdd'),'cc'), 'yyyymmdd') from dual; --100년을 주기로 내림
select to_char(trunc(to_date(20510630,'yyyymmdd'),'yy'), 'yyyymmdd') from dual;
select to_char(trunc(to_date(20510315,'yyyymmdd'),'q'), 'yyyymmdd') from dual; --분기를 기준으로 내림
select to_char(trunc(to_date(20220616,'yyyymmdd'),'d'), 'yyyymmdd') from dual; --day: 해당 날짜 일주일을 기준으로 반올림


select ename, hiredate, ceil(sysdate-hiredate) as 근무일자 from employee group by ename, hiredate;
select ename, round(months_between(sysdate,hiredate)/12) 근무년수 from employee;  --months_between 해당 월의 일자만큼 알아서 계산
select sysdate, last_day(sysdate) from dual;  --(오늘)해당달의 마지막 일자
select sysdate, to_date(20220301,'yyyymmdd')-1 from dual;  --해당달의 마지막 일자 구하는 방법


--날짜 > 문자, 숫자 > 문자
select ename, to_char(hiredate, 'day') from employee;  -- to_chart사용하여 요일을 문자데이터로 반환
select ename, to_char(hiredate, 'dy') from employee;
select ename, to_char(salary, 'L9,999.00') from employee;
select ename, to_char(salary, 'L0,000.00') from employee;  --빈공간데이터는 0으로 채움


--문자 > 숫자
select to_number('100,000', '999,999') from dual; --문자 100,000을 숫자데이터로 변경


select nullif('A','A'), nullif('A','B') from dual; --nullif 두 변수가 같으면 null값을 출력
select ename, salary, commission, coalesce(commission, salary, 0) from employee; --commission이 null이면 salary로 대체 salary도 null이면 0으로 대체


--decode 함수
select ename, dno, decode(dno, 10, '회계', 20, '연구', 30, '경영', '기타') from employee;

select ename, dno, case when dno=10 then '회계' when dno=20 then '연구' 
when dno=30 then '경영' when dno=40 then '기타' end as dname from employee;

select ename,job, salary, decode(job, 'ANALYST', salary+500, 'CLERK', salary+500,'SALESMAN', salary+500, 'MANAGER', salary+200) 인상급여 from employee order by job;


select ename, job, salary, case when job='ANALYST' then salary+500 when job='CLERK' then salary+100 
when job='SALESMAN' then salary+300 when job='MANAGER' then salary+200 end as dname from employee order by job;


--sub query 이용한 인상급여 합계, 평균, 최대값, 최소값
select count(인상급여), sum(인상급여) ,round(avg(인상급여)) , max(인상급여), min(인상급여) from 
    (select ename,job, salary, decode(job, 'ANALYST', salary+500, 'CLERK', salary+100,'SALESMAN', salary+300, 
    'MANAGER', salary+200, 'PRESIDENT', salary+600 ) 인상급여 from employee);

select count(*) from employee;
select count(commission) from employee;  --null값은 count에 포함 안됨




select distinct dno from employee;  --중복값을 뺀 데이터 값을 출력
select distinct job from employee;
select distinct job, sum(salary) from employee group by job;  --군집성이 잇는 속성을 같은 군집성에서 사용 distinct group by 붙여주기
select distinct job, sum(salary) from employee group by job having sum(salary)>5000;



--순위함수 rank() over/ dense_rank() over
select ename, salary, rank() over(order by salary desc) 순위 from employee;
select ename, salary, hiredate, dense_rank() over(order by salary desc, hiredate desc) 순위 from employee;  -- dense_rank() over 중간 동률로 없어지는 순위가 없도록 설정
select dno, ename, salary, hiredate, dense_rank() over(partition by dno order by salary desc, hiredate desc) 순위 from employee; --랭킹된 상태에서 부서별로 정렬하고싶을때 partition by


--순위함수 topn
select rownum R, ename, salary, 순위 from 
(select ename, salary, dense_rank() over(order by salary desc) 순위 from employee);  --모든순위출력

select*from(select rownum R, ename, salary, 순위 from 
(select ename, salary, dense_rank() over(order by salary desc) 순위 from employee)) a where a.순위<=5;  --top5 순위출력

select * from employee order by salary desc fetch first 5 rows only; --(오라클 11이상버전부터 가능)

select * from
(select rownum r ,eno, ename, salary from(select eno,  ename, salary from employee order by salary desc)) A
where a.r>=6 and a.r<=10;
--rownum의 6~10번쨰 출력(rownum을 지정함(orderby가 되어있는 데이터로 순서를 지정))