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
-- 4 - AUTO_INCREMENT -  add one value eg - user id, jaisi naya user aya purani id me increment hoke nai id ban gai
-- 5 - CHECK - on coloumn/set of columns applies a codidtion eg persons of age >30 only
-- 6 - DEFAULT - put some default value eg - date column, just put today date by default
-- 7 - Foreighn key

-- NOT NULL - not null me value ni dalte to sql apne aap dal dete hai kuch bhi, pr null ni rakhta
CREATE TABLE user1(
    name VARCHAR(255) NOT NULL,
    id INTEGER NOT NULL
)

-- UNIQUE - same value daldi to error dedega
CREATE TABLE user3(
    name VAECHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE
)

-- another way of defining constraint vv imp
CREATE TABLE user4(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    mail VARCHAR(255) NOT NULL,
    
    CONSTRAINT user4_mail_unique UNIQUE (name, mail) -- imp ye hai ki ab combination of name and mail should be uniqu, impppp alag alag ni combination of them should be unique
)

-- Primary Key - automatically not null and unique
CREATE TABLE user4(
    id INTEGER,
    name VARCHAR(255),
    mail VARCHAR(@55),
    
    CONSTRAINT pk PRIMARY KEY(id, name)
)

-- AUTO_INCREMENT
CREATE TABLE user5(
    id INTEGER AUTO_INCREMENT,
    name VARCHAR(255)
)

-- CHECK
CREATE TABLE std(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    age INTEGER CHECK(age > 6 AND age < 30),
    name VARCHAR(255),
    
    CONTRAINT age_check CHECK (age >6 AND age < 30)
)

-- DEFAULT - DATE, DATETIME are also data type, CURRENT_DATE is a  inbuild fun which tells current time
CREATE TABLE ticket(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    date DATETIME DEFAULT CURRENT_DATE
)

-- FOREIGN KEY imp
CREATE TABLE customers(
    cid INTEGER PRIMARY KEY,
    name VARCHAR(255),
    mail VARCHAR(255)
)
CREATE TABLE order(
    oid INTEGER PRIMARY KEY,
    cid INTEGER NOT NULL,
    mail VARCHAR(255)
    CONSTRAINT oid FOREIGN KEY (cid) REFRENCES customers (cid)
)

DROP TABLE customers -- will give error, saying order depends on customers
-- agar koi order create kra, fr usko delete krdia, then we can delete that customer detail, other wise agar direct customer table ya customer detail delete krenge to error aega