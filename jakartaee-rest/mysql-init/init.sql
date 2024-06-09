-- Create database if not exists
CREATE DATABASE IF NOT EXISTS books_db;
CREATE USER IF NOT EXISTS 'yourUsername'@'%' IDENTIFIED BY 'yourPassword';
GRANT ALL PRIVILEGES ON books_db.* TO 'yourUsername'@'%';
FLUSH PRIVILEGES;

-- Use the database
USE books_db;

-- Create table
CREATE TABLE IF NOT EXISTS books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    year INT
);
