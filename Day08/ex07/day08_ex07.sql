--Session #1
begin;
--Session #2
begin;
--Session #1
update pizzeria 
set rating = 5.0
where pizzeria.id = 1;
--Session #2
update pizzeria 
set rating = 5.0
where pizzeria.id = 2;
--Session #1
update pizzeria 
set rating = 5.0
where pizzeria.id = 2;
--Session #2
update pizzeria 
set rating = 5.0
where pizzeria.id = 1;

--Session #1
commit;

commit;