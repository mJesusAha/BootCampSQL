create table person_audit
( created timestamp without time zone default current_timestamp not null,
type_event char(1) default 'I' not null,

row_id bigint not null,
  name varchar,
  age integer,
  gender varchar,
  address varchar
  );

alter table person_audit add constraint ch_type_event check ( type_event in ('I','D', 'U') );
----select * from person_audit;
--drop table person_audit;

create or replace function fnc_trg_person_insert_audit()
returns trigger  as 
$trg_person_insert_audit$
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

$trg_person_insert_audit$
language plpgsql;
create trigger trg_person_insert_audit
	after insert on person for each row 
	execute function fnc_trg_person_insert_audit();
	--drop trigger trg_person_insert_audit on person 

INSERT INTO person(id, name, age, gender, address) VALUES (10, 'Damir', 22, 'male', 'Irkutsk');
select * from person_audit; 