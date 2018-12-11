movie = load '/home/acadgild/PIG/movies.csv' using PigStorage (',') as (movieid:int, title:chararray, genres:chararray);
ratings = load '/home/acadgild/PIG/ratings.csv' using PigStorage (',') as (userid:int, movieid:int, rating:int,  timestamp:int);
movierating = join movie by movieid left outer, ratings by movieid;
groupmovierating = group movierating by title;
countmovierating = foreach groupmovierating generate group, COUNT(movierating.rating);
dump countmovierating;
