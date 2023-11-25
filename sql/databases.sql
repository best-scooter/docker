-- create databases
CREATE DATABASE IF NOT EXISTS `test`;
CREATE DATABASE IF NOT EXISTS `development`;
CREATE DATABASE IF NOT EXISTS `production`;
CREATE DATABASE IF NOT EXISTS `simulation`;

-- grant rights
-- CREATE USER 'root'@'%' IDENTIFIED BY 'example';
-- GRANT ALL ON test.* TO 'root'@'%';
-- GRANT ALL ON development.* TO 'root'@'%';
-- GRANT ALL ON production.* TO 'root'@'%';
-- GRANT ALL ON simulation.* TO 'root'@'%';
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL ON test.* TO 'user'@'%';
GRANT ALL ON development.* TO 'user'@'%';
GRANT ALL ON production.* TO 'user'@'%';
GRANT ALL ON simulation.* TO 'user'@'%';