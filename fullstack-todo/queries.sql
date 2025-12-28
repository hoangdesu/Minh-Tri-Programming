CREATE TABLE todos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    content TEXT,
    completed BOOLEAN DEFAULT false,
    created_at TEXT DEFAULT (datetime('now', 'localtime'))
);


DROP TABLE IF EXISTS todos;


INSERT INTO todos
VALUES (1, 'setup database', false, 'nov 20');



INSERT INTO todos (content)
VALUES ('install sqlite db');


INSERT INTO todos (content, completed)
VALUES ('connect the todo app with sqlite db', true);


INSERT INTO todos (content)
VALUES 
    ('frontend'),
    ('code backend'),
    ('edit function'),
    ('refactor code'),
    ('version control with github')
;


DELETE FROM todos
WHERE id = 2;


UPDATE todos
SET completed = true
WHERE id = 5;


SELECT * FROM todos;


SELECT content, completed
FROM todos;


SELECT content, completed
FROM todos
WHERE completed = 1;


-- pattern matching
SELECT * 
FROM todos
WHERE content LIKE '%CODE%';

