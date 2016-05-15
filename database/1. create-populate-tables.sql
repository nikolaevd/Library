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
	gender varchar(10),
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
	
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (0, 'Петров Андрей Иванович', 40, 'мужчина', 'Москва, Партизанская улица, дом 3', '89262002233', '4500 666333', 0);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (1, 'Кревенко Семен Валентинович', 29, 'мужчина', 'Москва, Проспект Буденова, дом 31', '89031235434', '4501 662333', 0);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (2, 'Горячева Вероника Вячеславовна', 22, 'женщина', 'Москва, Ленинградский проспект, дом 22', '89064435434', '4601 112333', 0);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (3, 'Суворова Антонина Александровна', 30, 'женщина', 'Москва, Дмитровское шоссе, дом 54', '89012235134', '4301 942033', 0);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (4, 'Минасян Арсен Ашотович', 56, 'мужчина', 'Москва, Бутовский проезд, дом 4', '89992235134', '4001 941133', 1);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (5, 'Тихонова Галина Михайловна', 59, 'женщина', 'Москва, Краснобогатырская, дом 19', '89012005111', '4300 900031', 2);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (6, 'Алексеев Сергей Эдуардович', 38, 'мужчина', 'Москва, Тверскя, дом 7', '89151003141', '4300 200321', 3);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (7, 'Потапенко Тарас Васильевич', 23, 'мужчина', 'Москва, Батурина, дом 94', '89152233555', '4310 655321', 3);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (8, 'Путилова Татьяна Викторовна', 33, 'женщина', 'Москва, Карла Маркса, дом 1', '89252233155', '4451 635331', 4);
INSERT INTO employees (id, name, age, gender, address, phone, passport, position_id) VALUES (9, 'Мамбеков Айгерим Сергеевич', 63, 'мужчина', 'Москва, Семеновская, дом 46', '89151100231', '4111 150321', 4);

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

INSERT INTO publishing_house(id, name, city, address) VALUES (0, 'Эксмо', 'Видное', 'Белокаменное шоссе, дом 1');
INSERT INTO publishing_house(id, name, city, address) VALUES (1, 'Вильямс', 'Москва', 'Тверская, дом 13');
INSERT INTO publishing_house(id, name, city, address) VALUES (2, 'Фазенда', 'Степаново', 'Советская, дом 3');
INSERT INTO publishing_house(id, name, city, address) VALUES (3, 'Дедушка Олехник', 'Орехово-Зуево', 'Пионерская, дом 6');
INSERT INTO publishing_house(id, name, city, address) VALUES (4, 'Питер', 'Санкт-Петербург', 'Невский пр-т, до 22');

----------------------------------------------------
-- Table: genres
----------------------------------------------------

CREATE TABLE genres(
	id integer NOT NULL,
	name varchar(32) NOT NULL,
	description varchar(255),
	CONSTRAINT key_gengre PRIMARY KEY(id)
)
WITH ( OIDS=FALSE );
ALTER TABLE genres OWNER TO postgres;

INSERT INTO genres(id, name, description) VALUES (0, 'Античная литература', 'Литература древних греков и римлян, состоящая из двух национальных литератур: древнегреческой и древнеримской.');
INSERT INTO genres(id, name, description) VALUES (1, 'Литература XIX века', 'Литература 19 века развивалась в двух основных направлениях, это литература романтизма и литература реализма.');
INSERT INTO genres(id, name, description) VALUES (2, 'Литература Средневековья', 'Зарождение и развитие литературы Средневековья определяется тремя основными факторами: традициями народного творчества, культурным влиянием античного мира и христианством.');
INSERT INTO genres(id, name, description) VALUES (3, 'Литература Просвещения', 'Литература эпохи Просвещения характеризуется поворотом к рационализму. Для этого периода характерна вера в прогресс и всемогущество человеческого разума.');
INSERT INTO genres(id, name, description) VALUES (4, 'Постмодернизм', 'Постмодернизм постепенно пришёл на смену модернизму в середине 20 века.');

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

INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (0, 'Декамерон', 'Джованни Боккаччо', 3, '2013-01-08', 3);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (1, 'Дон Кихот', 'Мигель де Сервантес Сааведра', 3, '2014-07-01', 3);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (2, 'Приключения Тома Сойера', 'Марк Твен', 1, '2010-01-20', 4);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (3, 'Одиссея', 'Гомер', 0, '2011-02-23', 0);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (4, 'Илиада', 'Гомер', 0, '2009-09-15', 0);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (5, 'Айвенго', 'Вальтер Скотт', 1, '2010-06-15', 3);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (6, 'Беовульф', 'Неизвестен', 2, '2015-03-10', 2);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (7, 'Generation П', 'Виктор Пелевин', 4, '2013-01-08', 4);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (8, 'Сон в летнюю ночь', 'Уильям Шекспир', 3, '2013-01-08', 3);
INSERT INTO books (id, name, author, publishing_house_id, date_of_publishing, genre_id) VALUES (9, 'Гамлет', 'Уильям Шекспир', 3, '2010-02-13', 3);

----------------------------------------------------
-- Table: readership
----------------------------------------------------

CREATE TABLE readership(
	id integer NOT NULL,
	name varchar(64) NOT NULL,
	birthday date,
	gender varchar(10),
	address varchar(64),
	phone bigint,
	passport varchar(32),
	CONSTRAINT key_readership PRIMARY KEY (id)
)
WITH ( OIDS=FALSE );
ALTER TABLE readership OWNER TO postgres;

INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (0, 'Серов Сергей Юрьевич', '1993-04-15', 'мужской', 'г. Москва, ул. Советская, д. 3', 89163033300, '4512 111222');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (1, 'Косенко Александр Евгеньевич', '1983-01-12', 'мужской', 'г. Москва, ул. Семеновская, д. 7', 89162330001, '0512 444222');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (2, 'Воробьева Анна Михайловна', '1995-08-03', 'женский', 'г. Москва, ул. Барклая, д. 77', 89065053300, '4510 111000');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (3, 'Маркина Наталья Денисовна', '1998-01-27', 'женский', 'г. Одинцово, ул. 1-го мая, д. 13', 89163033555, '4002 111222');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (4, 'Тучкова Алена Вячеславовна', '1987-12-25', 'женский', 'г. Зеленоград, ул. Бирюкова, д. 3', 89163033999, '4012 999222');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (5, 'Мерешко Сергей Анатольевич', '1990-10-20', 'мужской', 'г. Москва, ул. Савеловская, д. 20', 89163099900, '4512 777222');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (6, 'Кривенко Олег Максимович', '1981-09-09', 'мужской', 'г. Москва, ул. Партизанская, д. 30', 89161313300, '4012 555212');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (7, 'Лебедева Валерия Викторовна', '1996-11-30', 'женский', 'г. Мытищи, ул. Минина и Пожарского, д. 93', 89161002070, '4092 999888');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (8, 'Сукач Кирилл Олегович', '1991-08-03', 'мужской', 'г. Москва, ул. Барклая, д. 33', 89169993355, '4555 000222');
INSERT INTO readership (id, name, birthday, gender, address, phone, passport) VALUES (9, 'Осипов Антон Владимирович', '1982-07-07', 'мужской', 'г. Москва, ул. Танкистов, д. 17', 89169093377, '4512 171888');

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

INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (0, 0, '2016-03-21', false, 0);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (2, 0, '2016-04-01', false, 0);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (3, 1, '2015-09-10', true, 1);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (4, 1, '2016-01-10', false, 2);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (5, 2, '2016-02-10', true, 3);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (3, 3, '2016-03-21', false, 0);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (6, 5, '2016-01-13', false, 2);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (7, 6, '2015-09-30', false, 3);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (8, 8, '2015-12-30', false, 1);
INSERT INTO issued_books (book_id, readership_id, date_of_issue, is_returned, employee_id) VALUES (9, 9, '2016-02-28', true, 4);