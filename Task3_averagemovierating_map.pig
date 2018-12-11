movie = load 'hdfs://localhost:8020/user/PIG/movies.csv' using PigStorage (',') as (movieid:int, title:chararray, genres:chararray);
ratings = load 'hdfs://localhost:8020/user/PIG/ratings.csv' using PigStorage (',') as (userid:int, movieid:int, rating:int, timestamp:int);
movierating = join movie by movieid, ratings by movieid;
groupmovierating = group movierating by title;
averagemovierating = foreach groupmovierating generate group, AVG(movierating.rating);
dump averagemovierating;
