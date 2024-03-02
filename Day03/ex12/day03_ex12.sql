insert  into  person_order (id, person_id, menu_id, order_date)
---------- gen id 
select (
	GENERATE_SERIES (
((select MAX(id)+1 from person_order)
         	),
((select MAX(id) from person_order)+(select COUNT(*) from person)
          	)
    				)
	),
	------------------gen id person
       (
   GENERATE_SERIES
   (
   		(select MIN(id)
        from person
        ),
        (select COUNT(*)
         from person
        )
   )
   		),
   		-----------------------menu pizza greek
       (select menu.id
        from menu
        where menu.pizza_name = 'greek pizza'),
        -------- date
       ('2022-02-25'::date)