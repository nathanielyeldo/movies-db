-- Create the database
CREATE DATABASE IF NOT EXISTS tv_movie_db;

-- Switch to the created database
USE tv_movie_db;

-- Create the Directors table
CREATE TABLE Directors (
    DirectorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

-- Create the Actors table
CREATE TABLE Actors (
    ActorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    Gender CHAR(1),
    Country VARCHAR(50)
);

-- Create the Genres table
CREATE TABLE Genres (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(50) NOT NULL
);

-- Create the Roles table
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY AUTO_INCREMENT,
    RoleName VARCHAR(50) NOT NULL
);

-- Create the Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    UserType VARCHAR(50) NOT NULL
);

-- Create the Movies table
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    ReleaseYear INT,
    Duration INT,
    Description TEXT,
    DirectorID INT,
    FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID)
);

-- Create the TVShows table
CREATE TABLE TVShows (
    ShowID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    StartYear INT,
    EndYear INT,
    Description TEXT,
    CreatorID INT,
    FOREIGN KEY (CreatorID) REFERENCES Directors(DirectorID)
);

-- Create the MovieGenres table
CREATE TABLE MovieGenres (
    MovieID INT,
    GenreID INT,
    PRIMARY KEY (MovieID, GenreID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Create the ShowGenres table
CREATE TABLE ShowGenres (
    ShowID INT,
    GenreID INT,
    PRIMARY KEY (ShowID, GenreID),
    FOREIGN KEY (ShowID) REFERENCES TVShows(ShowID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Create the Cast table
CREATE TABLE MovieCast (
    MovieID INT,
    ActorID INT,
    RoleID INT,
    PRIMARY KEY (MovieID, ActorID, RoleID),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE ShowCast (
    ShowID INT,
    ActorID INT,
    RoleID INT,
    PRIMARY KEY (ShowID, ActorID, RoleID),
    FOREIGN KEY (ShowID) REFERENCES TVShows(ShowID),
    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- Create the Ratings table
CREATE TABLE MovieRatings (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    MovieID INT,
    UserID INT,
    RatingValue INT,
    ReviewText TEXT,
    Timestamp TIMESTAMP,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
CREATE TABLE ShowRatings (
    RatingID INT PRIMARY KEY AUTO_INCREMENT,
    ShowID INT,
    UserID INT,
    RatingValue INT,
    ReviewText TEXT,
    Timestamp TIMESTAMP,
    FOREIGN KEY (ShowID) REFERENCES TVShows(ShowID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


-- Insert data into Directors table
INSERT INTO Directors (FirstName, LastName) VALUES
    ('Christopher', 'Nolan'),
    ('Quentin', 'Tarantino'),
    ('Steven', 'Spielberg'),
    ('Martin', 'Scorsese'),
    ('Sofia', 'Coppola');

-- Insert data into Actors table
INSERT INTO Actors (FirstName, LastName, BirthDate, Gender, Country) VALUES
    ('Leonardo', 'DiCaprio', '1974-11-11', 'M', 'USA'),
    ('Brad', 'Pitt', '1963-12-18', 'M', 'USA'),
    ('Emma', 'Stone', '1988-11-06', 'F', 'USA'),
    ('Joaquin', 'Phoenix', '1974-10-28', 'M', 'USA'),
    ('Scarlett', 'Johansson', '1984-11-22', 'F', 'USA');

-- Insert data into Genres table
INSERT INTO Genres (GenreName) VALUES
    ('Action'),
    ('Drama'),
    ('Comedy'),
    ('Thriller'),
    ('Science Fiction');

-- Insert data into Roles table
INSERT INTO Roles (RoleName) VALUES
    ('Lead'),
    ('Supporting'),
    ('Villain'),
    ('Comedian'),
    ('Sidekick');

-- Insert data into Users table
INSERT INTO Users (Username, Email, Password, UserType) VALUES
    ('john_doe', 'john@example.com', 'password123', 'Regular'),
    ('alice_smith', 'alice@example.com', 'secret456', 'Premium'),
    ('bob_jones', 'bob@example.com', 'topsecret789', 'Regular'),
    ('emma_jackson', 'emma@example.com', 'p@ssw0rd', 'Premium'),
    ('michael_brown', 'michael@example.com', 'secure4321', 'Regular');

-- Insert data into Movies table
INSERT INTO Movies (Title, ReleaseYear, Duration, Description, DirectorID) VALUES
    ('Inception', 2010, 148, 'A thief enters the dreams of others to steal their secrets.', 1),
    ('Pulp Fiction', 1994, 154, 'Various interconnected stories of crime in Los Angeles.', 2),
    ('Schindler''s List', 1993, 195, 'A man saves Jews from the Holocaust during World War II.', 3),
    ('The Departed', 2006, 151, 'Undercover cops and criminals clash in Boston.', 4),
    ('Lost in Translation', 2003, 102, 'An unlikely friendship between two strangers in Tokyo.', 5);

-- Insert data into TVShows table
INSERT INTO TVShows (Title, StartYear, EndYear, Description, CreatorID) VALUES
    ('Breaking Bad', 2008, 2013, 'A high school chemistry teacher turns to cooking meth after a cancer diagnosis.', 2),
    ('Stranger Things', 2016, NULL, 'Strange occurrences in a small town involving alternate dimensions.', 3),
    ('Friends', 1994, 2004, 'Six friends navigate life, love, and work in New York City.', 4),
    ('The Mandalorian', 2019, NULL, 'A lone bounty hunter in the outer reaches of the galaxy.', 1),
    ('Black Mirror', 2011, NULL, 'Anthology series exploring the dark aspects of technology and society.', 5);

-- Insert data into MovieGenres table
INSERT INTO MovieGenres (MovieID, GenreID) VALUES
    (1, 5),
    (2, 1),
    (3, 2),
    (4, 4),
    (5, 2);

-- Insert data into ShowGenres table
INSERT INTO ShowGenres (ShowID, GenreID) VALUES
    (1, 4),
    (2, 5),
    (3, 3),
    (4, 1),
    (5, 5);

-- Insert data into MovieCast table
INSERT INTO MovieCast (MovieID, ActorID, RoleID) VALUES
    (1, 1, 1),
    (2, 2, 1),
    (3, 1, 1),
    (4, 3, 1),
    (5, 4, 1);

-- Insert data into ShowCast table
INSERT INTO ShowCast (ShowID, ActorID, RoleID) VALUES
    (1, 2, 1),
    (2, 3, 1),
    (3, 4, 1),
    (4, 5, 1),
    (5, 1, 1);

-- Insert data into MovieRatings table
INSERT INTO MovieRatings (MovieID, UserID, RatingValue, ReviewText, Timestamp) VALUES
    (1, 1, 5, 'Mind-bending plot and great visuals!', NOW()),
    (2, 2, 4, 'Classic Tarantino!', NOW()),
    (3, 3, 5, 'A powerful portrayal of history.', NOW()),
    (4, 4, 4, 'Intense from start to finish.', NOW()),
    (5, 5, 4, 'Beautiful and subtle storytelling.', NOW());

-- Insert data into ShowRatings table
INSERT INTO ShowRatings (ShowID, UserID, RatingValue, ReviewText, Timestamp) VALUES
    (1, 1, 5, 'Highly addictive!', NOW()),
    (2, 2, 4, 'Nostalgic and thrilling.', NOW()),
    (3, 3, 5, 'Timeless humor and heartwarming moments.', NOW()),
    (4, 4, 4, 'Captivating Star Wars universe.', NOW()),
    (5, 5, 4, 'Thought-provoking and unsettling.', NOW());


