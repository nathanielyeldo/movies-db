CREATE DATABASE IF NOT EXISTS movies_db;
USE movies_db;

CREATE TABLE IF NOT EXISTS Movies (
    MovieID VARCHAR(255) PRIMARY KEY,
    Title VARCHAR(255),
    ReleaseYear INT,
    Duration INT,
    Description TEXT
);

CREATE TABLE IF NOT EXISTS Directors (
    DirectorID VARCHAR(255) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    BirthDate DATE,
    Gender VARCHAR(10),
    Country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Actors (
    ActorID VARCHAR(255) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    BirthDate DATE,
    Gender VARCHAR(10),
    Country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Genres (
    GenreID VARCHAR(255) PRIMARY KEY,
    GenreName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Roles (
    RoleID VARCHAR(255) PRIMARY KEY,
    RoleName VARCHAR(255)
);

-- Create the UserRoles table
CREATE TABLE IF NOT EXISTS UserRoles (
    UserRoleID VARCHAR(255) PRIMARY KEY,
    UserRoleName VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Users (
    UserID VARCHAR(255) PRIMARY KEY,
    Email VARCHAR(255),
    Username VARCHAR(255),
    Password VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Customers (
    CustomerID VARCHAR(255) PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Age INT,
    Country VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Login (
    LoginID VARCHAR(255) PRIMARY KEY,
    LoginDate DATE,
    LoginTime TIME,
    LogoutTime TIME
);

CREATE TABLE IF NOT EXISTS Ratings (
    RatingID VARCHAR(255) PRIMARY KEY,
    RatingDescription VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS UserRoleMapping (
    UserRoleMapID VARCHAR(255) PRIMARY KEY,
    UserID VARCHAR(255),
    UserRoleID VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (UserRoleID) REFERENCES UserRoles(UserRoleID)
);

CREATE TABLE IF NOT EXISTS UserCustomer (
    UserCustomerID VARCHAR(255) PRIMARY KEY,
    UserID VARCHAR(255),
    CustomerID VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE IF NOT EXISTS UserLogin (
    UserLoginID VARCHAR(255) PRIMARY KEY,
    UserID VARCHAR(255),
    LoginID VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (LoginID) REFERENCES Login(LoginID)
);

CREATE TABLE IF NOT EXISTS MovieDetails (
    MovieDetailsID VARCHAR(255) PRIMARY KEY,
    MovieID VARCHAR(255),
    DirectorID VARCHAR(255),
    GenreID VARCHAR(255),
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (DirectorID) REFERENCES Directors(DirectorID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

CREATE TABLE IF NOT EXISTS MovieCast (
    MovieCastID VARCHAR(255) PRIMARY KEY,
    MovieDetailsID VARCHAR(255),
    ActorID VARCHAR(255),
    RoleID VARCHAR(255),
    FOREIGN KEY (MovieDetailsID) REFERENCES MovieDetails(MovieDetailsID),
    FOREIGN KEY (ActorID) REFERENCES Actors(ActorID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE IF NOT EXISTS MovieRatings (
    MovieRatingID VARCHAR(255) PRIMARY KEY,
    MovieDetailsID VARCHAR(255),
    CustomerID VARCHAR(255),
    RatingID VARCHAR(255),
    ReviewText TEXT,
    FOREIGN KEY (MovieDetailsID) REFERENCES MovieDetails(MovieDetailsID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (RatingID) REFERENCES Ratings(RatingID)
);

INSERT INTO Movies (MovieID, Title, ReleaseYear, Duration, Description) VALUES
    ('MOV001', 'Inception', 2010, 148, 'A thief who enters the dreams of others to steal their secrets.'),
    ('MOV002', 'The Shawshank Redemption', 1994, 142, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'),
    ('MOV003', 'The Godfather', 1972, 175, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
    ('MOV004', 'The Dark Knight', 2008, 152, 'When the menace known as The Joker emerges, Batman must confront the chaos he brings to Gotham City.'),
    ('MOV005', 'Pulp Fiction', 1994, 154, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.');

INSERT INTO Directors (DirectorID, FirstName, LastName, BirthDate, Gender, Country) VALUES
    ('DIR001', 'Christopher', 'Nolan', '1970-07-30', 'Male', 'United Kingdom'),
    ('DIR002', 'Frank', 'Darabont', '1959-01-28', 'Male', 'United States'),
    ('DIR003', 'Francis Ford', 'Coppola', '1939-04-07', 'Male', 'United States'),
    ('DIR004', 'Tim', 'Burton', '1958-08-25', 'Male', 'United States'),
    ('DIR005', 'Quentin', 'Tarantino', '1963-03-27', 'Male', 'United States');

INSERT INTO Actors (ActorID, FirstName, LastName, BirthDate, Gender, Country) VALUES
    ('ACT001', 'Leonardo', 'DiCaprio', '1974-11-11', 'Male', 'United States'),
    ('ACT002', 'Morgan', 'Freeman', '1937-06-01', 'Male', 'United States'),
    ('ACT003', 'Marlon', 'Brando', '1924-04-03', 'Male', 'United States'),
    ('ACT004', 'Christian', 'Bale', '1974-01-30', 'Male', 'United Kingdom'),
    ('ACT005', 'John', 'Travolta', '1954-02-18', 'Male', 'United States');

INSERT INTO Genres (GenreID, GenreName) VALUES
    ('GEN001', 'Sci-Fi'),
    ('GEN002', 'Drama'),
    ('GEN003', 'Crime'),
    ('GEN004', 'Action'),
    ('GEN005', 'Pulp');

INSERT INTO Roles (RoleID, RoleName) VALUES
    ('ROL001', 'Lead'),
    ('ROL002', 'Supporting'),
    ('ROL003', 'Godfather'),
    ('ROL004', 'Hero'),
    ('ROL005', 'Hitman');

INSERT INTO UserRoles (UserRoleID, UserRoleName) VALUES
    ('UR001', 'Admin'),
    ('UR002', 'User');

INSERT INTO Users (UserID, Email, Username, Password) VALUES
    ('USER001', 'admin@example.com', 'admin', 'admin123'),
    ('USER002', 'user1@example.com', 'user1', 'user123'),
    ('USER003', 'user2@example.com', 'user2', 'user123'),
    ('USER004', 'user3@example.com', 'user3', 'user123'),
    ('USER005', 'user4@example.com', 'user4', 'user123');

INSERT INTO UserRoleMapping (UserRoleMapID, UserID, UserRoleID) VALUES
    ('URM001', 'USER001', 'UR001'),
    ('URM002', 'USER002', 'UR002'),
    ('URM003', 'USER003', 'UR002'),
    ('URM004', 'USER004', 'UR002'),
    ('URM005', 'USER005', 'UR002');

INSERT INTO Customers (CustomerID, FirstName, LastName, Age, Country) VALUES
    ('CUST001', 'John', 'Doe', 35, 'United States'),
    ('CUST002', 'Jane', 'Smith', 28, 'Canada'),
    ('CUST003', 'Robert', 'Johnson', 42, 'United Kingdom'),
    ('CUST004', 'Maria', 'Garcia', 31, 'Spain'),
    ('CUST005', 'Hiroshi', 'Tanaka', 40, 'Japan');

INSERT INTO UserCustomer (UserCustomerID, UserID, CustomerID) VALUES
    ('UC001', 'USER001', 'CUST001'),
    ('UC002', 'USER002', 'CUST002'),
    ('UC003', 'USER003', 'CUST003'),
    ('UC004', 'USER004', 'CUST004'),
    ('UC005', 'USER005', 'CUST005');

INSERT INTO Login (LoginID, LoginDate, LoginTime, LogoutTime) VALUES
    ('LOGIN001', '2023-01-01', '08:30:00', '17:30:00'),
    ('LOGIN002', '2023-01-02', '09:00:00', '18:00:00'),
    ('LOGIN003', '2023-01-03', '08:45:00', '17:45:00'),
    ('LOGIN004', '2023-01-04', '09:15:00', '18:15:00'),
    ('LOGIN005', '2023-01-05', '08:00:00', '17:00:00');

INSERT INTO UserLogin (UserLoginID, UserID, LoginID) VALUES
    ('UL001', 'USER001', 'LOGIN001'),
    ('UL002', 'USER002', 'LOGIN002'),
    ('UL003', 'USER003', 'LOGIN003'),
    ('UL004', 'USER004', 'LOGIN004'),
    ('UL005', 'USER005', 'LOGIN005');

-- Insert statements for MovieDetails table
INSERT INTO MovieDetails (MovieDetailsID, MovieID, DirectorID, GenreID) VALUES
    ('MOVDET001', 'MOV001', 'DIR001', 'GEN001'),
    ('MOVDET002', 'MOV002', 'DIR002', 'GEN002'),
    ('MOVDET003', 'MOV003', 'DIR003', 'GEN003'),
    ('MOVDET004', 'MOV004', 'DIR004', 'GEN004'),
    ('MOVDET005', 'MOV005', 'DIR005', 'GEN005');

INSERT INTO MovieCast (MovieCastID, MovieDetailsID, ActorID, RoleID) VALUES
    ('MCAST001', 'MOVDET001', 'ACT001', 'ROL001'),
    ('MCAST002', 'MOVDET002', 'ACT002', 'ROL002'),
    ('MCAST003', 'MOVDET003', 'ACT003', 'ROL003'),
    ('MCAST004', 'MOVDET004', 'ACT004', 'ROL004'),
    ('MCAST005', 'MOVDET005', 'ACT005', 'ROL005');

INSERT INTO Ratings (RatingID, RatingDescription) VALUES
    ('RAT001', 'Excellent'),
    ('RAT002', 'Good'),
    ('RAT003', 'Average'),
    ('RAT004', 'Poor'),
    ('RAT005', 'Terrible');

INSERT INTO MovieRatings (MovieRatingID, MovieDetailsID, CustomerID, RatingID, ReviewText) VALUES
    ('MRAT001', 'MOVDET001', 'CUST001', 'RAT001', 'One of the best movies I have ever seen.'),
    ('MRAT002', 'MOVDET002', 'CUST002', 'RAT002', 'A heartwarming story with powerful performances.'),
    ('MRAT003', 'MOVDET003', 'CUST003', 'RAT003', 'Classic masterpiece, a must-watch for everyone.'),
    ('MRAT004', 'MOVDET004', 'CUST004', 'RAT004', 'Disappointing plot, didn\'t live up to the hype.'),
    ('MRAT005', 'MOVDET005', 'CUST005', 'RAT005', 'Worst movie I have ever seen, regret watching it.');


INSERT INTO MovieRatings (MovieRatingID, MovieDetailsID, CustomerID, RatingID, ReviewText) VALUES
    ('MRAT007', 'MOVDET006', 'CUST002', 'RAT002', 'Salaar delivers non-stop action with a gripping storyline. A blockbuster hit!'),
    ('MRAT008', 'MOVDET006', 'CUST003', 'RAT003', 'Prasanth Neils direction in Salaar is mind-blowing. The movie keeps you on the edge of your seat.'),
    ('MRAT009', 'MOVDET006', 'CUST004', 'RAT004', 'Disappointed with Salaar. Expected more from the hype surrounding it.'),
    ('MRAT010', 'MOVDET006', 'CUST005', 'RAT005', 'One of the best action movies Ive seen in recent times. Salaar is a cinematic masterpiece!');

INSERT INTO Genres (GenreID, GenreName) VALUES
    ('GEN006', 'Horror');

INSERT INTO Movies (MovieID, Title, ReleaseYear, Duration, Description) VALUES
    ('MOV007', 'The Conjuring', 2013, 112, 'Paranormal investigators Ed and Lorraine Warren work to help a family terrorized by a dark presence in their farmhouse.'),
    ('MOV008', 'Insidious', 2010, 103, 'A family looks to prevent evil spirits from trapping their comatose child in a realm called The Further.'),
    ('MOV009', 'Insidious: Chapter 2', 2013, 106, 'The Lambert family must uncover the mysterious childhood secret that has left them dangerously connected to the spirit world.'),
    ('MOV010', 'The Conjuring 2', 2016, 134, 'Ed and Lorraine Warren travel to North London to help a single mother raising four children alone in a house plagued by malicious spirits.');

INSERT INTO Actors (ActorID, FirstName, LastName, BirthDate, Gender, Country) VALUES
    ('ACT006', 'Patrick', 'Wilson', '1973-07-03', 'Male', 'United States');

-- Insert statements for MovieDetails table (linking Patrick Wilson with the movies and Horror genre)
INSERT INTO MovieDetails (MovieDetailsID, MovieID, DirectorID, GenreID) VALUES
    ('MOVDET007', 'MOV007', NULL, 'GEN006'), -- The Conjuring
    ('MOVDET008', 'MOV008', NULL, 'GEN006'), -- Insidious
    ('MOVDET009', 'MOV009', NULL, 'GEN006'), -- Insidious: Chapter 2
    ('MOVDET010', 'MOV010', NULL, 'GEN006'); -- The Conjuring 2
    
INSERT INTO MovieCast (MovieCastID, MovieDetailsID, ActorID, RoleID) VALUES
    ('MCAST006', 'MOVDET007', 'ACT006', 'ROL002'), -- The Conjuring
    ('MCAST007', 'MOVDET008', 'ACT006', 'ROL001'), -- Insidious
    ('MCAST008', 'MOVDET009', 'ACT006', 'ROL001'), -- Insidious: Chapter 2
    ('MCAST009', 'MOVDET010', 'ACT006', 'ROL002'); -- The Conjuring 2
    
-- Select movies under the genre "Horror" in which Patrick Wilson has acted
SELECT m.Title
FROM Movies m
JOIN MovieDetails md ON m.MovieID = md.MovieID
JOIN MovieCast mc ON md.MovieDetailsID = mc.MovieDetailsID
JOIN Actors a ON mc.ActorID = a.ActorID
JOIN Genres g ON md.GenreID = g.GenreID
WHERE a.FirstName = 'Patrick' AND a.LastName = 'Wilson' AND g.GenreName = 'Horror';

-- Select all reviews for the movie "Salaar"
SELECT mr.ReviewText
FROM MovieRatings mr
JOIN MovieDetails md ON mr.MovieDetailsID = md.MovieDetailsID
JOIN Movies m ON md.MovieID = m.MovieID
WHERE m.Title = 'Salaar';

