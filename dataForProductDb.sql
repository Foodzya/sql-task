INSERT INTO userRole (name) VALUES 
	('Admin'),
	('Customer');
	
INSERT INTO brand (name, foundationYear) VALUES 
	('Nike', 1965),
	('Adidas', 1949),
	('Puma', 1948),
	('New Balance', 1906),
	('Zara', 1975),
	('The North Face', 1968),
	('Levis', 1853),
	('Hugo Boss', 1924),
	('Calvin Klein', 1968),
	('Gucci', 1921);
	
INSERT INTO productCategory (name, parent_id) VALUES 
	('Shoes', NULL),
	('Sneakers', 1),
	('Sandals', 1),
	('Boots', 1),
	('Tops', NULL),
	('Hoodies/Sweetshirts', 5),
	('Polos/Rugbies', 5),
	('T-Shirts', 5),
	('Bottoms', NULL),
	('Joggers', 9),
	('Jeans', 9),
	('Shorts', 9);
	
INSERT INTO product (name, price, quantity, description, image, productCategory_id, brand_id) VALUES
	('Nike Cortez', 75, 10, 'Classic Nike Cortez, everyday sneakers', 'https://images.asos-media.com/products/belo-chernye-kozhanye-krossovki-nike-cortez/11115384-1-whiteblack?$n_640w$&wid=513&fit=constrain', 2, 1),
	('Adidas Superstar', 41, 5, 'The Adidas Superstar is the brand’s magnum opus', 'https://media.gq-magazine.co.uk/photos/621e40469c02050e132ba72c/master/w_1600%2Cc_limit/Adidas_0008_Superstar.jpg', 2, 2),
	('Puma Shibui Cat Slide Sandal', 40, 10, 'Smooth finish and lightweight design', 'https://images.urbndata.com/is/image/UrbanOutfitters/64930076_030_b?$xlarge$&fit=constrain&fmt=webp&qlt=80&wid=640', 3, 3),
	('The North Face Parks Tee', 29, 13, 'Short sleeve tee by The North Face with graphics printed at the left chest & back', 'https://images.urbndata.com/is/image/UrbanOutfitters/61743522_040_b?$xlarge$&fit=constrain&fmt=webp&qlt=80&wid=640', 8, 6),
	('Urban Renewal Levi’s 505 5” Cutoff Denim Short', 54, 5, 'Relaxed silhouette with 5-pocket styling, a button waist closure and a cutoff hemline', 'https://images.urbndata.com/is/image/UrbanOutfitters/67693655_001_b?$xlarge$&fit=constrain&fmt=webp&qlt=80&wid=640', 12, 7),
	('Adidas Ozweego', 90, 15, 'Classic Ozweego!', 'https://assets.adidas.com/images/w_600,f_auto,q_auto/fabe259e569a47e7ac33ada20183d80d_9366/OZWEEGO_Shoes_Beige_GX3322_01_standard.jpg', 2, 2),
	('HOODED RIB SWEATSHIRT', 30, 10, 'Cropped hooded sweatshirt with long sleeves. Side vents at hem. Rib trim.', 'https://static.zara.net/photos///2021/I/0/1/p/6050/891/511/2/w/850/6050891511_6_1_1.jpg?ts=1637601497447', 6, 5),
	('WHERES WALDO? ®STRIPED T-SHIRT', 35, 5, 'Round neck top with short sleeves. Where’s Waldo?', 'https://static.zara.net/photos///2022/V/0/1/p/4644/323/060/2/w/850/4644323060_6_1_1.jpg?ts=1647597570415', 8, 5);

INSERT INTO userAccount (firstName, lastName, email, phoneNumber, userRole_id) VALUES
	('Melissa', 'Johnson', 'MelissaBJohnson@rhyta.com', '773-381-9604', 2),
	('Lisa', 'Hall', 'LisaKHall@rhyta.com', '917-243-7722', 2),
	('Jason', 'Chaplin', 'JasonCChaplin@armyspy.com', '949-733-7814', 2),
	('William', 'Campbell', 'WilliamNCampbell@rhyta.com', '530-888-5878', 2),
	('James', 'Hein', 'adminjames@spy.com', '339', 1);


INSERT INTO section (name) VALUES
	('Man'),
	('Woman');

INSERT INTO productCategory_section (section_id, productCategory_id) VALUES
	(1, 2),
	(2, 2),
	(1, 3),
	(1, 6),
	(2, 6),
	(1, 9),
	(1, 7),
	(1, 8),
	(1, 12),
	(2, 12);

INSERT INTO customerOrder (modifiedDate, status, userAccount_id) VALUES 
	('2022-03-29 15:35:00', 'Completed', 1),
	('2022-01-11 09:00:00', 'In Delivery', 4),
	('2021-12-20 13:24:00', 'Completed', 2),
	('2022-04-20 11:35:50', 'Completed', 3),
	('2020-07-19 12:31:09', 'Completed', 1);

INSERT INTO product_customerOrder (quantity, price, product_id, customerOrder_id) VALUES
	(3, 270, 6, 3),
	(1, 90, 6, 4),
	(3, 57, 4, 1),
	(1, 41, 2, 2),
	(1, 75, 1, 5);

INSERT INTO review (rating, comment, userAccount_id, product_id) VALUES 
	(5, 'Top sneakers! Highly recommend!', 1, 6),
	(2, 'Low quality shoes, idk why everybody likes it', 2, 2),
	(4, 'Good t-shirt, 2 months already and no probs', 1, 8),
	(5, 'I really like TNF brand, high material quality!', 4, 4);

	
	
