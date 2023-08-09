-- Create Instagram DB
DROP DATABASE IF EXISTS Ig_Clone;
CREATE DATABASE Ig_Clone;
-- Activate DB
USE Ig_Clone;

-- Create Users Table
CREATE TABLE Users(
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
    );
  
-- Create Photos Table
CREATE TABLE Photos(
	photo_id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
    );
    
-- Create Comments Table
CREATE TABLE Comments(
	comment_id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
	FOREIGN KEY(photo_id) REFERENCES Photos(photo_id)
    );
    
-- Create Likes Table
CREATE TABLE Likes(
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
	FOREIGN KEY(photo_id) REFERENCES Photos(photo_id)
    );
  
-- Create FOllowers Table
CREATE TABLE Follows (
	follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES Users(user_id),
	FOREIGN KEY(followee_id) REFERENCES Users(user_id),
    PRIMARY KEY(follower_id, followee_id)
);

-- Create Tags Table
CREATE TABLE tags (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tag_name VARCHAR(255) UNIQUE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Create Photo Tags Table
CREATE TABLE photo_tags (
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    FOREIGN KEY(tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);
-- Insert Records Into The Users Table
INSERT INTO users(username)
VALUES("BlueTheCat"),
	  ("CharlieBrown"),
      ("Coltesteele");

-- Insert Records Into The Photos Table
INSERT INTO Photos(image_url, user_id)
VALUES("/alsg45f",1),
	  ("/fdhr56f",2),
      ("/kfhjfk34l",2);
      
-- Insert Records Into The Comments Table
INSERT INTO Comments(comment_text, user_id, photo_id)
VALUES("Meow",1,2),
	  ("Amazing Shot",2,3),
      ("I <3 This",2,1);
      
-- Insert Records Into The Likes Table
INSERT INTO Likes(user_id, photo_id)
VALUES(1,1),
	  (2,1),
      (1,2),
      (1,3),
      (3,3);
      
-- Insert Records Into The Likes Table
INSERT INTO Follows(follower_id, followee_id)
VALUES(1,2),
	  (1,3),
      (3,1),
      (2,3);
      
-- Insert Records Into The Tags Table
INSERT INTO Tags(tag_name)
VALUES("Adorable"),
	  ("Cute"),
      ("Adorable"),
      ("Sunrise");
      
-- Insert Records Into The Photo Tags Table
INSERT INTO photo_tags(follower_id, followee_id)
VALUES(1,1),
	  (1,2),
      (2,3),
      (3,2);