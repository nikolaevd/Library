----------------------------------------------------
-- Filter: отображение сотрудников отдельных должностей 
----------------------------------------------------

SELECT e.name, e.age, e.gender, e.address, e.phone, e.passport, p.position, p.salary, p.responsibility, p.requirements
FROM employees e
	JOIN positions p ON p.id = e.position_id
WHERE p.position = 'Библиотекарь';

----------------------------------------------------
-- Filter: отображение книг отдельных издательств
----------------------------------------------------

SELECT b.name, b.author, b.date_of_publishing, g.name, g.description, p.name, p.city, p.address
FROM books b
	JOIN publishing_house p ON p.id = b.publishing_house_id
	JOIN genres g ON g.id = b.genre_id
WHERE p.name = 'Дедушка Олехник';

----------------------------------------------------
-- Filter: отображение книг отдельных авторов
----------------------------------------------------

SELECT b.name, b.author, b.date_of_publishing, g.name, g.description, p.name, p.city, p.address
FROM books b
	JOIN publishing_house p ON p.id = b.publishing_house_id
	JOIN genres g ON g.id = b.genre_id
WHERE b.author = 'Джованни Боккаччо';

----------------------------------------------------
-- Filter: отображение книг отдельных годов издания 
----------------------------------------------------

SELECT b.name, b.author, b.date_of_publishing, g.name, g.description, p.name, p.city, p.address
FROM books b
	JOIN publishing_house p ON p.id = b.publishing_house_id
	JOIN genres g ON g.id = b.genre_id
WHERE b.date_of_publishing > '2013-01-01';

----------------------------------------------------
-- Filter: отображение сданных и не сданных книг
----------------------------------------------------

SELECT b.name, b.author, r.name, r.phone, r.address, i.date_of_issue
FROM readership r
	JOIN issued_books i ON i.readership_id = r.id
	JOIN books b ON b.id = i.book_id
	JOIN employees e ON e.id = i.employee_id
WHERE i.is_returned = true;

----------------------------------------------------
-- Filter: отображение книг на руках отдельных читателей 
----------------------------------------------------

SELECT b.name, b.author, r.name, r.phone, r.address, i.date_of_issue
FROM readership r
	JOIN issued_books i ON i.readership_id = r.id
	JOIN books b ON b.id = i.book_id
	JOIN employees e ON e.id = i.employee_id
WHERE i.is_returned = false AND r.name = 'Серов Сергей Юрьевич';