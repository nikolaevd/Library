----------------------------------------------------
-- Table: positions
----------------------------------------------------

CREATE TABLE positions(
	id integer NOT NULL,
	position varchar(32) NOT NULL,
	salary integer NOT NULL,
	responsibility varchar(64),
	requirements varchar(64),
	CONSTRAINT key_position PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );
ALTER TABLE positions OWNER TO postgres;

INSERT INTO positions (id, position, salary, responsibility, requirements) VALUES (0, 'Библиотекарь', 30000, 'Ведение учета имеющихся в наличии и выданных книг', 'Грамотная речь, хорошее зрение, прописка');

-- сделать 5 записей

----------------------------------------------------
-- Table: employees
----------------------------------------------------

CREATE TABLE employees(
	id integer NOT NULL,
	name varchar(32) NOT NULL,
	age integer,
	sex varchar(10),
	address varchar(64),
	phone varchar(16),
	passport varchar(32),
	position_id integer,
	CONSTRAINT key_employee PRIMARY KEY (id),
	CONSTRAINT key_position_id FOREIGN KEY (position_id)
		REFERENCES positions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );
ALTER TABLE employees OWNER TO postgres;
	
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (0, 'Петров Андрей Иванович', 40, 'мужчина', 'Москва, Партизанская улица, дом 3', '89261002002233', '4500 666333', 0);

-- сделать 10 записей
-- переопределить тип данных для поля phone



----------------------------------------------------
-- Table: publishing_house
----------------------------------------------------

CREATE TABLE publishing_house(
	id integer NOT NULL,
	name varchar(32) NOT NULL,
	city varchar(32),
	address varchar(64),
	CONSTRAINT key_publishing_house PRIMARY KEY (id) 
)
WITH ( OIDS=FALSE );
ALTER TABLE publishing_house OWNER TO postgres;

-- сделать 5 записей

----------------------------------------------------
-- Table: genres
----------------------------------------------------

CREATE TABLE genres(
	id integer NOT NULL,
	name varchar(32) NOT NULL,
	description varchar(64),
	CONSTRAINT key_gengre PRIMARY KEY(id)
)
WITH ( OIDS=FALSE );
ALTER TABLE genres OWNER TO postgres;

-- сделать 5 записей

----------------------------------------------------
-- Table: books
----------------------------------------------------

CREATE TABLE books(
	id integer NOT NULL,
	name varchar(32) NOT NULL,
	author varchar(32),
	publishing_house_id integer,
	date_of_publishing integer,
	genre_id integer,
	CONSTRAINT key_book PRIMARY KEY(id),
	CONSTRAINT key_publishing_house_id FOREIGN KEY(publishing_house_id)
		REFERENCES publishing_house(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT key_gengre_id FOREIGN KEY(genre_id)
		REFERENCES genres(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );
ALTER TABLE books OWNER TO postgres;

-- сделать 10 записей

----------------------------------------------------
-- Table: readership
----------------------------------------------------

CREATE TABLE readership(
	id integer NOT NULL,
	name varchar(64) NOT NULL,
	birthday varchar(16),
	sex varchar(10),
	address varchar(64),
	phone varchar(10),
	passport varchar(32),
	CONSTRAINT key_readership PRIMARY KEY(id)
)
WITH ( OIDS=FALSE );
ALTER TABLE readership OWNER TO postgres;

-- сделать 10 записей

----------------------------------------------------
-- Table: issued_books
----------------------------------------------------

CREATE TABLE issued_books(
	book_id integer NOT NULL,
	readership_id integer NOT NULL,
	date_of_issue varchar(16),
	is_returned boolean,
	employee_id integer,
	CONSTRAINT key_book_id FOREIGN KEY(book_id)
		REFERENCES books(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT key_readership_id FOREIGN KEY(readership_id)
		REFERENCES readership(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT key_employee_id FOREIGN KEY(employee_id)
		REFERENCES employees(id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );
ALTER TABLE issued_books OWNER TO postgres;

-- сделать 10 записей