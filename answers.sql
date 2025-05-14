-- Creating a database --

CREATE DATABASE FantasyClub;
USE FantasyClub;

-- Creating tables --
CREATE TABLE Team (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) UNIQUE NOT NULL,
    founded_year INT NOT NULL
);
-- inserting data into Team table
-- The year 1878 is used as an example. Adjust as necessary.
INSERT INTO Team (team_name, founded_year) VALUES 
('Manchester United', 1878),
('Barcelona', 1899),
('Chelsea', 1905),
('Newcastle', 1905);



CREATE TABLE Players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    position VARCHAR(50) NOT NULL,
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Team(team_id) ON DELETE CASCADE
);

-- inserting data into Players table
INSERT INTO Players (name, date_of_birth, position, team_id) VALUES
 ('Bruno', '1996-09-21', 'Midfielder', 1),
('Cristiano Ronaldo', '1985-02-05', 'Forward', 1),
('Lamine Yamal', '2007-12-09', 'Winger', 2),
('Isak', '1995-12-19', 'Striker', 4),
('Lionel Messi', '1987-06-24', 'Forward', 2),
('Neymar Jr', '1992-02-05', 'Forward', 2),
('Kante', '1991-03-29', 'Midfielder', 3);

-- creating matches table
CREATE TABLE Matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    match_date DATE NOT NULL,
    score_home INT,
    score_away INT,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);
 
-- inserting data into Matches table

INSERT INTO Matches (home_team_id, away_team_id, match_date, score_home, score_away) VALUES
(1, 2, '2025-04-15', 3, 2),
(3, 1, '2025-04-20', 1, 4),
(2, 3, '2025-05-01', 2, 2);

-- creating goals table 

CREATE TABLE Goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    match_id INT NOT NULL,
    player_id INT NOT NULL,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);
-- inserting data into Goals table  
INSERT INTO Goals (match_id, player_id,) VALUES
(1, 1, ),
(1, 2, ),
(2, 3, ),
(3, 4, ),
(1, 5, ),
(2, 6,);

CREATE TABLE Coaches (
    coach_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    team_id INT UNIQUE NOT NULL,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);
-- inserting data into Coaches table
INSERT INTO Coaches (name, team_id) VALUES
('Erik ten Hag', 1),
('Xavi Hernandez', 2),
('Graham Potter', 3),
('Eddie Howe', 4);



-- Retrieving Data of players and their teams
-- Get all players and their teams
SELECT Players.name AS Player, Players.position, Teams.team_name AS Team 
FROM Players
JOIN Teams ON Players.team_id = Teams.team_id;


-- Get match results
SELECT Matches.match_date, T1.team_name AS HomeTeam, Matches.score_home, 
       T2.team_name AS AwayTeam, Matches.score_away 
FROM Matches
JOIN Teams T1 ON Matches.home_team_id = T1.team_id
JOIN Teams T2 ON Matches.away_team_id = T2.team_id;


-- Get all goals scored in a match
SELECT Matches.match_date, Players.name AS Scorer, Teams.team_name AS Team
FROM Goals 
JOIN Matches ON Goals.match_id = Matches.match_id
JOIN Players ON Goals.player_id = Players.player_id
JOIN Teams ON Players.team_id = Teams.team_id
WHERE Matches.match_date = '2025-04-15'; 
-- Example date, adjust as necessary