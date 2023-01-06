SELECT director.dir_id, director.dir_fname, director.dir_lname
FROM ((((director
INNER JOIN movie_direction ON director.dir_id = movie_direction.dir_id)
INNER JOIN movie ON movie_direction.mov_id = movie.mov_id)
INNER JOIN movie_genres ON movie.mov_id = movie_genres.mov_id)
INNER JOIN rating ON movie.mov_id = rating.mov_id)
INNER JOIN (
SELECT gen_id, MAX(rev_stars) AS max_rating
FROM ((movie_genres
INNER JOIN movie ON movie.mov_id = movie_genres.mov_id)
INNER JOIN rating ON movie.mov_id = rating.mov_id)
GROUP BY movie_genres.gen_id) table2
ON movie_genres.gen_id = table2.gen_id AND rating.rev_stars = max_rating;