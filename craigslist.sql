 -- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE Region (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(255)
);

CREATE TABLE Users (
    users_id INT PRIMARY KEY,
    username VARCHAR(255),
    password VARCHAR(255),
    preferred_region_id INT REFERENCES Region(region_id)
);

CREATE TABLE Post (
    post_id INT PRIMARY KEY,
    title VARCHAR(255),
    text TEXT,
    users_id INT,
    location VARCHAR(255),
    region_id INT,
    category_id INT,
    FOREIGN KEY (users_id) REFERENCES Users(users_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
  
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
   
);


