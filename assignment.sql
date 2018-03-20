-- querey 4
with s as (select book_id,count(book_id) from borrower where issue_date between '02/01/2018' and '02/28/2018' group by book_id order by count desc limit 1)
select * from book_detail where isbn = (select isbn from book_copy join s on book_copy.id = s.book_id);
-- query 6
select title from (select count(*),title from book_detail b
  join book_copy c on b.isbn=c.isbn group by title order by count(*)) as c2 where count>10
intersect
select title from book_detail b
except (select title from book_detail b1 
	join (select isbn from book_copy b
  join borrower c on b.id=c.book_id where c.issue_date>=current_date-interval '3 months') as i on 
  b1.isbn = i.isbn);