SELECT
    (SELECT name
    	from person
    	where person.id = person_order.person_id
    	) AS NAME, 
    	CASE
           WHEN (SELECT person.name
           FROM person
           		WHERE person.id = person_order.person_id) = 'Denis'
               		THEN 'True'
           			ELSE 'False'
           END 	
    	 as name_check
FROM person_order
where
	(menu_id = 13 or menu_id = 14 or menu_id = 18) 
	and date(order_date) ='2022-01-07'