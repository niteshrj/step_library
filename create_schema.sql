-- create schema library

CREATE SCHEMA "library";

SET search_path TO library;


-- create users table with id,first_name,last_name,email,phone_no

CREATE TABLE user_detail(
	user_id integer,
	first_name varchar(200),
	last_name varchar(200),
	email varchar(500),
	phone_no varchar(13)
);


SELECT * FROM user_detail;
-- Primary key

ALTER TABLE user_detail
ADD CONSTRAINT  user_id_pk PRIMARY KEY (user_id);

-- other column CONSTRAINTs

ALTER TABLE user_detail
ALTER COLUMN first_name SET NOT NULL;


ALTER TABLE user_detail
ALTER COLUMN last_name SET NOT NULL;

ALTER TABLE user_detail
ALTER COLUMN email SET NOT NULL;


-- creating book_detail table with id,first_name,last_name,email,phone_no

create table book_detail (
	id INT,
	isbn VARCHAR(20),
	title VARCHAR(50),
	author_name VARCHAR(50),
	publisher VARCHAR(50)
);

SELECT * FROM book_detail;
-- Primary key

ALTER TABLE book_detail
ADD CONSTRAINT  ISBN_pk PRIMARY KEY (ISBN);

-- other column CONSTRAINTs

ALTER TABLE book_detail
ALTER COLUMN title SET NOT NULL;



-- book copies

CREATE TABLE book_copy(
  id serial,
  ISBN varchar(20),
  availablity boolean
);

-- Foreign key

ALTER TABLE book_copy
ADD CONSTRAINT fk_ISBN
FOREIGN KEY (ISBN)
REFERENCES book_detail(ISBN);

--  Primary key

ALTER TABLE book_copy
ADD CONSTRAINT  id_pk PRIMARY KEY (id);

-- add another CONSTRAINTs


ALTER TABLE book_copy
ALTER COLUMN availablity SET NOT NULL;


-- creating borrower table for admin

CREATE TABLE borrower(
  id  serial ,
  user_id integer,
  book_id integer,
  issue_date date,
  return_date date
);

-- Foreign key for user

ALTER TABLE borrower
ADD CONSTRAINT fk_user_id
FOREIGN KEY (user_id)
REFERENCES user_detail(user_id);

-- Foreign key for book

ALTER TABLE borrower
ADD CONSTRAINT fk_book_id
FOREIGN KEY (book_id)
REFERENCES book_copy(id);

-- add other CONSTRAINTs

ALTER TABLE borrower
ALTER COLUMN issue_date SET NOT NULL;

-- add  check constraints(return date should be less than issue date)
ALTER TABLE borrower
ADD CONSTRAINT valid_return_date CHECK (return_date>=issue_date);

-- add id as primary key
ALTER TABLE borrower add primary key(id);
