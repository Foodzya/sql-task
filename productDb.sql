CREATE DATABASE shopping;

CREATE SCHEMA ecommerce;

SET search_path = ecommerce;

CREATE TABLE IF NOT EXISTS user_role (
	id serial PRIMARY KEY,
	name text UNIQUE
);
	
CREATE TABLE IF NOT EXISTS user_account (
	id serial PRIMARY KEY, 
	firstName text,
	lastName text,
	email text UNIQUE NOT NULL,
	phoneNumber text NOT NULL,
	role_id integer,
	FOREIGN KEY (role_id) REFERENCES user_role (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS address (
	id serial PRIMARY KEY,
	streetAddress text,
	postcode int,
	city text,
	user_id integer,
	FOREIGN KEY (user_id) REFERENCES user_account (id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

CREATE TYPE orderStatus AS ENUM ('In Review', 'In Delivery', 'Completed');

CREATE TABLE IF NOT EXISTS customer_order (
	id serial PRIMARY KEY,
	modifiedDate timestamp NOT NULL,
	status orderStatus NOT NULL,
	user_id integer,
	FOREIGN KEY (user_id) REFERENCES user_account (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS brand (
	id serial PRIMARY KEY,
	name text UNIQUE NOT NULL,
	foundationYear int NOT NULL
);

CREATE TABLE IF NOT EXISTS product_category (
	id serial PRIMARY KEY,
	name text UNIQUE NOT NULL,
	parent_id integer,
	FOREIGN KEY (parent_id) REFERENCES product_category (id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS section (
	id serial PRIMARY KEY,
	name text UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS product_category_section (
	id serial PRIMARY KEY,
	section_id integer,
	category_id integer,
	FOREIGN KEY (section_id) REFERENCES section (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (category_id) REFERENCES product_category (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS product (
	id serial PRIMARY KEY,
	name text UNIQUE NOT NULL,
	price numeric NOT NULL CHECK (price > 0),
	quantity int NOT NULL CHECK (quantity >= 0),
	description text,
	image text,
	category_id int,
	brand_id int,
	FOREIGN KEY (category_id) REFERENCES product_category (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (brand_id) REFERENCES brand (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS product_customer_order (
	id serial PRIMARY KEY,
	quantity integer NOT NULL CHECK (quantity > 0),
	price numeric NOT NULL CHECK (price > 0),
	product_id integer,
	order_id integer,
	FOREIGN KEY (product_id) REFERENCES product (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (order_id) REFERENCES customer_order (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS review (
	id serial PRIMARY KEY,
	rating integer NOT NULL CHECK (rating > 0 AND rating <= 5),
	comment text,
	user_id integer,
	product_id integer,
	FOREIGN KEY (user_id) REFERENCES user_account (id)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	FOREIGN KEY (product_id) REFERENCES product (id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);		