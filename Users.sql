CREATE USER 'simpleuser'@'localhost' IDENTIFIED BY 'simplepassword';
CREATE USER 'simpleuser'@'%' IDENTIFIED BY 'simplepassword';
GRANT SELECT ON mydb.Course TO 'simpleuser'@'localhost';
GRANT SELECT ON mydb.Course TO 'simpleuser'@'%';
GRANT SELECT ON mydb.Content TO 'simpleuser'@'localhost';
GRANT SELECT ON mydb.Content TO 'simpleuser'@'%';
GRANT SELECT ON mydb.Category TO 'simpleuser'@'localhost';
GRANT SELECT ON mydb.Category TO 'simpleuser'@'%';
GRANT SELECT ON mydb.Quiz TO 'simpleuser'@'localhost';
GRANT SELECT ON mydb.Quiz TO 'simpleuser'@'%';
GRANT SELECT ON mydb.Certification TO 'simpleuser'@'localhost';
GRANT SELECT ON mydb.Certification TO 'simpleuser'@'%';


CREATE USER 'instructor'@'localhost' IDENTIFIED BY 'mypass';
GRANT INSERT, UPDATE ON mydb.Course TO 'instructor'@'localhost';
GRANT INSERT, UPDATE ON mydb.Content TO 'instructor'@'localhost';
GRANT INSERT, UPDATE ON mydb.Quiz TO 'instructor'@'localhost';
