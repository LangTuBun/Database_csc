CREATE DATABASE IF NOT EXISTS TestDB;

CREATE TABLE IF NOT EXISTS testdb.Employees
(
 id INT AUTO_INCREMENT PRIMARY KEY,
 full_name VARCHAR(150) NOT NULL,
 date_of_birth DATE,
 gender BOOLEAN,
 salary DECIMAL(8,2)
)ENGINE = InnoDB;

INSERT INTO TestDB.Employees(full_name, date_of_birth, gender, salary)
VALUES('Donald Trump', '1946-06-14', True, 24000);

INSERT INTO TestDB.Employees(full_name, date_of_birth, gender, salary)
VALUES('Barack Obama', '1961-08-04', True, 20000);

INSERT INTO TestDB.Employees(full_name, date_of_birth, gender, salary)
VALUES('Hillary Rodham Clinton', '1947-10-26', False, 20000);

