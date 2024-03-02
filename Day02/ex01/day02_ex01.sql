
select day::date as missing_date
from GENERATE_SERIES('2022-01-01'::date, '2022-01-10'::date, '1 day') as day
full join (select person_visits.visit_date
from person_visits
where person_id = 1 or person_id = 2) as visits
on day = visits.visit_date
where visits.visit_date is null 
order by visits.visit_date


