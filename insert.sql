SET search_path TO library;
--
\COPY book_detail from '/Users/niteshr/Downloads/book_detail.txt' with delimiter '$';
\COPY user_detail from '/Users/niteshr/Downloads/user_detail.txt' with delimiter '$';
\COPY book_copy from '/Users/niteshr/Downloads/book_copy.txt' with delimiter '$';
