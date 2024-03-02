create view v_symmetric_union as
with R_SuR_S as (
	(
	select person_id
	from person_visits
	where visit_date = '2022-01-02'::date
except 
	select person_id
	from person_visits
	where visit_date = '2022-01-06'::date)
union 
	(
	select person_id
	from person_visits
	where visit_date = '2022-01-06'::date
except 
	select person_id
	from person_visits
	where visit_date = '2022-01-02'::date
	))

select *
from R_SuR_S
order by 1