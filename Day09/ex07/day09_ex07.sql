create or replace function func_minimum
							(variadic arr float[])
returns float
as
$$

	select min($1[i])from generate_subscripts($1, 1) g(i);

$$
language sql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);