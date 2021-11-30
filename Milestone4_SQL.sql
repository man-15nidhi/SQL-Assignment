CREATE DATABASE INSTAGRAM;
USE INSTAGRAM; 

 CREATE TABLE users (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    photo_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE likes (
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

CREATE TABLE tags (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

//DATA INSERTION 

//Q3.(i) 

SELECT id, username, created_at FROM users
ORDER BY created_at
LIMIT 5;

//(ii)

SELECT WEEKDAY(created_at) AS day, 
COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

SELECT DAYNAME(created_at) AS day, COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;

//(iii)

SELECT users.id, username
FROM users
LEFT JOIN photos ON users.id = photos.user_id
WHERE photos.user_id IS NULL;

//(iv)

SELECT users.username , photos.image_url,
COUNT(*) as total
FROM likes
INNER JOIN users ON photos.user_id = users.id
INNER JOIN photos ON photos.id = likes.photo_id
GROUP BY likes.photo_id
ORDER BY total DESC
LIMIT 10;

SELECT users.username, photos.image_url ,
COUNT(*) as total
FROM photos
INNER JOIN likes ON likes.photo_id = photos.id
INNER JOIN users ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 10;

//(v)

SELECT FLOOR((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)) AS AVG;

//(vi)

SELECT tags.id, tags.tag_name, COUNT(*) AS total
FROM tags
INNER JOIN photo_tags ON tags.id = photo_tags.tag_id
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;

//(vii)

SELECT COUNT(*)
FROM users
LEFT JOIN likes ON users.id = likes.user_id
WHERE likes.user_id IS NOT NULL;

SELECT username, COUNT(*) AS num_likes
FROM users
INNER JOIN likes ON users.id = likes.user_id
GROUP BY users.id
HAVING num_likes = (SELECT COUNT(*) FROM photos);

//(viii)

SELECT users.username FROM users LEFT JOIN comments ON users.id = comments.user_id 
WHERE comments.user_id IS NULL;
