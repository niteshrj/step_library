with s as (select book_id,count(book_id) from borrower where issue_date between '02/01/2018' and '02/28/2018' group by book_id order by count desc limit 1)
select * from book_detail where isbn = (select isbn from book_copy join s on book_copy.id = s.book_id);
