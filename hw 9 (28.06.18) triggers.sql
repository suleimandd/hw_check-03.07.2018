--create database Library
--use Library

--create table Authors (
--id int primary key identity(1,1),
--name nvarchar(30),)

--insert Authors values ('Daria Hines')
--insert Authors values ('Rigel Mcclain')
--insert Authors values ('Gail Mccullough')
--insert Authors values ('Zeus Pope')
--insert Authors values ('Tamara Nixon')
--insert Authors values ('Susan Rosa')
--insert Authors values ('Frances Joseph')
--insert Authors values ('Xyla Nunez')
--insert Authors values ('Nathaniel Callahan')
--insert Authors values ('Montana Diaz')
--insert Authors values ('Norman Paul')
--insert Authors values ('Carter Harrell')
--insert Authors values ('Keegan Randall')
--insert Authors values ('Raphael Simpson')

--create table Category (
--id int primary key identity(1,1),
--name nvarchar(30))

--insert Category values ('3D Studio')
--insert Category values ('Access 2000')
--insert Category values ('FrontPage')
--insert Category values ('FreeHand')
--insert Category values ('FoxPro')
--insert Category values ('Access 97')
--insert Category values ('ArchiCAD')
--insert Category values ('AutoCAD')
--insert Category values ('BackOffice, Exchange Server')
--insert Category values ('Borland C++ Builder')
--insert Category values ('C&C++')
--insert Category values ('CGI, Perl')
--insert Category values ('CorelDraw')
--insert Category values ('Assembler')

--create table Reader (
--id int primary key identity(1,1),
--fname nvarchar(50),
--quantity_of_books int)

--insert Reader values ('Jocelyn Hayes', 0)
--insert Reader values ('Yoshio Parrish', 0)
--insert Reader values ('Graham Russell', 0)
--insert Reader values ('Kelly Salas', 0)
--insert Reader values ('Jermaine Munoz', 0)
--insert Reader values ('Colton Mendez', 0)
--insert Reader values ('Isadora Ratliff', 0)
--insert Reader values ('Lareina Solomon', 0)
--insert Reader values ('Ocean Hull', 0)
--insert Reader values ('Phelan Serrano', 0)
--insert Reader values ('Xanthus York', 0)

--create table Books (
--id int primary key identity(1,1),
--name nvarchar(50),
--id_author int foreign key references Authors(id),
--id_category int foreign key references Category(id),
--quantity int)

--insert Books values ('the Giving three', 2, 7, 12)
--insert Books values ('The book Thief', 11, 14, 3)
--insert Books values ('Where the Sidewalk Ends', 9, 1, 21)
--insert Books values ('Winnie the Pooh', 3, 14, 2)
--insert Books values ('The cat in the Hat', 5, 5, 7)
--insert Books values ('The color Purple', 14, 3, 1)
--insert Books values ('Of Mice and Men', 10, 4, 2)
--insert Books values ('The Grapes of Wrath', 12, 6, 9)
--insert Books values ('the Diary of a Young', 8, 4, 2)
--insert Books values ('The Catcher in the Rye', 6, 1, 12)
--insert Books values ('Hamlet', 4, 13, 5)
--insert Books values ('Macbeth', 1, 2, 1)
--insert Books values ('Night', 5, 10, 6)
--insert Books values ('Twinlight', 7, 9, 3)
--insert Books values ('Flowers for Algernon', 9, 5, 3)
--insert Books values ('Romeo and Juliet', 12, 3, 7)
--insert Books values ('The Old Man and the Sea', 13, 7, 2)
--insert Books values ('Lord of the Flies', 7, 3, 4)
--insert Books values ('The Handmaids Tale', 10, 3, 3)
--insert Books values ('The Adventures of Huckleberry Finn', 3, 11, 4)
--insert Books values ('Fahreiheit 451', 14, 1, 2)
--insert Books values ('Life of Pi', 9, 11, 5)
--insert Books values ('Alices Adventures in Wonderland', 2, 10, 2)
--insert Books values ('The time Travelers wife', 8, 4, 1)
--insert Books values ('The stranger', 6, 2, 13)
--insert Books values ('The Alchemist', 13, 12, 1)
--insert Books values ('The scarface', 5, 2, 1)

--create table Issued_books (
--id int primary key identity(1,1),
--id_book int foreign key references Books(id),
--id_reader int foreign key references Reader(id))

--1.	„тобы при вз€тии определенной книги, ее кол-во уменьшалось на 1. 
--3.	„тобы нельз€ было выдать книгу, которой уже нет в библиотеке (по кол-ву). 
--4.	„тобы нельз€ было выдать более трех книг одному студенту. 

--create trigger Take_book 
--on Issued_books
--for insert 
--as 
--declare @Take_book_id int, @Take_reader_id int, @Quantuty_from_reader int, @Quantity_from_lib int
--select @Take_book_id = id_book, @Take_reader_id = id_reader from inserted
--select @Quantuty_from_reader = quantity_of_books from dbo.Reader where Reader.id = @Take_reader_id
--select @Quantity_from_lib = quantity from dbo.Books where Books.id = @Take_book_id
--if (@Quantity_from_lib > 0) begin 
--if (@Quantuty_from_reader < 3) begin 
--UPDATE dbo.Books set quantity = quantity - 1 where Books.id = @Take_book_id
--update dbo.Reader set quantity_of_books = quantity_of_books + 1 where Reader.id = @Take_reader_id
--end 
--else begin 
--raiserror ('Ѕольше 3 книг не выдаетс€!',0,1)
--end
--end
--else begin
--raiserror ('¬ насто€щий момент данна€ книга отсутствует!',0,1)
--end

--insert dbo.Issued_books values (6, 2)
--select * from Reader

--create table Returned_books (
--id int primary key identity(1,1),
--id_book int foreign key references Books(id),
--id_reader int foreign key references Reader(id))

--2.	„тобы при возврате определенной книги, ее кол-во увеличивалось на 1. 
--create trigger Return_book
--on Returned_books
--for insert as
--declare @Return_book_id int, @Return_reader_id int, @Quantity_of_reader int
--declare @book_1 int, @book_2 int, @book_3 int
--select @Return_book_id = id_book, @Return_reader_id = id_reader from inserted
--select @Quantity_of_reader = quantity_of_books from dbo.Reader where Reader.id = @Return_reader_id
--if (@Quantity_of_reader > 0) begin
--	select @book_1 = id_book from dbo.Issued_books where Issued_books.id_reader = @Return_reader_id
--	select @book_2 = id_book from dbo.Issued_books where Issued_books.id_reader = @Return_reader_id 
--	and Issued_books.id_book <> @book_1
--	select @book_3 = id_book from dbo.Issued_books where Issued_books.id_reader = @Return_reader_id 
--	and Issued_books.id_book <> @book_1 and Issued_books.id_book <> @book_2
--	if (@Return_book_id = @book_1) begin 
--		delete from dbo.Issued_books where Issued_books.id_book = @Return_book_id and Issued_books.id_reader = @Return_reader_id
--		update dbo.Books set quantity = quantity + 1 where Books.id = @Return_book_id
--		update dbo.Reader set quantity_of_books = quantity_of_books - 1 where Reader.id = @Return_reader_id
--	end
--	else if (@Return_book_id = @book_2) begin 
--		delete from dbo.Issued_books where Issued_books.id_book = @Return_book_id and Issued_books.id_reader = @Return_reader_id
--		update dbo.Books set quantity = quantity + 1 where Books.id = @Return_book_id
--		update dbo.Reader set quantity_of_books = quantity_of_books - 1 where Reader.id = @Return_reader_id
--	end
--	else if (@Return_book_id = @book_3) begin 
--		delete from dbo.Issued_books where Issued_books.id_book = @Return_book_id and Issued_books.id_reader = @Return_reader_id
--		update dbo.Books set quantity = quantity + 1 where Books.id = @Return_book_id
--		update dbo.Reader set quantity_of_books = quantity_of_books - 1 where Reader.id = @Return_reader_id
--	end
--	else begin
--		raiserror ('«а данным читателем указанна€ книга не зарегистрирована!', 0,1)
--	end
--end
--else begin 
--	raiserror ('«а указанным читателем книг не зарегистрировано!', 0, 1)
--end

--drop trigger Return_book
--insert dbo.Issued_books values (1, 1)
--insert dbo.Returned_books values (1, 1)
--select * from Books
--select * from Reader
--select * from Issued_books
--select * from Returned_books
--update dbo.Reader set Reader.quantity_of_books = 0 where id = 1


----INCORRECT
----create trigger Return_book
----on Issued_books
----for delete as
----declare @Return_book_id int, @Return_reader_id int, @Quantity_of_reader int
----declare @book_1 int = 0, @book_2 int = 0, @book_3 int = 0
----select @Return_book_id = id_book, @Return_reader_id = id_reader from deleted
----select @Quantity_of_reader = quantity_of_books from dbo.Reader where Reader.id = @Return_reader_id
----if (@Quantity_of_reader > 0) begin
----	select @book_1 = id_book from dbo.Issued_books where Issued_books.id_reader = @Return_reader_id
----	select @book_2 = id_book from dbo.Issued_books where Issued_books.id_reader = @Return_reader_id 
----	and Issued_books.id_book <> @book_1
----	select @book_3 = id_book from dbo.Issued_books where Issued_books.id_reader = @Return_reader_id 
----	and Issued_books.id_book <> @book_1 and Issued_books.id_book <> @book_2
----	if (@Return_book_id = @book_1) begin 
----		--delete from dbo.Issued_books where Issued_books.id_book = @Return_book_id and Issued_books.id_reader = @Return_reader_id
----		update dbo.Books set quantity = quantity + 1 where Books.id = @Return_book_id
----		update dbo.Reader set quantity_of_books = quantity_of_books - 1 where Reader.id = @Return_reader_id
----	end
----	else if (@Return_book_id = @book_2) begin 
----		--delete from dbo.Issued_books where Issued_books.id_book = @Return_book_id and Issued_books.id_reader = @Return_reader_id
----		update dbo.Books set quantity = quantity + 1 where Books.id = @Return_book_id
----		update dbo.Reader set quantity_of_books = quantity_of_books - 1 where Reader.id = @Return_reader_id
----	end
----	else if (@Return_book_id = @book_3) begin 
----		--delete from dbo.Issued_books where Issued_books.id_book = @Return_book_id and Issued_books.id_reader = @Return_reader_id
----		update dbo.Books set quantity = quantity + 1 where Books.id = @Return_book_id
----		update dbo.Reader set quantity_of_books = quantity_of_books - 1 where Reader.id = @Return_reader_id
----	end
----	else begin
----		raiserror ('«а данным читателем указанна€ книга не зарегистрирована!', 0,1)
----	end
----end
----else begin 
----	raiserror ('«а указанным читателем книг не зарегистрировано!', 0, 1) 
----end

----drop trigger Return_book
----insert dbo.Issued_books values (1, 1)
----delete from dbo.Issued_books where id_reader = 2 and id_book = 1
----select * from Books
----select * from Reader
----select * from Issued_books
----update dbo.Reader set Reader.quantity_of_books = 0 where id = 2


--5.	„тобы при удалении книги, данные о ней копировались в таблицу ”даленные. 
--CREATE table Deleted_books (
--deleted_id int,
--deleted_name nvarchar(50),
--deleted_id_author int,
--deleted_id_category int,
--deleted_quantity int)

--create trigger Deleted on Books
--for delete as
--declare @id int, @name nvarchar(50), @id_author int, @id_category int, @quantity int
--select @id = id, @name = name, @id_author = id_author, @id_category = id_category, @quantity = quantity from deleted
--insert Deleted_books values (@id, @name, @id_author, @id_category, @quantity)


--6.	≈сли книга добавл€етс€ в базу, она должна быть удалена из таблицы ”даленные.

--create trigger Return_from_deleted 
--on Deleted_books
--for delete as
--declare @name nvarchar(50), @id_author int, @id_category int, @quantity int
--select @name = deleted_name, @id_author = deleted_id_author, @id_category = deleted_id_category, @quantity = deleted_quantity from deleted
--insert Books values (@name, @id_author, @id_category, @quantity)

--drop table Deleted_books 
--select * from Deleted_books
--select * from Books 
--delete from Books where Books.id = 28
--delete from Deleted_books where deleted_id = 28
--update Books set name = 'The book Thief', id_author = 11, id_category = 14, quantity = 3 where Book.id = 2
--insert Books values ('The book Thief', 11, 14, 3)



