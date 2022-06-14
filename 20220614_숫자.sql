selcet 98.7654 from dual;

--반올림
select round(98.7654) from dual;
select round(98.7654,3) from dual;  --소수점 3번째 자리에서 반올림
select round(98.7654,-1) from dual; 

--버림
select trunc(98.7654) from dual;
select trunc(98.7654,2) from dual;
select trunc(98.7654,-1) from dual;

--올림
select ceil(98.7654) from dual;   --올림 소수점 자리 지정해서 올림은 불가
select ceil(98.7654*power(10,2))/power(10,2) from dual;
select sum(salary) from employee;
select avg(salary) from employee;

--부서번호가 10번인 사원들의 급여 합과 평균을 구하되 평균은 소수 2번째 자리까지 표기하시오.
select dno, sum(salary), trunc(avg(salary),2)  from employee where dno in(10) group by dno;

--나머지 연산자
select mod(10,3) from dual;

--루트
select sqrt(16) from dual;
