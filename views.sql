set search_path to library;

create view book_copies as
  select count(*),title from book_detail b
  join book_copy c on b.isbn=c.isbn group by title order by count(*) desc;

create view bookInfo_between_Jan_feb as
  select book_id,count(book_id) from borrower where to_char(issue_date,'MM-YYYY')='02-2018'
  group by book_id order by count desc limit 1;

create view isbn_of_selected_book as
  select bc.isbn from book_copy bc right join borrower br on bc.id = br.book_id where
  return_date <= current_date - interval '4 months' and bc.availablity=true;

create view records_in_march as
  select u.* from user_detail u join borrower b on u.user_id=b.user_id where
  to_char(b.issue_date,'MM-YYYY')='03-2018';

create view count_of_borrower as
  select count(*),first_name,last_name from records_in_march
  group by first_name,last_name;

create view borrower_with_book_count as
  select count(*),user_id from borrower group by user_id;
