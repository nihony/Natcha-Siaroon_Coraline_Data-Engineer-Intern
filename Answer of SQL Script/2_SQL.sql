SELECT a.act_id, a.act_fname, a.act_lname, a.act_gender, movie.mov_title, movie.mov_time
FROM (((actor a
INNER JOIN movie_cast ON a.act_id = movie_cast.act_id)
INNER JOIN movie ON movie_cast.mov_id = movie.mov_id)
INNER JOIN rating ON movie.mov_id = rating.mov_id)
WHERE rev_stars IS NOT NULL;