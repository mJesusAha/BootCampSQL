UPDATE menu
SET price = (price - ((price/100)*10))
where pizza_name = 'greek pizza'