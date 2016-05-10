----------------------------------------------------
-- Query: вывести всю информацию о сотрудниках
----------------------------------------------------

SELECT e.name, e.age, e.gender, e.address, e.phone, e.passport, p.position, p.salary, p.responsibility, p.requirements
FROM employees e
	JOIN positions p ON p.id = e.position_id; 

----------------------------------------------------
-- Query: вывести всю информацию по книжному каталогу
----------------------------------------------------

SELECT b.name, b.author, b.date_of_publishing, g.name, g.description, p.name, p.city, p.address
FROM books b
	JOIN publishing_house p ON p.id = b.publishing_house_id
	JOIN genres g ON g.id = b.genre_id;

----------------------------------------------------
-- Query: вывести список книг на руках
----------------------------------------------------

SELECT b.name, b.author, r.name, r.phone, r.address, i.date_of_issue
FROM readership r
	JOIN issued_books i ON i.readership_id = r.id
	JOIN books b ON b.id = i.book_id
	JOIN employees e ON e.id = i.employee_id
WHERE i.is_returned = false;