--Session #1
begin;
set transaction isolation level REPEATABLE READ;
--Session #2
begin;
set transaction isolation level REPEATABLE READ;
--Session #1
select sum(rating) from pizzeria;
--Session #2
update pizzeria 
set rating = 5.0
where pizzeria.name ='Pizza Hut';
commit;
--Session #1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

--Session #2
select sum(rating) from pizzeria;