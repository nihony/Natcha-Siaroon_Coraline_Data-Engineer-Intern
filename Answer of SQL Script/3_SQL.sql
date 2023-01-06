SELECT d.dir_id, d.dir_fname, d.dir_lname, COUNT(actor.act_id), actor.act_id, actor.act_fname, actor.act_lname, actor.act_gender
FROM ((((director d
LEFT OUTER JOIN movie_direction ON d.dir_id = movie_direction.dir_id)
LEFT OUTER JOIN movie ON movie_direction.mov_id = movie.mov_id)
LEFT OUTER JOIN movie_cast ON movie.mov_id = movie_cast.mov_id)
LEFT OUTER JOIN actor ON movie_cast.act_id = actor.act_id)
WHERE act_gender = 'F'
GROUP BY d.dir_id, actor.act_id
ORDER BY COUNT(actor.act_id) DESC
LIMIT 5;