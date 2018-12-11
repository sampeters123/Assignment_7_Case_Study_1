movie = load '/home/acadgild/PIG/movies.csv' using PigStorage (',') as (movieid:int, title:chararray, genres:chararray);
rating = load '/home/acadgild/PIG/ratings.csv' using PigStorage (',') as (userid:int, movieid:int, rating:int, timestamp:int);
movierating = COGROUP movie by movieid, rating by movieid;
movienotrated = filter movierating by IsEmpty(rating);
movienotratedtitle = foreach movienotrated generate flatten(movie.title);
dump movienotratedtitle;
