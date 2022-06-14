--cross join
select * from loc, department;  
select *from loc;
select *from department;




--equi join
--조건절을 붙은 join 사용권장
--employee에서 알수없는 dname, dno를 통해 department로 접근 후 dname get함
select*from employee;
select*from department;
select eno, ename, e.dno, dname from employee e, department d where e.dno = d.dno; --where 절이용
select eno, ename, e.dno, dname from employee e join department d on(e.dno=d.dno);  --많이쓰임
select eno, ename, dno, dname from employee natural join department; --알아서 연결시켜 줌
select eno, ename, dno, dname from employee join department using(dno); --

-- eno, ename, e.dno, dname, d.loc, cityname 출력하기
select eno, ename, e.dno, dname, d.loc, cityname from employee e, department d, loc l 
where e.dno=d.dno and d.loc=l.loc and e.ename='KING';

select eno, ename, e.dno, dname, d.loc, cityname 
from employee e inner join department d on(e.dno=d.dno) inner join loc l on(d.loc=l.loc); 

select eno, ename, dno, dname,loc, cityname from
(select * from employee natural inner join department)natural inner join loc;  --첫번째방법
select eno, ename, dno, dname, loc, cityname 
from employee natural join department natural join loc;  --두번째방법

select eno, ename, dno, dname, loc, cityname 
from employee inner join department using(dno) inner join loc using(loc); 






--none equi join
--natural join, join using은 사용불가함
select * from salgrade;
select eno, ename, salary, grade from employee e, salgrade s where e.salary between losal and hisal;
--between 범위 안에 속하는 데이터(매칭이 되는 동등한 관계가 아닌) 비동등
select eno, ename, salary, grade from employee e join salgrade s on( e.salary between losal and hisal);
 





--self join
--eno, ename, manager name
--ename의 manaher관리자 이름을 참조하려면 자신을 한번 더 참조해야 함
select e.eno, e.ename, e.manager, m.ename 매니저명 from employee e, employee m where e.manager= m.eno;




--outer join
select e.eno, e.ename, e.manager, m.ename 매니저명 from employee e, employee m where e.manager= m.eno;  --null 값은 제외
select e.eno, e.ename, e.manager, m.ename 매니저명 from employee e, employee m where e.manager= m.eno(+) and e.dno=10;
                                                                            --null 값이 있는 쪽에 (+) 추가하면 null값까지 같이 출력
select e.eno, e.ename, e.manager, m.ename 매니저명 from employee e left outer join employee m
on(e.manager= m.eno) where e.dno = 10;

select e.eno, e.ename, e.manager, m.ename 매니저명 from employee e right outer join employee m
on(e.manager= m.eno); 







--합집합  union/ unionall
select ename, dno from employee where dno in(20,30)
union all
select ename, dno from employee where dno in(10,30);


-- 교집합  intersect
select * from employee where dno in(20,30)
intersect
select * from employee where dno in(10,30);


-- 차집합 minus  
-- 앞선 데이터를 주체로 차집합이 해당되는 데이터만 출력
select * from employee where dno in(20,30)
minus
select * from employee where dno in(10,30);