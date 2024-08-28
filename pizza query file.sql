#Retrieve the total number of orders placed.

select * from orders;
select count(order_id) from orders;
select count(order_id) as 'tota_orders' from orders;


#Calculate the total revenue generated from pizza sales.


SELECT 
    (orders_details_id.quantity * pizzas.price)
FROM
    orders_details_id
        JOIN
    pizzas ON pizzas.pizza_id = orders_details_id.pizza_id;

SELECT 
    SUM(orders_details_id.quantity * pizzas.price)
FROM
    orders_details_id
        JOIN
    pizzas ON pizzas.pizza_id = orders_details_id.pizza_id;

SELECT 
    ROUND(SUM(orders_details_id.quantity * pizzas.price),
            2) AS total_sales
FROM
    orders_details_id
        JOIN
    pizzas ON pizzas.pizza_id = orders_details_id.pizza_id;
    
    

#identify the highest-priced pizza.

select pizza_types.name,pizzas.price
from pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
order by pizzas.price desc limit 1;

#Identify the most common pizza size ordered.

SELECT 
    pizzas.size,
    COUNT(orders_details_id.order_id) AS total_count
FROM
    pizzas
        JOIN
    orders_details_id ON pizzas.pizza_id = orders_details_id.pizza_id
GROUP BY pizzas.size
ORDER BY total_count DESC;



#List the top 5 most ordered pizza types along with their quantities

SELECT 
    pizza_types.name,
    SUM(orders_details_id.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details_id ON orders_details_id.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY quantity DESC
LIMIT 5;


SELECT 
    pizza_types.category,
    SUM(orders_details_id.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details_id ON orders_details_id.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity;


SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);


SELECT * FROM pizzahut.orders_details_id;
