----------------------------------------------------
-- Table: positions
----------------------------------------------------

CREATE TABLE positions(
	id integer NOT NULL,
	position varchar(32) NOT NULL,
	salary integer,
	responsibility varchar(128),
	requirements varchar(64),
	CONSTRAINT key_position PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );
ALTER TABLE positions OWNER TO postgres;

INSERT INTO positions (id, position, salary, responsibility, requirements) VALUES (0, 'Библиотекарь', 30000, 'Ведение учета имеющихся в наличии и выданных книг', 'Грамотная речь, хорошее зрение, прописка');
INSERT INTO positions (id, position, salary, responsibility, requirements) VALUES (1, 'Охранник', 40000, 'Безопасность', 'Гражданство РФ, опыт работы в охране от 2 лет');
INSERT INTO positions (id, position, salary, responsibility, requirements) VALUES (2, 'Уборщица', 20000, 'Поддержание чистоты', 'Гражданство РФ, опыт работы необязателен');
INSERT INTO positions (id, position, salary, responsibility, requirements) VALUES (3, 'Архивариус', 30000, 'Формирование, оформление, регистрация дел Архива', 'Высшее или среднее образование. Опыт работы в архиве желателен');
INSERT INTO positions (id, position, salary, responsibility, requirements) VALUES (4, 'Делопроизводитель', 20000, 'Прием и регистрация входящей корреспонденции, отправка исполненной документации по адресам', 'Опыт работы с документами и на аналогичной должности от 3 лет');

----------------------------------------------------
-- Table: employees
----------------------------------------------------

CREATE TABLE employees(
	id integer NOT NULL,
	name varchar(32) NOT NULL,
	age integer,
	sex varchar(10),
	address varchar(64),
	phone bigint,
	passport varchar(32),
	position_id integer,
	CONSTRAINT key_employee PRIMARY KEY (id),
	CONSTRAINT key_position_id FOREIGN KEY (position_id)
		REFERENCES positions (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );
ALTER TABLE employees OWNER TO postgres;
	
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (0, 'Петров Андрей Иванович', 40, 'мужчина', 'Москва, Партизанская улица, дом 3', '89261002002233', '4500 666333', 0);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (1, 'Кревенко Семен Валентинович', 29, 'мужчина', 'Москва, Проспект Буденова, дом 31', '89031235434', '4501 662333', 0);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (2, 'Горячева Вероника Вячеславовна', 22, 'женщина', 'Москва, Ленинградский проспект, дом 22', '89064435434', '4601 112333', 0);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (3, 'Суворова Антонина Александровна', 30, 'женщина', 'Москва, Дмитровское шоссе, дом 54', '89012235134', '4301 942033', 0);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (4, 'Минасян Арсен Ашотович', 56, 'мужчина', 'Москва, Бутовский проезд, дом 4', '89992235134', '4001 941133', 1);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (5, 'Тихонова Галина Михайловна', 59, 'женщина', 'Москва, Краснобогатырская, дом 19', '89012005111', '4300 900031', 2);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (6, 'Алексеев Сергей Эдуардович', 38, 'мужчина', 'Москва, Тверскя, дом 7', '89151003141', '4300 200321', 3);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (7, 'Потапенко Тарас Васильевчи', 23, 'мужчина', 'Москва, Батурина, дом 94', '89152233555', '4310 655321', 3);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (8, 'Путилова Татьяна Викторовна', 33, 'женщина', 'Москва, Карла Маркса, дом 1', '89252233155', '4451 635331', 4);
INSERT INTO employees (id, name, age, sex, address, phone, passport, position_id) VALUES (9, 'Мамбеков Айгерим Сергеевич', 63, 'мужчина', 'Москва, Семеновская, дом 46', '89151100231', '4111 150321', 4);

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
	date_of_publishing date,
	genre_id integer,
	CONSTRAINT key_book PRIMARY KEY (id),
	CONSTRAINT key_publishing_house_id FOREIGN KEY (publishing_house_id)
		REFERENCES publishing_house (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT key_gengre_id FOREIGN KEY (genre_id)
		REFERENCES genres (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
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
	birthday date,
	sex varchar(10),
	address varchar(64),
	phone bigint,
	passport varchar(32),
	CONSTRAINT key_readership PRIMARY KEY (id)
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
	date_of_issue date,
	is_returned boolean,
	employee_id integer,
	CONSTRAINT key_book_id FOREIGN KEY (book_id)
		REFERENCES books (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT key_readership_id FOREIGN KEY (readership_id)
		REFERENCES readership (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT key_employee_id FOREIGN KEY (employee_id)
		REFERENCES employees (id) MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH ( OIDS=FALSE );
ALTER TABLE issued_books OWNER TO postgres;

-- сделать 10 записей