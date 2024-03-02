create or replace function fnc_trg_person_delete_audit()
returns trigger  as 
$trg_person_delete_audit$
begin 
	insert into person_audit (created, type_event, row_id, 
 								 name,
 								 age,
 								 gender,
 								 address)
 	values (current_timestamp, 'D', old.id, old.name,
 								 old.age,
 								old. gender,
 								 old.address);
 								return old;
		end;

$trg_person_delete_audit$
language plpgsql;
create trigger trg_person_delete_audit
	after delete on person for each row 
	execute function fnc_trg_person_delete_audit();
	--drop trigger trg_person_delete_audit on person 
DELETE FROM person WHERE id = 10;
select * from person_audit; 