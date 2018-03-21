SET search_path TO library;
--

\set pwd '\'':p'/book_detail.txt\''
\COPY book_detail from :pwd with delimiter '$';
\set pwd '\'':p'/user_detail.txt\''
\COPY user_detail from :pwd with delimiter '$';
\set pwd '\'':p'/book_copy.txt\''
\COPY book_copy from :pwd with delimiter '$';
