--create database Sick_list
--use Sick_list

--create table Education (
--id int not null primary key check (id < 4),
--name nvarchar(30) not null)

--insert Education values (0, 'среднее')
--insert Education values (1, 'среднее-специальное')
--insert Education values (2, 'высшее по специальности')
--insert Education values (3, 'высшее не по специальности')

--create table Department (
--id int primary key identity (1,1),
--name nvarchar(20) 
--)

--insert Department values ('токарный')
--insert Department values ('инсрументальный')
--insert Department values ('литейный')
--insert Department values ('формовочный')
--insert Department values ('молярный')

--create table Position (
--id int primary key identity (1,1),
--name nvarchar(20)
--)

--insert Position values ('начальник участка')
--insert Position values ('начальник цеха')
--insert Position values ('мастер')
--insert Position values ('старший мастер')
--insert Position values ('сборщик')
--insert Position values ('сварщик')
--insert Position values ('моляр')
--insert Position values ('инспектор ПТО')
--insert Position values ('наладчик')
--insert Position values ('инструменталист')

--create table Sick (
--id int primary key identity (1,1),
--name nvarchar(30) not null,
--position_id int foreign key references Position(id),
--education_id int foreign key references Education(id),
--department_id int foreign key references Department(id),
--salary money check (salary >= 40000),
--begin_date date not null, --check(begin_date <= getdate()),
--year_of_birth int not null, --check(year_of_birth > 1950 and year_of_birth < year(begin_date)),
--family_status nvarchar(20) check(family_status in ('в браке', 'не в браке')),
--amount_child int,
--hospital_begin date not null, --check(hospital_begin >= begin_date),
--hospital_end date not null check(hospital_end <= getdate()),
--check(begin_date <= getdate() and year_of_birth < year(begin_date) and 
--year_of_birth > 1950 and hospital_begin >= begin_date and hospital_end > hospital_begin)
--)

--insert Sick values ('Попенченко', 1, 3, 2, 49999, '10.07.1981', '1980', 'не в браке', '2', '03.06.1982', '05.06.1982')
--insert Sick values ('Лагутин', 9, 0, 5, 54999, '24.10.1990', '1971', 'в браке', '3', '21.12.2001', '01.02.2002')
--insert Sick values ('Агеев', 10, 2, 4, 60000, '01.06.2000', '1989', 'не в браке', '1', '24.04.2010', '05.05.2010')
--insert Sick values ('Степашкин', 2, 3, 1, 73299, '10.01.2012', '1990', 'в браке', '1', '01.02.2012', '05.02.2012')
--insert Sick values ('Высоцкий', 3, 3, 3, 42399, '29.03.2015', '1990', 'в браке', '1', '10.06.2015', '05.07.2015')
--insert Sick values ('Рыбаков', 4, 3, 1, 134499, '31.12.2014', '1988', 'в браке', '3', '23.04.2017', '30.04.2017')
--insert Sick values ('Лемешев', 5, 3, 2, 78999, '09.06.2017', '1999', 'не в браке', '0', '29.01.2018', '11.02.2018')
--insert Sick values ('Шановазов', 6, 2, 3, 74000, '13.09.1999', '1975', 'в браке', '0', '31.01.2000', '28.02.2000')
--insert Sick values ('Ружников', 7, 2, 4, 76899, '19.11.1997', '1970', 'в браке', '4', '20.10.1999', '31.12.1999')
--insert Sick values ('Мирошниченко', 8, 2, 5, 90000, '26.02.2002', '1982', 'в браке', '3', '13.11.2002', '25.11.2002')
--insert Sick values ('Арбачаков', 2, 1, 5, 60000, '30.08.2016', '1996', 'не в браке', '0', '03.12.2016', '16.12.2016')
--insert Sick values ('Конакбаев', 1, 1, 4, 81500, '04.07.1993', '1966', 'в браке', '5', '10.08.2004', '30.09.2004')
--insert Sick values ('Яновский', 3, 1, 3, 55000, '22.04.2004', '1985', 'в браке', '4', '09.07.2016', '05.08.2016')
--insert Sick values ('Енгибарян', 4, 0, 2, 44000, '23.09.2010', '1991', 'в браке', '2', '16.03.2014', '05.04.2014')
--insert Sick values ('Рачков', 5, 0, 2, 100500, '18.01.2011', '1986', 'в браке', '3', '03.12.2011', '05.12.2011')


-- в данные о цехе добавить сведения о вредности производства в виде числа: 1, 2, 3
--alter table Department add info int
--alter table Department add check (info > 0 and info < 4); 

--update Department set info = 2 where name = 'токарный'
--update Department set info = 1 where name = 'инсрументальный'
--update Department set info = 3 where name = 'литейный'
--update Department set info = 1 where name = 'формовочный'
--update Department set info = 3 where name = 'молярный'

-- в специальность добавить код
--alter table Position add code int
--alter table Position add check (code > 100 and code < 120)

--update Position set code = 101 where name = 'начальник участка'
--update Position set code = 102 where name = 'начальник цеха'
--update Position set code = 103 where name = 'мастер'
--update Position set code = 104 where name = 'старший мастер'
--update Position set code = 105 where name = 'сборщик'
--update Position set code = 106 where name = 'сварщик'
--update Position set code = 107 where name = 'моляр'
--update Position set code = 108 where name = 'инспектор ПТО'
--update Position set code = 109 where name = 'наладчик'
--update Position set code = 110 where name = 'инструменталист'

-- изменить минимальную зарплату
--alter table Sick add check (salary > 30000); 


-- Определить в базе данных индексы для быстрого поиска по датам выздоровления и заболевания, а также кластерный индекс по названию цеха.

--create index H_begin on Sick(hospital_begin)
--create index H_end on Sick(hospital_end)

--alter table Department drop constrain PK__Departme__3213E83FDA66FC76
--create clustered index D_name on Department(name) 
--create unique index D_id on Department(id)



 
--- содержащее информацию про рабочего (имя, должность, название отдела)
--create view emp as 
--select s.name, p.name Pos, d.name Dep
--from Sick s, Position p, Department d
--where s.position_id = p.id and s.department_id = d.id

--select * from emp

--- содержащее информацию о тех рабочих, которые были на больничном с указанием даты начала и окончания и  периода в днях заболевания
--create view woker_sick as
--select s.name, s.hospital_begin, s.hospital_end, datediff(day, s.hospital_begin, s.hospital_end) day_in_hospital
--from Sick s

--select * from woker_sick

--- содержащее информацию о всех заболевших в отчетном периоде (год, месяц)

--create view woker_sick2 as
--select *
--from Sick s
--where year(s.hospital_begin) = 2000 and month(s.hospital_begin) = 01

--select * from woker_sick2

--1)	для перевода рабочего из одного отдела в другой. В качестве входных значений принимает ФИО рабочего и название отдела, 
--		куда он переводится. 
--create procedure Transfer 
--@name nvarchar(30), 
--@department nvarchar(20) 
--as
--update Sick set department_id = (select d.id from Department d
--where d.name = @department)
--where Sick.name = @name

--execute Transfer 'Попенченко', 'молярный'

--drop procedure Transfer



--2)	расчета зарплаты за текущий месяц без учета больничных, но с учетом налога 20% и надбавки 10% 
--		за работу во вредных цехах.


--create procedure Salary_calc @name nvarchar(30) as
--update 
--Sick set salary = s.salary * 0.8 + (s.salary / 100 * (10 * d.info))
--from Sick s, Department d
--where s.department_id = d.id and d.info > 1 and s.name = @name   

--execute Salary_calc'Попенченко'
