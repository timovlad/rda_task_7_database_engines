CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Используем базу данных
USE ShopDB;

CREATE TABLE GeoIPCache (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    IPRange VARCHAR(50),
    CountryID INT,
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
) ENGINE = MEMORY;

CREATE TABLE ProductDescription (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Description TEXT,
    ProductID INT,
    CountryID INT,
    FOREIGN KEY (ProductID) REFERENCES ProductInventory(ID),
    FOREIGN KEY (CountryID) REFERENCES Countries(ID)
) ENGINE = InnoDB;

CREATE TABLE Logs (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Message TEXT
) ENGINE = MEMORY;

CREATE TABLE ProductReporting (
    Date DATE,
    ProductName VARCHAR(50),
    Orders INT,
    PRIMARY KEY (Date, ProductName)
) ENGINE = MyISAM;
