
create unique index idx_person_discounts_unique on
person_discounts (person_id, pizzeria_id);
set enable_seqscan =off;
explain analyze 
select pizzeria_id, person_id
from person_discounts;

--drop index idx_person_discounts_unique;