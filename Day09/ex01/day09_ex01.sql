create or replace function fnc_trg_person_update_audit()
returns trigger  as 
$trg_person_update_audit$
begin 
	insert into person_audit (created, type_event, row_id, 
 								 name,
 								 age,
 								 gender,
 								 address)
 	values (current_timestamp, 'U', old.id, old.name,
 								 old.age,
 								old. gender,
 								 old.address);
 								return old;
		end;

$trg_person_update_audit$
language plpgsql;

create trigger trg_person_update_audit
	after update on person for each row 
	execute function fnc_trg_person_update_audit();
	--drop trigger trg_person_update_audit on person 
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
select * from person_audit; 