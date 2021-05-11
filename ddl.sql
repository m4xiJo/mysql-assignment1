DROP TABLE IF EXISTS ProductsPerOrders;
DROP TABLE IF EXISTS CategoriesPerProducts;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS OutOfStock;

CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    firstname char(50) NOT NULL,
    lastname char(50) NOT NULL,
    billing_address char(50) NOT NULL,
    passwd char(50) NOT NULL
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    order_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    make VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    size INTEGER NOT NULL,
    price INTEGER NOT NULL,
    instock INTEGER
);

CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255)
);

CREATE TABLE ProductsPerOrders (
    product_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (product_id, order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE CategoriesPerProducts (
    category_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    PRIMARY KEY (category_id, product_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE OutOfStock (
    dateOfIssue TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    product_id INTEGER NOT NULL
);

INSERT INTO Customers (firstname, lastname, billing_address, passwd) VALUES ("John", "Doe", "22444 Texas US", "user1");
INSERT INTO Customers (firstname, lastname, billing_address, passwd) VALUES ("Peter", "Quinn", "55675 Mars", "user2");
INSERT INTO Customers (firstname, lastname, billing_address, passwd) VALUES ("Clint", "Eastwood", "73465 Fakeplace", "user3");
INSERT INTO Customers (firstname, lastname, billing_address, passwd) VALUES ("Jack", "Nimble", "34573 Trolloland", "user4");
INSERT INTO Customers (firstname, lastname, billing_address, passwd) VALUES ("Sam", "Fisher", "34657 DC", "user5");

INSERT INTO Categories (title) VALUES ("Sportshoes");
INSERT INTO Categories (title) VALUES ("Kidshoes");
INSERT INTO Categories (title) VALUES ("Walkshoes");
INSERT INTO Categories (title) VALUES ("Jumpshoes");
INSERT INTO Categories (title) VALUES ("Flyshoes");

INSERT INTO Products (make, model, color, size, price, instock) VALUES ("Nike", "Jordan", "bluered", 42, 2000, 3);
INSERT INTO Products (make, model, color, size, price, instock) VALUES ("Colombia", "Island", "grey", 41, 200, 1);
INSERT INTO Products (make, model, color, size, price, instock) VALUES ("Addidas", "Sport", "white", 40,  400, 10);
INSERT INTO Products (make, model, color, size, price, instock) VALUES ("Ecco", "Classic", "black", 38, 100, 23);
INSERT INTO Products (make, model, color, size, price, instock) VALUES ("Timberland", "Spurce", "bluered", 26, 1000, 14);
INSERT INTO Products (make, model, color, size, price, instock) VALUES ("Solomon", "Elite", "bluered", 44, 7020, 6);
INSERT INTO Products (make, model, color, size, price, instock) VALUES ("Random", "Shoes", "bluered", 10, 90, 8);
INSERT INTO Products (make, model, color, size, price, instock) VALUES ("Fake", "Sandals", "bluered", 5, 40, 10);

INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (1, 4);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (1, 5);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (2, 2);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (2, 3);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (3, 3);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (3, 4);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (4, 1);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (4, 5);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (5, 1);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (5, 5);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (6, 1);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (6, 5);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (7, 1);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (7, 5);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (8, 1);
INSERT INTO CategoriesPerProducts (product_id, category_id) VALUES (8, 5);

INSERT INTO Orders (customer_id) VALUES (1);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (2, 20, 1);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (4, 10, 1);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (6, 60, 1);

INSERT INTO Orders (customer_id) VALUES (2);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (1, 11, 2);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (3, 22, 2);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (7, 33, 2);

INSERT INTO Orders (customer_id) VALUES (3);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (1, 3, 3);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (5, 6, 3);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (8, 4, 3);

INSERT INTO Orders (customer_id) VALUES (4);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (4, 7, 4);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (5, 4, 4);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (3, 8, 4);

INSERT INTO Orders (customer_id) VALUES (5);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (2, 2, 5);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (6, 1, 5);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (3, 6, 5);

INSERT INTO Orders (customer_id) VALUES (1);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (1, 3, 6);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (8, 5, 6);
INSERT INTO ProductsPerOrders (product_id, quantity, order_id) VALUES (6, 7, 6);