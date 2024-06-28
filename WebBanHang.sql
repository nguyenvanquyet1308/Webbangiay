
Create Database WebBanHang
use WebBanHang

CREATE TABLE Users (
  id int PRIMARY KEY IDENTITY(1, 1),
  fullname varchar(50) NOT NULL,
  email varchar(150) NOT NULL UNIQUE,
  phoneNumber varchar(20),
  address varchar(200),
  password varchar(32) NOT NULL,
  admin bit NOT NULL DEFAULT 0
);
GO

CREATE TABLE Category (
  id int PRIMARY KEY IDENTITY(1, 1),
  name varchar(100) NOT NULL
);
GO

CREATE TABLE Product (
  id int PRIMARY KEY IDENTITY(1, 1),
  categoryId int NOT NULL,
  title varchar(250) NOT NULL,
  price int NOT NULL,
  thumbnail varchar(500),
  description varchar(500),
  createdTime datetime DEFAULT GETDATE(),
  updatedTime datetime DEFAULT GETDATE(),
  FOREIGN KEY (categoryId) REFERENCES Category (id)
);
GO

CREATE TABLE Gallery (
  id int PRIMARY KEY IDENTITY(1, 1),
  productId int NOT NULL,
  thumbnail varchar(500),
  FOREIGN KEY (productId) REFERENCES Product (id)
);
GO

CREATE TABLE FeedBack (
  id int PRIMARY KEY IDENTITY(1, 1),
  firstname varchar(30) NOT NULL,
  lastname varchar(30) NOT NULL,
  email varchar(250) NOT NULL,
  phoneNumber varchar(20),
  subjectName varchar(350),
  note varchar(1000),
  status int DEFAULT 0,
  createdTime date DEFAULT GETDATE(),
  updatedTime date DEFAULT GETDATE()
);
GO

CREATE TABLE Orders (
  id int PRIMARY KEY IDENTITY(1, 1),
  userId int NOT NULL,
  fullname varchar(50) NOT NULL,
  email varchar(150) NOT NULL,
  phone_number varchar(20),
  address varchar(200),
  note varchar(1000),
  orderDate datetime DEFAULT GETDATE(),
  status int NOT NULL,
  totalMoney int NOT NULL,
  FOREIGN KEY (userId) REFERENCES Users (id)
);
GO

CREATE TABLE Order_Details (
  id int PRIMARY KEY IDENTITY(1, 1),
  orderId int NOT NULL,
  productId int NOT NULL,
  price int NOT NULL,
  num int NOT NULL,
  totalMoney int NOT NULL,
  FOREIGN KEY (orderId) REFERENCES Orders (id),
  FOREIGN KEY (productId) REFERENCES Product (id)
);
GO
