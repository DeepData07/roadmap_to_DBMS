-- DDL

-- CREATE DATABASE - Creates Database
CREATE DATABASE football;

-- DROP DATABASE - Delete Database
DROP DATABASE IF EXISTS football;

CREATE DATABASE IF NOT EXISTS football2;

-- SHOW DATABASES - gives all database
SHOW DATABASES;

-- DDL Commands for Table
-- CREATE, TRUNCATE, DROP

-- creating table
CREATE TABLE users(
    user_id INTEGER,
    name VARCHAR(255),
    password VARCHAR(255),
    email VARCHAR(255)
)
-- TRUNCATE - kahli krdega table
-- jitni bhi entries hogi sab uda dega table me bas column name bach jaenge
TRUNCATE TABLE users;

-- DROP TABLE - puri table uda dega column + rows everything
DROP TABLE IF EXISTS users;
