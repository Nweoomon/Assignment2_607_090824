/*
  movie_ratings.sql
*/

DROP TABLE IF EXISTS movie_ratings;

CREATE TABLE movie_ratings 
(
  participant_id varchar(100) NOT NULL,
  The_Lion_King int NULL,
  Frozen int NULL,
  Toy_Story int NULL,
  Finding_Nemo int NULL,
  Shrek int NULL,
  Spirited_Away int NULL
);

SELECT * FROM movie_ratings;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\animated_movie_ratings.csv'
INTO TABLE movie_ratings
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(participant_id, @The_Lion_King, @Frozen, @Toy_Story, @Finding_Nemo, @Shrek, @Spirited_Away)
SET
The_Lion_King = nullif(@The_Lion_King,-1),
Frozen = nullif(@Frozen,-1),
Toy_Story = nullif(@Toy_Story,-1),
Finding_Nemo = nullif(@Finding_Nemo,-1),
Shrek = nullif(@Shrek,-1),
Spirited_Away = nullif(@Spirited_Away,-1)
;

SELECT * FROM movie_ratings WHERE Frozen IS NULL;
SELECT COUNT(*) FROM movie_ratings;
