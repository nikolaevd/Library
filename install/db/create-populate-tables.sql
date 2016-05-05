----------------------------------------------------
-- Table: employees
----------------------------------------------------

CREATE TABLE employees(
	id integer NOT NULL,
	name varchar(32) NOT NULL,
	age integer,
	sex varchar(10),
	address varchar(64),
	phone varchar(11),
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
ALTER TABLE employees OWNER TO postgres;

INSERT INTO positions (id, position, salary, responsibility, requirements) VALUES (0, 'Библиотекарь', 30000, 'Ведение учета имеющихся в наличии и выданных книг', 'Грамотная речь, хорошее зрение, прописка');
-- сделать 5 записей

----------------------------------------------------
-- Table: publishing_house
----------------------------------------------------


----------------------------------------------------
-- Table: genres
----------------------------------------------------


----------------------------------------------------
-- Table: books
----------------------------------------------------


----------------------------------------------------
-- Table: readership
----------------------------------------------------


----------------------------------------------------
-- Table: issued_books
----------------------------------------------------
