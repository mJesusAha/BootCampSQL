

select person_order.order_date, concat(persons.name, ' (age:', persons.age, ')') as person_information
from person_order
natural join person as persons(person_id, name, age, gender, address)
order by person_order.order_date, person_information