with table_all as (select name, address, id
from person)
select person.name as person_name1, table_all.name as person_name2, person.address as common_address
from person
join table_all
on table_all.address = person.address
where person.name != table_all.name and person.id>table_all.id
