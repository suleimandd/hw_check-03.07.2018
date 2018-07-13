--create database Sick_list
--use Sick_list

--create table Education (
--id int not null primary key check (id < 4),
--name nvarchar(30) not null)

--insert Education values (0, '�������')
--insert Education values (1, '�������-�����������')
--insert Education values (2, '������ �� �������������')
--insert Education values (3, '������ �� �� �������������')

--create table Department (
--id int primary key identity (1,1),
--name nvarchar(20) 
--)

--insert Department values ('��������')
--insert Department values ('���������������')
--insert Department values ('��������')
--insert Department values ('�����������')
--insert Department values ('��������')

--create table Position (
--id int primary key identity (1,1),
--name nvarchar(20)
--)

--insert Position values ('��������� �������')
--insert Position values ('��������� ����')
--insert Position values ('������')
--insert Position values ('������� ������')
--insert Position values ('�������')
--insert Position values ('�������')
--insert Position values ('�����')
--insert Position values ('��������� ���')
--insert Position values ('��������')
--insert Position values ('���������������')

--create table Sick (
--id int primary key identity (1,1),
--name nvarchar(30) not null,
--position_id int foreign key references Position(id),
--education_id int foreign key references Education(id),
--department_id int foreign key references Department(id),
--salary money check (salary >= 40000),
--begin_date date not null, --check(begin_date <= getdate()),
--year_of_birth int not null, --check(year_of_birth > 1950 and year_of_birth < year(begin_date)),
--family_status nvarchar(20) check(family_status in ('� �����', '�� � �����')),
--amount_child int,
--hospital_begin date not null, --check(hospital_begin >= begin_date),
--hospital_end date not null check(hospital_end <= getdate()),
--check(begin_date <= getdate() and year_of_birth < year(begin_date) and 
--year_of_birth > 1950 and hospital_begin >= begin_date and hospital_end > hospital_begin)
--)

--insert Sick values ('����������', 1, 3, 2, 49999, '10.07.1981', '1980', '�� � �����', '2', '03.06.1982', '05.06.1982')
--insert Sick values ('�������', 9, 0, 5, 54999, '24.10.1990', '1971', '� �����', '3', '21.12.2001', '01.02.2002')
--insert Sick values ('�����', 10, 2, 4, 60000, '01.06.2000', '1989', '�� � �����', '1', '24.04.2010', '05.05.2010')
--insert Sick values ('���������', 2, 3, 1, 73299, '10.01.2012', '1990', '� �����', '1', '01.02.2012', '05.02.2012')
--insert Sick values ('��������', 3, 3, 3, 42399, '29.03.2015', '1990', '� �����', '1', '10.06.2015', '05.07.2015')
--insert Sick values ('�������', 4, 3, 1, 134499, '31.12.2014', '1988', '� �����', '3', '23.04.2017', '30.04.2017')
--insert Sick values ('�������', 5, 3, 2, 78999, '09.06.2017', '1999', '�� � �����', '0', '29.01.2018', '11.02.2018')
--insert Sick values ('���������', 6, 2, 3, 74000, '13.09.1999', '1975', '� �����', '0', '31.01.2000', '28.02.2000')
--insert Sick values ('��������', 7, 2, 4, 76899, '19.11.1997', '1970', '� �����', '4', '20.10.1999', '31.12.1999')
--insert Sick values ('������������', 8, 2, 5, 90000, '26.02.2002', '1982', '� �����', '3', '13.11.2002', '25.11.2002')
--insert Sick values ('���������', 2, 1, 5, 60000, '30.08.2016', '1996', '�� � �����', '0', '03.12.2016', '16.12.2016')
--insert Sick values ('���������', 1, 1, 4, 81500, '04.07.1993', '1966', '� �����', '5', '10.08.2004', '30.09.2004')
--insert Sick values ('��������', 3, 1, 3, 55000, '22.04.2004', '1985', '� �����', '4', '09.07.2016', '05.08.2016')
--insert Sick values ('���������', 4, 0, 2, 44000, '23.09.2010', '1991', '� �����', '2', '16.03.2014', '05.04.2014')
--insert Sick values ('������', 5, 0, 2, 100500, '18.01.2011', '1986', '� �����', '3', '03.12.2011', '05.12.2011')


-- � ������ � ���� �������� �������� � ��������� ������������ � ���� �����: 1, 2, 3
--alter table Department add info int
--alter table Department add check (info > 0 and info < 4); 

--update Department set info = 2 where name = '��������'
--update Department set info = 1 where name = '���������������'
--update Department set info = 3 where name = '��������'
--update Department set info = 1 where name = '�����������'
--update Department set info = 3 where name = '��������'

-- � ������������� �������� ���
--alter table Position add code int
--alter table Position add check (code > 100 and code < 120)

--update Position set code = 101 where name = '��������� �������'
--update Position set code = 102 where name = '��������� ����'
--update Position set code = 103 where name = '������'
--update Position set code = 104 where name = '������� ������'
--update Position set code = 105 where name = '�������'
--update Position set code = 106 where name = '�������'
--update Position set code = 107 where name = '�����'
--update Position set code = 108 where name = '��������� ���'
--update Position set code = 109 where name = '��������'
--update Position set code = 110 where name = '���������������'

-- �������� ����������� ��������
--alter table Sick add check (salary > 30000); 


-- ���������� � ���� ������ ������� ��� �������� ������ �� ����� ������������� � �����������, � ����� ���������� ������ �� �������� ����.

--create index H_begin on Sick(hospital_begin)
--create index H_end on Sick(hospital_end)

--alter table Department drop constrain PK__Departme__3213E83FDA66FC76
--create clustered index D_name on Department(name) 
--create unique index D_id on Department(id)



 
--- ���������� ���������� ��� �������� (���, ���������, �������� ������)
--create view emp as 
--select s.name, p.name Pos, d.name Dep
--from Sick s, Position p, Department d
--where s.position_id = p.id and s.department_id = d.id

--select * from emp

--- ���������� ���������� � ��� �������, ������� ���� �� ���������� � ��������� ���� ������ � ��������� �  ������� � ���� �����������
--create view woker_sick as
--select s.name, s.hospital_begin, s.hospital_end, datediff(day, s.hospital_begin, s.hospital_end) day_in_hospital
--from Sick s

--select * from woker_sick

--- ���������� ���������� � ���� ���������� � �������� ������� (���, �����)

--create view woker_sick2 as
--select *
--from Sick s
--where year(s.hospital_begin) = 2000 and month(s.hospital_begin) = 01

--select * from woker_sick2

--1)	��� �������� �������� �� ������ ������ � ������. � �������� ������� �������� ��������� ��� �������� � �������� ������, 
--		���� �� �����������. 
--create procedure Transfer 
--@name nvarchar(30), 
--@department nvarchar(20) 
--as
--update Sick set department_id = (select d.id from Department d
--where d.name = @department)
--where Sick.name = @name

--execute Transfer '����������', '��������'

--drop procedure Transfer



--2)	������� �������� �� ������� ����� ��� ����� ����������, �� � ������ ������ 20% � �������� 10% 
--		�� ������ �� ������� �����.


--create procedure Salary_calc @name nvarchar(30) as
--update 
--Sick set salary = s.salary * 0.8 + (s.salary / 100 * (10 * d.info))
--from Sick s, Department d
--where s.department_id = d.id and d.info > 1 and s.name = @name   

--execute Salary_calc'����������'
