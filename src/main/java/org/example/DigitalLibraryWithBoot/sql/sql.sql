Drop table Person;
create table Person
(
    id          int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    full_name    varchar(150) NOT NULL UNIQUE,
    year_of_birth int          NOT NULL
);
INSERT INTO Person (full_name, year_of_birth) VALUES ('Иванов Иван Иванович', 1970);
INSERT INTO Person (full_name, year_of_birth) VALUES ('Петров Петр Петрович', 1960);
INSERT INTO Person (full_name, year_of_birth) VALUES ('Алексеев Алексей Алексеевич', 1989);
INSERT INTO Person (full_name, year_of_birth) VALUES ('Петров Владимир Владимирович', 1985);

select * from Person;

Drop table Book;
create table Book
(
    id int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    title varchar(150) NOT NULL,
    author varchar(150) NOT NULL,
    year int NOT NULL,
    person_id int REFERENCES Person(id) ON DELETE SET NULL,
    return_date TIMESTAMP
);

INSERT INTO Book (title, author, year, person_id) VALUES ('Над пропастью во ржи','Джером Сэлинджер',1951, 1);
INSERT INTO Book (title, author, year,person_id) VALUES (' День опричника','Владимир Сорокин',2006,2);
INSERT INTO Book (title, author, year,person_id) VALUES ('Тайные виды на гору Фудзи','Владимир Пелевин',2018,3);
INSERT INTO Book (title, author, year,person_id) VALUES ( 'Философия Java',' Брюс Эккель',2018,1);

UPDATE Book SET return_date='2022-07-22 08:00:00' WHERE id=1;

select * from Book;

