CREATE DATABASE PolyOE;

USE PolyOE;

CREATE TABLE User (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Video (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES User(id)
);

CREATE TABLE Favorite (
    user_id INT,
    video_id INT,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (video_id) REFERENCES Video(id)
);

CREATE TABLE Share (
    user_id INT,
    video_id INT,
    shared_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES User(id),
    FOREIGN KEY (video_id) REFERENCES Video(id)
);

INSERT INTO User (username, password, email) VALUES 
    ('user1', 'pass1', 'user1@example.com'),
    ('user2', 'pass2', 'user2@example.com');

INSERT INTO Video (title, description, user_id) VALUES 
    ('Video 1', 'Description for Video 1', 1),
    ('Video 2', 'Description for Video 2', 2);

INSERT INTO Favorite (user_id, video_id) VALUES 
    (1, 1),
    (1, 2),
    (2, 1);

INSERT INTO Share (user_id, video_id) VALUES 
    (1, 1),
    (2, 2);