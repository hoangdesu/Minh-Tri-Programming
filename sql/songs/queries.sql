SELECT * FROM songs;


-- 1. write a SQL query to list the names of all songs in the database
SELECT name FROM songs;


-- 2. write a SQL query to list the names of all songs in increasing order of tempo
SELECT name, tempo
FROM songs;


-- 3. write a SQL query to list the names of the top 5 longest songs, in descending order of length
SELECT name, duration_ms
FROM songs
ORDER BY duration_ms DESC
LIMIT 5;
