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


--WHERE (dance > 0.75) AND (valence > 0.75) AND ()

SELECT AVG(energy) AS [Average energy]
FROM songs;



--SQL joins

SELECT songs.name AS 'song name', artists.name AS 'artist name'
FROM songs
JOIN artists ON songs.artist_id = artists.id;


-- 6
SELECT songs.name AS 'song name', artists.name AS 'artist name'
FROM songs
JOIN artists ON songs.artist_id = artists.id
WHERE artists.name = 'Post Malone';

-- sub queries
SELECT name
FROM songs
WHERE artist_id = (
    SELECT id
    FROM artists
    WHERE name = 'Post Malone'
);


-- 8
SELECT name
FROM songs
WHERE name LIKE '%feat%'
