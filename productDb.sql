CREATE DATABASE shopping;

CREATE SCHEMA ecommerce;

SET search_path = ecommerce;

CREATE TABLE IF NOT EXISTS userRole (
	id serial PRIMARY KEY,
	name text UNIQUE
);
	
CREATE TABLE IF NOT EXISTS userAccount (
	id serial PRIMARY KEY, 
	firstName text,
	lastName text,
	email text UNIQUE NOT NULL,
	phoneNumber text NOT NULL,
	userRole_id integer,
	FOREIGN KEY (userRole_id) REFERENCES userRole (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS address (
	id serial PRIMARY KEY,
	streetAddress text,
	postcode int,
	city text,
	userAccount_id integer,
	FOREIGN KEY (userAccount_id) REFERENCES userAccount (id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

CREATE TYPE orderStatus AS ENUM ('In Review', 'In Delivery', 'Completed');

CREATE TABLE IF NOT EXISTS customerOrder (
	id serial PRIMARY KEY,
	modifiedDate timestamp NOT NULL,
	status orderStatus NOT NULL,
	userAccount_id integer,
	FOREIGN KEY (userAccount_id) REFERENCES userAccount (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS brand (
	id serial PRIMARY KEY,
	name text UNIQUE NOT NULL,
	foundationYear int NOT NULL
);

CREATE TABLE IF NOT EXISTS productCategory (
	id serial PRIMARY KEY,
	name text UNIQUE NOT NULL,
	parent_id integer,
	FOREIGN KEY (parent_id) REFERENCES productCategory (id)
		ON UPDATE CASCADE
		ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS section (
	id serial PRIMARY KEY,
	name text UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS productCategory_section (
	id serial PRIMARY KEY,
	section_id integer,
	productCategory_id integer,
	FOREIGN KEY (section_id) REFERENCES section (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (productCategory_id) REFERENCES productCategory (id)
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
	productCategory_id int,
	brand_id int,
	FOREIGN KEY (productCategory_id) REFERENCES productCategory (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (brand_id) REFERENCES brand (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS product_customerOrder (
	id serial PRIMARY KEY,
	quantity integer NOT NULL CHECK (quantity > 0),
	price numeric NOT NULL CHECK (price > 0),
	product_id integer,
	customerOrder_id integer,
	FOREIGN KEY (product_id) REFERENCES product (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT,
	FOREIGN KEY (customerOrder_id) REFERENCES customerOrder (id)
		ON UPDATE CASCADE
		ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS review (
	id serial PRIMARY KEY,
	rating integer NOT NULL CHECK (rating > 0 AND rating <= 5),
	comment text,
	userAccount_id integer,
	product_id integer,
	FOREIGN KEY (userAccount_id) REFERENCES userAccount (id)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	FOREIGN KEY (product_id) REFERENCES product (id)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);		