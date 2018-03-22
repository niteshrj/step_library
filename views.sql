create view book_copies as select count(*),title from book_detail b
  join book_copy c on b.isbn=c.isbn group by title order by count(*) desc;
