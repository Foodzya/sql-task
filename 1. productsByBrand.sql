create function product_name (p_id int)
	returns text
	language plpgsql
	as
$$
declare 
	p_name text;
begin
	SELECT p.name INTO p_name FROM product p WHERE p.id = p_id;
	return p_name;
end;
$$

SELECT product.* FROM product 
LEFT JOIN brand ON product.brand_id = brand.id
WHERE brand.name = product_name(6);
