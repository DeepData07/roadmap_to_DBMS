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
    mail VARCHAR(255),
    CONSTRAINT oid FOREIGN KEY (cid) REFRENCES customers (cid)
)

DROP TABLE customers -- will give error, saying order depends on customers
-- agar koi order create kra, fr usko delete krdia, then we can delete that customer detail, other wise agar direct customer table ya customer detail delete krenge to error aega

/* 
. foreighn key se relations bnte hai tables me
. to ham 4 different type ke relation ya contraint ya refrenctial actions bna sakte hai
. agar kuch define ni kra upar foreign key ke example ki treh, to by default it is a RESTRICT
. 1-Restrict - parent ko na delete kr sakte na update
. 2-CASCADE - parent me delete/update kr sakte hai, usse fr child me bhi voh change ajaega
. 3-SET NULL - agar parent me delete kra to child me value NULL set krdega
. 4-SET DEFAULT - agar parent me delete kra to child me value koi default value daldega set krdega
*/
CREATE TABLE order(
    oid INTEGER PRIMARY KEY,
    cid INTEGER NOT NULL,
    mail VARCHAR(255),
    CONSTRAINT oid FOREIGN KEY (cid) REFRENCES customers (cid)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    
    -- or
    ON DELETE SET NULL
    
    
    -- or
    ON DELETE DEFAULT
    ON UPDATE DEFAULT
    
)

-- ALTER - Add/Delete/Modify Columns
ALTER TABLE user1 ADD COLUMN password VARCHAR(255) NOT NULL
ALTER TABLE user2 ADD COLUMN surname VARCHAR(255) NOT NULL AFTER id
ALTER TABLE user2 ADD COLUMN surname VARCHAR(255) NOT NULL BEFORE id


-- add multiple columns
ALTER TABLE user3
ADD COLUMN hi INTEGER,
ADD COLUMN joining_date DATETIME DEFAULT CURRENT_TIMESTAMP

-- delte column
ALTER TABLE user1 DROP COLUMN id
-- or
ALTER TABLE user1
DROP COLUMN id,
DROP COLUMN name

-- change/Alter datatype, constraints
ALTER TABLE user2 MODIFY COLUMN id VARCHAR

-- Add remove edit constraints
ALTER TABLE user3 ADD CONSTRAINT age_check CHECK (age > 1)

-- to edit contraint first delete/drop it then add new
ALTER TABLE user3 DROP CONSTRAINT age_check