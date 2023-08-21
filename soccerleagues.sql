 -- from the terminal run:
-- psql < soccerleagues.sql

DROP DATABASE IF EXISTS soccerleagues;

CREATE DATABASE soccerleagues;

\c soccerleagues

CREATE TABLE Teams (
    team_id INT PRIMARY KEY,
    team_name VARCHAR(255),
    coach_name VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    team_id INT,
    player_name VARCHAR(255),
    position VARCHAR(255),
    height INT,
    FOREIGN KEY (team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Goals (
    goal_id INT PRIMARY KEY,
    match_id INT,
    player_id INT,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

CREATE TABLE Referees (
    referee_id INT PRIMARY KEY,
    referee_name VARCHAR(255)
);

CREATE TABLE Results (
    result_id INT PRIMARY KEY,
    match_id INT,
    home_team_goals INT,
    away_team_goals INT,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id)
);

CREATE TABLE Matches (
    match_id INT PRIMARY KEY,
    home_team_id INT,
    away_team_id INT,
    location TEXT,
    match_date DATE,
    start_time INT,
    FOREIGN KEY (home_team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (away_team_id) REFERENCES Teams(team_id)
);

CREATE TABLE Lineups (
    lineup_id INT PRIMARY KEY,
    match_id INT,
    team_id INT,
    player_id INT,
    FOREIGN KEY (match_id) REFERENCES Matches(match_id),
    FOREIGN KEY (team_id) REFERENCES Teams(team_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id)
);

CREATE TABLE Season (
    season_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE
);