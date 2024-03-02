select name, count(price) as count_of_orders,
round(avg(price::numeric),2)as average_price, 
max(price) as max_price , min(price) as min_price
from person_order
join menu on menu.id = person_order.menu_id  
join pizzeria
on pizzeria.id = menu.pizzeria_id 
group by pizzeria.name
order by 1