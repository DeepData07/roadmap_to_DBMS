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

-- Contrains for data integrity
-- 1- NOT NULL - koi null value allowed ni hai eg phone no
-- 2 - UNIQUE - no dupilcate values allowed
-- 3 - Primary key
-- 4 - AUTO INCREMENT -  add one value eg - user id, jaisi naya user aya purani id me increment hoke nai id ban gai
-- 5 - CHECK - on coloumn/set of columns applies a codidtion eg persons of age >30 only
-- 6 - DEFAULT - put some default value eg - date column, just put today date by default
-- 7 - Foreighn key