movie = load 'hdfs://localhost:8020/user/PIG/movies.csv' using PigStorage (',') as (movieid:int, title:chararray, genres:chararray);
rating = load 'hdfs://localhost:8020/user/PIG/ratings.csv' using PigStorage (',') as (userid:int, movieid:int, rating:int, timestamp:int);
movierating = COGROUP movie by movieid, rating by movieid;
movienotrated = filter movierating by IsEmpty(rating);
movienotratedtitle = foreach movienotrated generate flatten(movie.title);
dump movienotratedtitle;
