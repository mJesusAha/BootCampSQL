
--Session #1
begin;
set transaction isolation level READ committed;
--Session #2
begin;
set transaction isolation level READ committed;
--Session #1
select * from pizzeria where pizzeria.name ='Pizza Hut';
--Session #2
update pizzeria 
set rating = 3.6
where pizzeria.name ='Pizza Hut';
commit;
--Session #1
select * from pizzeria
where pizzeria.name ='Pizza Hut';
commit;
select * from pizzeria
where pizzeria.name ='Pizza Hut';
--Session #2
select * from pizzeria
where pizzeria.name ='Pizza Hut';
