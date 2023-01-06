UPDATE actor
SET act_gender = 'F'
WHERE LOWER(actor.act_fname) LIKE 'em%' OR LOWER(actor.act_fname) LIKE 'char%' OR LOWER(actor.act_fname) LIKE '%dy' OR LOWER(actor.act_fname) LIKE '%sy' OR LOWER(actor.act_fname) LIKE '%lia';