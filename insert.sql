SET search_path TO library;

--run this script
--heroku pg:psql --app dbone < /Users/niteshr/projects/step_library/insert.sql
\set pwd '\'':p'/book_detail.txt\''
\COPY book_detail from :pwd with delimiter '$';
\set pwd '\'':p'/user_detail.txt\''
\COPY user_detail from :pwd with delimiter '$';
\set pwd '\'':p'/book_copy.txt\''
\COPY book_copy from :pwd with delimiter '$';
