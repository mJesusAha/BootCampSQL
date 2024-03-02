--Session #1
begin;
set transaction isolation level READ COMMITTED;
--Session #2
begin;
set transaction isolation level READ COMMITTED;
--Session #1
select sum(rating) from pizzeria;
--Session #2
update pizzeria 
set rating = 1.0
where pizzeria.name ='Pizza Hut';
commit;
--Session #1
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

--Session #2
select sum(rating) from pizzeria;