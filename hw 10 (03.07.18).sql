--create database Bookstore
--use Bookstore

--create table Press (
--id int primary key identity(1,1),
--name nvarchar(30),
--pressrun int check (pressrun > 1000)
--)

--insert Press values ('astsna_kitab', 10000)


--create table Author (
--id int primary key identity(1,1),
--fname nvarchar(30),
--lname nvarchar(30),
--date_of_birth date check (date_of_birth < getdate())
--)

--create table Books (
--id int primary key identity(1,1),
--name nvarchar(30),
--author_id int foreign key references Author(id),
--press_id int foreign key references Press(id),
--price money check (price > 100)
--)

--create table Shopper (
--id int primary key identity(1,1),
--name nvarchar(30),
--book_id int foreign key references books(id),
--gender nvarchar(1) check (gender in ('М', 'Ж'))
--)


--create table Selling (
--id int primary key identity(1,1),
--shopper_id int foreign key references Shopper(id),
--payment_date date ,
--issue_date date check (issue_date <= getdate()),
--check (payment_date <= issue_date)
--)

--Создать составной некластерный индекс для столбцов имя_автора и фамилия_автора таблицы Авторы базы данных. 

--create index F_L_name on Author(fname, lname)
--Создать уникальный кластерный индекс для столбца ID таблицы Авторы базы данных с расположением его на первичной группе файлов.
--alter table Books drop FK__Books__author_id__1ED998B2
--alter table Author drop PK__Author__3213E83FE061DF44
--create unique clustered index ind_Authors_id on Author(id)

--select * from Books
--where id = 2

--select b.name, sum (price) price
--from Books b
--group by b.name
--select b.id, b.name, a.fname, a.lname from Books b
--join Author a on b.author_id = a.id

--select * from Books b
--left join Author a on b.author_id = a.id


--select name from Books
--union 
--select fname from Author 

--select * from Books 
--order by name

--select name
--from Books
--where press_id = (select id from Press where name like '%astana_kitab%')

--update Press set name = 'astana_kitab' where id = 1

--alter table Books add check (price >90)
--insert Press values ('ABV', 20000)
--delete from Press where name = 'ABV'
--create view A as 
--select b.name, a.fname, a.lname
--from Books b, Author a
--where b.author_id = a.id

--select * from A
