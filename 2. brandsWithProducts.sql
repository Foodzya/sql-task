SELECT b.name, count (b.id) product_count FROM product p 
	LEFT JOIN brand b ON p.brand_id = b.id
	GROUP BY b.id
	ORDER BY product_count DESC;