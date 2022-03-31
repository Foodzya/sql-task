create function section_name (s_id int)
	returns text
	language plpgsql
	as
$$
declare 
	s_name text;
begin
	SELECT s.name INTO s_name FROM section s WHERE s.id = s_id;
	return s_name;
end;
$$

create function category_name (pc_id int)
	returns text
	language plpgsql
	as
$$
declare 
	pc_name text;
begin 
	SELECT pc.name INTO pc_name FROM productCategory pc WHERE pc.id = pc_id;
	return pc_name;
end;
$$

SELECT p.name, p.quantity, pc.name, s.name  
FROM section s
	INNER JOIN productCategory_section pcs ON s.id = pcs.section_id
	INNER JOIN productCategory pc ON pcs.productCategory_id = pc.id
	INNER JOIN product p ON pc.id = p.productCategory_id
WHERE s.name = section_name(1) AND pc.name = category_name(1);