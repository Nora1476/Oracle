--cross join
select * from loc, department;  
select *from loc;
select *from department;




--equi join
--�������� ���� join ������
--employee���� �˼����� dname, dno�� ���� department�� ���� �� dname get��
select*from employee;
select*from department;
select eno, ename, e.dno, dname from employee e, department d where e.dno = d.dno; --where ���̿�
select eno, ename, e.dno, dname from employee e join department d on(e.dno=d.dno);  --���̾���
select eno, ename, dno, dname from employee natural join department; --�˾Ƽ� ������� ��
select eno, ename, dno, dname from employee join department using(dno); --

-- eno, ename, e.dno, dname, d.loc, cityname ����ϱ�
select eno, ename, e.dno, dname, d.loc, cityname from employee e, department d, loc l 
where e.dno=d.dno and d.loc=l.loc and e.ename='KING';

select eno, ename, e.dno, dname, d.loc, cityname 
from employee e inner join department d on(e.dno=d.dno) inner join loc l on(d.loc=l.loc); 

select eno, ename, dno, dname,loc, cityname from
(select * from employee natural inner join department)natural inner join loc;  --ù��°���
select eno, ename, dno, dname, loc, cityname 
from employee natural join department natural join loc;  --�ι�°���

select eno, ename, dno, dname, loc, cityname 
from employee inner join department using(dno) inner join loc using(loc); 






--none equi join
--natural join, join using�� ���Ұ���
select * from salgrade;
select eno, ename, salary, grade from employee e, salgrade s where e.salary between losal and hisal;
--between ���� �ȿ� ���ϴ� ������(��Ī�� �Ǵ� ������ ���谡 �ƴ�) �񵿵�
select eno, ename, salary, grade from employee e join salgrade s on( e.salary between losal and hisal);
 





--self join
--eno, ename, manager name
--ename�� manaher������ �̸��� �����Ϸ��� �ڽ��� �ѹ� �� �����ؾ� ��
select e.eno, e.ename, e.manager, m.ename �Ŵ����� from employee e, employee m where e.manager= m.eno;




--outer join
select e.eno, e.ename, e.manager, m.ename �Ŵ����� from employee e, employee m where e.manager= m.eno;  --null ���� ����
select e.eno, e.ename, e.manager, m.ename �Ŵ����� from employee e, employee m where e.manager= m.eno(+) and e.dno=10;
                                                                            --null ���� �ִ� �ʿ� (+) �߰��ϸ� null������ ���� ���
select e.eno, e.ename, e.manager, m.ename �Ŵ����� from employee e left outer join employee m
on(e.manager= m.eno) where e.dno = 10;

select e.eno, e.ename, e.manager, m.ename �Ŵ����� from employee e right outer join employee m
on(e.manager= m.eno); 







--������  union/ unionall
select ename, dno from employee where dno in(20,30)
union all
select ename, dno from employee where dno in(10,30);


-- ������  intersect
select * from employee where dno in(20,30)
intersect
select * from employee where dno in(10,30);


-- ������ minus  
-- �ռ� �����͸� ��ü�� �������� �ش�Ǵ� �����͸� ���
select * from employee where dno in(20,30)
minus
select * from employee where dno in(10,30);