ALTER TABLE genres
ADD new_col INT IDENTITY(1,1)
ORDER BY gen_title;

ALTER TABLE genres
DROP COLUMN gen_title;

ALTER TABLE genres;
RENAME COLUMN new_col TO gen_title;