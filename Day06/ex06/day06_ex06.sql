--drop sequence seq_person_discounts;
create sequence seq_person_discounts start 1;
alter table person_discounts alter column id set default nextval ('seq_person_discounts');
select setval('seq_person_discounts', 
	(select count(person_discounts.id)
		from person_discounts)+1);


--drop sequence seq_person_discounts;