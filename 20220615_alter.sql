select * from tab;

alter table dept add (reg_date date); --dept reg_date�� �߰� 
alter table dept rename column reg_date to reg;--�߰��� �� �̸� ����
alter table dept modify reg varchar2(20); --�� Ÿ�Ժ���
alter table dept drop column reg; --reg�� �����
alter table dept set unused(dno); --dno �� �����
alter table detp drop unused columns;  --�������̺� ����������
desc dept;--dept ���̺� ����