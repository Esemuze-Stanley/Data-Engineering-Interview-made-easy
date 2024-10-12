-- --If you’re preparing for Data engineering interviews at big product-based companies, then you must have to appear in the data modeling or database designing round in order to get your dream job!!. 

-- Today let’s discuss the same with a real interview problem. 
-- So Let’s design the database for a system like Linkedin and perform some basic queries...
-- A database design for a system like LinkedIn would likely include several different tables to store information about users, their profiles, connections, and various types of content they can post or share. Here is an example of how the tables might be structured:

-- Users: This table would store basic information about users such as their name, email, password, and registration date.

-- Profiles: Each user would have a unique profile, which would contain information such as their current job title, industry, location, and summary. The profile table would also include a foreign key linking it to the user who owns it.

-- Connections: This table would store information about the relationships between users, including the user ID of the person making the connection and the user ID of the person they are connecting with. This table would also have a status column to indicate whether the connection is pending, accepted, or blocked.

-- Education: This table would store information about the user’s education like school name, degree, field of study, and start and end date. This table would also include a foreign key linking it to the user who owns it.

-- Experience: This table would store information about the user’s work experience company name, job title, location, and start and end date. This table would also include a foreign key linking it to the user who owns it.

-- Skills: This table would store information about the user’s skills. This table would also include a foreign key linking it to the user who owns it.

-- Posts: This table would store information about posts made by users, including the user ID of the person who made the post, the post’s content, and the date it was posted.

-- Comments: This table would store information about comments made on posts, including the user ID of the person who made the comment, the comment’s content, and the date it was posted. It would also include a foreign key linking it to the post it is commenting on.

-- Likes: This table would store information about likes on posts, including the user ID of the person who made the like and the date it was posted. It would also include a foreign key linking it to the post it is liking on.

-- Shares: This table would store information about shares on posts, including the user ID of the person who made the share and the date it was posted. It would also include a foreign key linking it to the post it is sharing.

-- Groups: This table would store information about groups created by users, including the group name, description, and the user ID of the person who created the group.

-- Group_members: This table would store information about the relationship between groups and users, including the user ID of the person and the group ID they are joining. It would also have a status column to indicate whether the request is pending, accepted, or blocked.

-- It’s important to note that these tables and fields are examples and may vary depending on the specific requirements of the system.
-- Relationships between the tables:
-- Here is an example of how the relationships between the tables in the LinkedIn database design might be structured:

-- One-to-one relationship between Users and Profiles, where one user can have only one profile, but one profile can belong to only one user.

-- One-to-many relationship between Users and Connections, where one user can have multiple connections, but one connection can belong to only one user.

-- One-to-many relationship between Users and Education, where one user can have multiple education, but one education can belong to only one user.

-- One-to-many relationship between Users and Experience, where one user can have multiple experiences, but one experience can belong to only one user.

-- One-to-many relationship between Users and Skills, where one user can have multiple skills, but one skill can belong to only one user.

-- One-to-many relationship between Users and Posts, where one user can have multiple posts, but one post can belong to only one user.

-- One-to-many relationship between Posts and Comments, where one post can have multiple comments, but one comment can belong to only one post.

-- One-to-many relationship between Posts and Likes, where one post can have multiple likes, but one like can belong to only one post.

-- One-to-many relationship between Posts and Shares, where one post can have multiple shares, but one share can belong to only one post.

-- One-to-many relationship between Users and Groups, where one user can have multiple groups, but one group can belong to only one user.

-- Many-to-many relationship between Users and Group_members, where one user can join multiple groups and one group can have multiple members.

-- It’s important to note that these relationships are examples and may vary depending on the specific requirements of the system.
-- Structure of all the tables:
-- Here is an example of the table structures for a LinkedIn-like system:


CREATE database LinkedINDB;
Use LinkedINDB;


-- Users Table
create table Users(
             UserID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
             Email VARCHAR(100) NOT NULL UNIQUE,
             Password VARCHAR(225) NOT NULL,
             Name VARCHAR(100) NOT NULL,
             Location VARCHAR(225) NOT NULL,
			 profile_picture VARCHAR(255),
             bio TEXT(225) NOT NULL,
             Joined_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
             );

-- profiles table
CREATE table Profiles(
             profileID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
             UserID INT, FOREIGN KEY (UserID) REFERENCES USERS (USERID),
             Headline TEXT(225) NOT NULL,
             Summary TEXT(225) NOT NULL,
             Industry VARCHAR(225) NOT NULL,
             Website VARCHAR(100) NOT NULL
             );

-- Connections table 
CREATE TABLE Connections (
			 connectionID INT AUTO_INCREMENT PRIMARY KEY,
             userID INT, FOREIGN KEY (userID) REFERENCES Users(userID),
			 connected_userID INT, FOREIGN KEY (connected_userID) REFERENCES Users(userID),
             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
             Connection_status VARCHAR(225) NOT NULL
);

-- Education table
CREATE table Education(
             EductaionID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
             UserID INT, FOREIGN KEY (UserID) REFERENCES Users (UserID),
             School_name VARCHAR(100) NOT NULL,
             Degree VARCHAR(100) NOT NULL,
             Field_of_study VARCHAR(100) NOT NULL,
             Start_date DATE,
             End_date DATE
             );

-- Experience table
CREATE Table Experience(
             ExperienceID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
             UserID INT, FOREIGN KEY(UserID) REFERENCES Users (UserID),
             Company_name VARCHAR(100) NOT NULL,
             Title VARCHAR(100) NOT NULL,
             Location VARCHAR(225) NOT NULL,
             Start_date DATE,
             End_date DATE
             );

-- Skills Table
CREATE Table Skills(
             SkillID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
             UserID INT, FOREIGN KEY (UserID) REFERENCES Users (UserID),
             Skill_name VARCHAR(100) NOT NULL
             );

-- Posts table
CREATE TABLE Posts (
             postID INT AUTO_INCREMENT PRIMARY KEY,
             userID INT, FOREIGN KEY (userID) REFERENCES Users(userID),
             content TEXT NOT NULL,
             created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Comments table
CREATE TABLE Comments (
    commentID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    postID INT, FOREIGN KEY (postID) REFERENCES Posts(postID),
    userID INT, FOREIGN KEY (userID) REFERENCES Users (userID),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- likes Table
CREATE TABLE Likes(
             likeID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
             postID INT, FOREIGN KEY (postID) REFERENCES Posts(postID), 
             userID INT, FOREIGN KEY (userID) REFERENCES Users (userID)
             );
             
  -- share table
  CREATE TABLE Shares(
               shareID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
               post_id INT, FOREIGN KEY (post_id) REFERENCES Posts(postID), 
			   userID INT, FOREIGN KEY (userID) REFERENCES Users (userID)
               );
             
-- Groups Table
CREATE TABLE Groupss(
             GroupID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
             userID INT, FOREIGN KEY (userID) REFERENCES Users(userID),
             Group_name VARCHAR(100) NOT NULL,
             description VARCHAR(225) NOT NULL,
             date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
             );

-- Group members table
CREATE TABLE Group_members(
             Group_memberID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
             userID INT, FOREIGN KEY (userID) REFERENCES Users (userID),
             GroupID INT, FOREIGN KEY (GroupID) REFERENCES Groupss (GroupID)
             );

show tables;
             
-- Performing Basic to ADVANCED Querries--

-- Select all records from Users
SELECT * FROM Users;

-- using limit 
-- Get the first 10 users
SELECT * FROM Users
LIMIT 10;

-- Select specific columns
SELECT Name, Email FROM Users;

-- Select all profiles in the IT industry
SELECT * FROM Profiles WHERE Industry = 'Engineering';

 -- Filtering with WHERE CLAUSE --  
 -- Get users from a specific location
SELECT * FROM Users WHERE Location = 'East Barbara, Nepal';

-- Get all profiles where the summary mentions 'software'
SELECT * FROM Profiles WHERE Summary LIKE '%information%';

-- Joining tables -- 
-- Get user details along with their profiles (INNER JOIN)
SELECT Users.Name, Users.Email, Profiles.Headline, Profiles.Industry 
FROM Users
INNER JOIN Profiles ON Users.UserID = Profiles.UserID;

-- Get all users and their connections (LEFT JOIN)
SELECT Users.Name AS 'User', Connections.Connection_status, U2.Name AS 'Connected User'
FROM Users
LEFT JOIN Connections ON Users.UserID = Connections.UserID
LEFT JOIN Users U2 ON Connections.connected_userID = U2.UserID;

-- Grouping and aggregating data -- 
-- Get the number of users in each location
SELECT Location, COUNT(UserID) AS 'Total Users'
FROM Users
GROUP BY Location;

-- Get the number of connections per user
SELECT Users.Name, COUNT(Connections.connectionID) AS 'Total Connections'
FROM Users
LEFT JOIN Connections ON Users.UserID = Connections.UserID
GROUP BY Users.Name;

-- using ORDER BY-- 
-- Get users ordered by their join date
SELECT Name, Joined_Date FROM Users
ORDER BY Joined_Date DESC;

-- Get the most connected users (users with the highest number of connections)
SELECT Users.Name, COUNT(Connections.connectionID) AS 'TotalConnections'
FROM Users
LEFT JOIN Connections ON Users.UserID = Connections.UserID
GROUP BY Users.Name
ORDER BY TotalConnections DESC;

-- Advanced Queries 

-- Get users who have created posts
SELECT Name FROM Users WHERE UserID IN (SELECT userID FROM Posts);

-- Get the users who have made more than 3 connections
SELECT Name 
FROM Users 
WHERE UserID IN (
    SELECT UserID 
    FROM Connections 
    GROUP BY UserID 
    HAVING COUNT(connectionID) > 3
);

-- Using CASE for conditional logic
-- Show connection status along with custom labels
SELECT Users.Name, 
       CASE 
           WHEN Connection_status = 'Accepted' THEN 'Connected'
           WHEN Connection_status = 'Pending' THEN 'Pending Connection'
           ELSE 'Connection Declined'
       END AS 'Connection Status'
FROM Connections
INNER JOIN Users ON Users.UserID = Connections.UserID;

-- Assign experience levels based on user connections
SELECT Users.Name,
       CASE 
           WHEN COUNT(Connections.connectionID) > 10 THEN 'Highly Connected'
           WHEN COUNT(Connections.connectionID) BETWEEN 5 AND 10 THEN 'Moderately Connected'
           ELSE 'Low Connections'
       END AS 'Experience Level'
FROM Users
LEFT JOIN Connections ON Users.UserID = Connections.UserID
GROUP BY Users.Name;

-- using UNION to combine results 
-- Get users and their group members
SELECT Name, 'User' AS Type FROM Users
UNION
SELECT Name, 'Group Member' AS Type FROM Users
INNER JOIN Group_members ON Users.UserID = Group_members.UserID;

-- Joins and Aggregation
-- Get users and their total number of posts, comments, and likes
SELECT Users.Name, 
       COUNT(DISTINCT Posts.postID) AS 'Total Posts', 
       COUNT(DISTINCT Comments.commentID) AS 'Total Comments',
       COUNT(DISTINCT Likes.likeID) AS 'Total Likes'
FROM Users
LEFT JOIN Posts ON Users.UserID = Posts.userID
LEFT JOIN Comments ON Users.UserID = Comments.userID
LEFT JOIN Likes ON Users.UserID = Likes.userID
GROUP BY Users.Name;

-- Get group details along with the number of members
SELECT Groupss.Group_name, COUNT(Group_members.Group_memberID) AS 'Total Members'
FROM Groupss
LEFT JOIN Group_members ON Groupss.GroupID = Group_members.GroupID
GROUP BY Groupss.Group_name;

-- Queries with CTE(Common Table Expression)
-- Get users who have liked their own posts
WITH UserPosts AS (
    SELECT Posts.postID, Posts.userID AS post_owner
    FROM Posts
)
SELECT Users.Name
FROM Users
JOIN Likes ON Users.UserID = Likes.userID
JOIN UserPosts ON Likes.postID = UserPosts.postID
WHERE Users.UserID = UserPosts.post_owner;

-- CTE to rank users by their number of connections
WITH ConnectionCounts AS (
    SELECT Users.UserID, Users.Name, COUNT(Connections.connectionID) AS TotalConnections
    FROM Users
    LEFT JOIN Connections ON Users.UserID = Connections.UserID
    GROUP BY Users.UserID
)
SELECT Name, TotalConnections, 
       RANK() OVER (ORDER BY TotalConnections DESC) AS RANK
FROM ConnectionCounts;

-- creating views: views allows you to create a virtul table based on the result of a querry -- 
-- Create a view for users and their profiles
CREATE VIEW UserProfileView AS
SELECT Users.UserID, Users.Name, Users.Email, Profiles.Headline, Profiles.Industry
FROM Users
INNER JOIN Profiles ON Users.UserID = Profiles.UserID;

-- Query the view
SELECT * FROM UserProfileView;

-- Triggers: you can create trigger to automaticaly perfom actions when certain events occurs--
-- Trigger to update a user's profile summary when their bio is updated
DELIMITER $$
CREATE TRIGGER update_summary_after_bio_update
AFTER UPDATE ON Users
FOR EACH ROW
BEGIN
  IF NEW.bio <> OLD.bio THEN
    UPDATE Profiles
    SET Summary = CONCAT('Updated bio: ', NEW.bio)
    WHERE Profiles.UserID = NEW.UserID;
  END IF;
END$$
DELIMITER ;
  
-- stored procedure: stored procedure allows you to encapsulate logic and reuse it--
-- Create a stored procedure to add a new user
DELIMITER $$
CREATE PROCEDURE AddUser (
    IN Email VARCHAR(100),
    IN Password VARCHAR(225),
    IN Name VARCHAR(100),
    IN Location VARCHAR(225),
    IN profile_picture VARCHAR(255),
    IN bio TEXT
)
BEGIN
    INSERT INTO Users (Email, Password, Name, Location, profile_picture, bio) 
    VALUES (Email, Password, Name, Location, profile_picture, bio);
END$$
DELIMITER ;

-- Call the procedure to add a new user
CALL AddUser('jane.doe@example.com', 'mypassword', 'Jane Doe', 'Los Angeles, USA', 'jane_profile.jpg', 'Creative director at a tech company.');
 
 