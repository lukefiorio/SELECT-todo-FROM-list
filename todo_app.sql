DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
  id serial NOT NULL PRIMARY KEY,
  title varchar(255) NOT NULL,
  description text,
  created_at timestamp without time zone NOT NULL DEFAULT now(),
  updated_at timestamp without time zone,
  completed boolean NOT NULL DEFAULT FALSE
);

ALTER TABLE tasks DROP completed;

ALTER TABLE tasks ALTER COLUMN updated_at SET NOT NULL, ALTER COLUMN updated_at SET DEFAULT now();

ALTER TABLE tasks
  ADD completed_at timestamp DEFAULT NULL;

INSERT INTO tasks
    VALUES (DEFAULT, 'Study SQL', 'Complete this exerices', DEFAULT, DEFAULT, NULL);
INSERT INTO tasks (title, description, updated_at)
    VALUES ('Study PostgreSQL', 'Read all the documentation', now());
SELECT
  title
FROM
  tasks
WHERE
  completed_at IS NULL;

UPDATE
  tasks
SET
  completed_at = now()
WHERE
  title = 'Study SQL';

SELECT
  title,
  description
FROM
  tasks
WHERE
  completed_at IS NULL;

SELECT
  *
FROM
  tasks
ORDER BY
  created_at DESC;

INSERT INTO tasks (title, description, updated_at)
    VALUES ('mistake 1', 'a test entry', now());
INSERT INTO tasks (title, description, updated_at)
    VALUES ('mistake 2', 'another test entry', now());
INSERT INTO tasks (title, description, updated_at)
    VALUES ('third mistake', 'another test entry', now());
SELECT
  title
FROM
  tasks
WHERE
  title LIKE '%mistake%';

DELETE FROM tasks
WHERE title = 'mistake 1';

SELECT
  title,
  description
FROM
  tasks
WHERE
  title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake%';

SELECT
  *
FROM
  tasks
ORDER BY
  title ASC;

