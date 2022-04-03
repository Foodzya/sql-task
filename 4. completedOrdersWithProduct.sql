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

SELECT co.*, p.name FROM customer_order co
	INNER JOIN product_customer_order p_co ON co.id = p_co.order_id
	INNER JOIN product p ON p_co.product_id = p.id
WHERE co.status = 'Completed'  AND p.name = product_name(6)
ORDER BY co.modifiedDate DESC;