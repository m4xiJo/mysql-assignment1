-- List ammount of products by category
SELECT cat.title, count(cbp.product_id) quantity 
FROM CategoriesPerProducts AS cbp
JOIN Categories cat ON cbp.category_id = cat.category_id
GROUP BY cbp.category_id, cat.title;

-- List of customers with total purchuase sum
SELECT c.firstname, c.lastname, sum(pbo.quantity * p.price) totalprice
FROM Customers AS c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN ProductsPerOrders pbo ON pbo.order_id = o.order_id
JOIN Products p ON p.product_id = pbo.product_id
GROUP BY c.firstname, c.lastname;

-- Show customers that bought black sandals of size 38
SELECT c.firstname, c.lastname
FROM Customers AS c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN ProductsPerOrders pbo ON pbo.order_id = o.order_id
JOIN Products p ON p.product_id = pbo.product_id
WHERE p.color = "blue" 
AND p.make = "Ecco" 
AND p.size = 38;

-- List total order value by billing address
SELECT c.billing_address, sum(pbo.quantity * p.price) order_value
FROM Customers AS c
JOIN Orders o ON o.customer_id = c.customer_id
JOIN ProductsPerOrders pbo ON pbo.order_id = o.order_id
JOIN Products p ON p.product_id = pbo.product_id
GROUP BY c.billing_address
HAVING sum(pbo.quantity * p.price) > 1000;

-- Top 5 list of the most sold products
SELECT p.make, p.model, p.size, p.color, sum(pbo.quantity) sales_quantity
FROM Orders AS o
JOIN ProductsPerOrders pbo ON pbo.order_id = o.order_id
JOIN Products p ON p.product_id = pbo.product_id
GROUP BY p.make, p.model, p.size, p.color
ORDER BY sum(pbo.quantity) DESC LIMIT 5;

-- Get the biggest sale month
SELECT DATE_FORMAT(o.order_date, '%Y-%m') order_month, max(sum(pbo.quantity * p.price)) total_sales 
FROM Orders AS o
JOIN ProductsPerOrders pbo ON pbo.order_id = o.order_id
JOIN Products p ON p.product_id = pbo.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m');