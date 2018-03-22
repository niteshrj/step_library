 -- 1. Show the total titles available in the library.

select title from book_detail ;

-- 2. Show the titles with highest number of copies.

select title from book_copies where count=(select max(count) from book_copies);

-- 3. Show the titles with five or less copies.

select title from book_copies where count<=5;

-- 4. Show the titles borrowed the most in a given month. (Eg: Sep 2017)
--- for month feb 2018
with s as (select book_id,count(book_id) from borrower where issue_date between '02/01/2018' and '02/28/2018' group by book_id order by count desc limit 1)
select * from book_detail where isbn = (select isbn from book_copy join s on book_copy.id = s.book_id);

-- 5. Show the titles not borrowed for more than four months as of current date.

with isbn_of_selected_book as
(select bc.isbn from book_copy bc right join borrower br on bc.id = br.book_id where return_date <= current_date - interval '4 months' and bc.availablity=true)
select bd.title from isbn_of_selected_book iosb join  book_detail bd on iosb.isbn=bd.isbn;

-- 6. Show the titles with more than 10 copies and not borrowed for the last 3 months.

select title from (select count(*),title from book_detail b
  join book_copy c on b.isbn=c.isbn group by title order by count(*)) as c2 where count>10
intersect
select title from book_detail b
except (select title from book_detail b1
	join (select isbn from book_copy b
  join borrower c on b.id=c.book_id where c.issue_date>=current_date-interval '3 months') as i on
  b1.isbn = i.isbn);

-- 7. Show the library user who borrowed the maximum books in a given period. (Eg: Jan 2018)

-- valid for march ==========

create view records_in_march as
(select u.* from user_detail u join borrower b on u.user_id=b.user_id where b.issue_date between '03/01/2018' and '03/31/2018');

with count_of_borrower as
(select count(*),first_name,last_name from records_in_march group by first_name,last_name)
select concat(first_name,' ',last_name) from count_of_borrower where count=(select max(count) from count_of_borrower);


-- 8. Show the library user(s) who are in possession of a library book for more than 15 days.

select concat(ud.first_name,' ',ud.last_name)
from borrower br join user_detail ud  on br.user_id= ud.user_id
where issue_date <= current_date - interval '15 days' and return_date is null;

-- 9. Show the library user(s) who are in possession of more than two library books and holding atleast two of them for more then 15 days.
-- i have created view for borrower and book count
create view borrower_with_book_count
(select count(*),user_id from borrower group by user_id);

select distinct concat(ud.first_name,' ',ud.last_name)
from borrower br join user_detail ud on br.user_id=ud.user_id
where br.user_id=(select user_id from borrower_with_book_count where count>2) and
issue_date <= current_date - interval '5 days' and return_date is null;


-- 10. Show the titles that are in high demand and copies not available.

select title from book_detail bd join
((select b1.isbn from book_copy b1
join (select distinct isbn from book_copy b
	join borrower bor on bor.book_id = b.id) as isbns on isbns.isbn=b1.isbn order by isbn)
intersect
(select distinct isbn from book_copy where availablity=false
except
select distinct isbn from book_copy where availablity=true))as bb on bb.isbn=bd.isbn;


-- 11. Show the library users who returned books in 7 days time in a given period.

select concat(ud.first_name,' ',ud.last_name)from borrower br
join user_detail ud on br.user_id=ud.user_id
where br.return_date= br.issue_date + interval '7 days';

-- 12. Show the average period of holding the borrowed books that were returned in a certain period. (Eg: Jan 2018).

--- for month feb 2018

select avg(br.return_date-br.issue_date) from borrower br
where br.return_date is not null and to_char(br.return_date,'MM-YYYY')= '02-2018';
