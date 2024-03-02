select person.id as "person.id" ,
		person.name as  "person.name", 
		age, gender, address,
		pizzeria.id as "pizzeria.id",
		pizzeria.name as "pizzeria.name", rating
		
from person, pizzeria
order by "person.id", "pizzeria.id"
