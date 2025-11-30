SELECT * FROM movies;
-- LIMIT 20;


SELECT *
FROM movies
WHERE id IN (
    SELECT person_id
    FROM stars
    WHERE person_id = (
        SELECT id
        FROM people
        WHERE name = 'Kevin Bacon' AND birth = 1958
    )
);

