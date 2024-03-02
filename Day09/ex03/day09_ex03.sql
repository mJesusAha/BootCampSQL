drop trigger trg_person_insert_audit on person; 
drop trigger trg_person_update_audit on person; 
drop trigger trg_person_delete_audit on person; 
drop function fnc_trg_person_insert_audit() cascade;
drop function fnc_trg_person_update_audit() cascade;
drop function fnc_trg_person_delete_audit() cascade;
truncate person_audit;
--select * from person_audit;

----------------
create or replace function fnc_trg_person_audit()
    returns trigger  as 
$trg_person_audit$
BEGIN
    IF (TG_OP = 'INSERT') then
    	begin 
	insert into person_audit (row_id, 
 								 name,
 								 age,
 								 gender,
 								 address)
 	values (new.id, new.name,
 								 new.age,
 								new. gender,
 								 new.address);
 								return new;
		end;
		--2version
        /*INSERT INTO person_audit SELECT current_timestamp, 'I', new.id, new.name,
 								 new.age,
 								new. gender,
 								 new.address;*/
    ELSIF (TG_OP = 'UPDATE') THEN
        /*INSERT INTO person_audit SELECT current_timestamp, 'U', old.id, old.name,
 								 old.age,
 								old. gender,
 								 old.address;*/
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
	
    ELSIF (TG_OP = 'DELETE') THEN
        /*INSERT INTO person_audit SELECT current_timestamp, 'D', old.id, old.name,
 								 old.age,
 								old. gender,
 								 old.address;*/
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
    END IF;
    RETURN NULL;
END;
$trg_person_audit$ language plpgsql;


create trigger trg_person_audit
	after INSERT or UPDATE or DELETE
	on person for each row 
	execute function fnc_trg_person_audit();
	--drop trigger trg_person_audit on person; 
    --drop function fnc_trg_person_audit();
    --truncate person_audit;
------------------------
INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;
select * from person_audit;
--select * from person;