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

CREATE VIEW product_review AS
SELECT r.rating, r.comment, ua.* FROM review r
	INNER JOIN product p ON p.id = r.product_id
	INNER JOIN user_account ua ON r.user_id = ua.id
WHERE p.name = product_name(6);

SELECT * FROM product_review;

