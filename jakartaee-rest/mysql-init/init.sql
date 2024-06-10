-- Create database if not exists
CREATE DATABASE IF NOT EXISTS books_db;
CREATE USER IF NOT EXISTS 'yourUsername'@'%' IDENTIFIED BY 'yourPassword';
GRANT ALL PRIVILEGES ON books_db.* TO 'yourUsername'@'%';
FLUSH PRIVILEGES;
