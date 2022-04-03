create function brand_name (b_id int)
	returns text
	language plpgsql
	as
$$
declare 
	b_name text;
begin
	SELECT b.name INTO b_name FROM brand b WHERE b.id = b_id;
	return b_name;
end;
$$

SELECT product.* FROM product 
LEFT JOIN brand ON product.brand_id = brand.id
WHERE brand.name = product_name(6);
