SET search_path TO library;

--run this script for heroku
--heroku pg:psql --app dbone < /Users/niteshr/projects/step_library/insert.sql
--
\set pwd '\'':p'/book_detail.txt\''
COPY book_detail from :pwd delimiter '$';
\set pwd '\'':p'/user_detail.txt\''
COPY user_detail from :pwd delimiter '$';
\set pwd '\'':p'/book_copy.txt\''
COPY book_copy from :pwd delimiter '$';


insert into borrower (user_id,book_id,issue_date) values(21005,1,'2018-04-18');
insert into borrower (user_id,book_id,issue_date) values(21016,12,'2018-03-14');
insert into borrower (user_id,book_id,issue_date) values(21021,75,'2018-03-15');
insert into borrower (user_id,book_id,issue_date) values(21049,26,'2018-03-15');
insert into borrower (user_id,book_id,issue_date) values(21045,29,'2018-01-08');
insert into borrower (user_id,book_id,issue_date) values(21001,30,'2018-05-30');

insert into borrower (user_id,book_id,issue_date) values(21009,31,'2018-04-21');
insert into borrower (user_id,book_id,issue_date) values(21021,36,'2018-03-10');
insert into borrower (user_id,book_id,issue_date) values(21021,68,'2018-03-21');
insert into borrower (user_id,book_id,issue_date,return_date) values(21000,01,'2018-03-20','2018-04-10');
insert into borrower (user_id,book_id,issue_date,return_date) values(21024,47,'2018-02-1','2018-02-19');
insert into borrower (user_id,book_id,issue_date,return_date) values(21028,127,'2018-02-3','2018-02-8');
insert into borrower (user_id,book_id,issue_date,return_date) values(21002,408,'2018-04-1','2018-04-08');
insert into borrower (user_id,book_id,issue_date) values(21003,44,'2018-03-20');
insert into borrower (user_id,book_id,issue_date) values(21005,04,'2018-03-20');
insert into borrower (user_id,book_id,issue_date) values(21044,400,'2018-05-14');

insert into borrower (user_id,book_id,issue_date,return_date) values(21040,355,'2018-03-15','2018-04-15');
insert into borrower (user_id,book_id,issue_date) values(21025,212,'2018-03-20');
insert into borrower (user_id,book_id,issue_date) values(21025,57,'2018-03-20');

insert into borrower (user_id,book_id,issue_date) values(21035,430,'2018-04-20');
insert into borrower (user_id,book_id,issue_date) values(21035,483,'2018-04-23');
insert into borrower (user_id,book_id,issue_date) values(21036,358,'2018-04-13');
insert into borrower (user_id,book_id,issue_date) values(21028,20,'2018-03-01');
insert into borrower (user_id,book_id,issue_date,return_date) values(21027,49,'2018-02-07','2018-02-24');

insert into borrower (user_id,book_id,issue_date) values(21045,26,'2018-03-21');
