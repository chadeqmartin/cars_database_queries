drop table if exists AppUser cascade;
drop table if exists UserProfile cascade;
drop table if exists CarModel cascade;
drop table if exists Car cascade;
drop table if exists Advertisement cascade;


CREATE TABLE AppUser (
	account_id SERIAL PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL,
	CHECK(first_name !~ '\s' AND last_name !~ '\s'),
	CHECK (email ~* '^\w+@\w+[.]\w+$'),
	CHECK (char_length(password)>=8)
);


CREATE TABLE UserProfile (
	profile_id SERIAL PRIMARY KEY,
	account_id INT NOT NULL REFERENCES AppUser(account_id),
	street_name TEXT NOT NULL,
	street_number TEXT NOT NULL,
	zip_code TEXT NOT NULL,
	city TEXT NOT NULL
);


CREATE TABLE CarModel
(
	car_model_id SERIAL PRIMARY KEY,
	make TEXT,
	model TEXT,
	UNIQUE (make, model)
);


CREATE TABLE Car (
	car_id SERIAL PRIMARY KEY,
	number_of_owners INT NOT NULL,
	registration_number TEXT UNIQUE NOT NULL,
	manufacture_year INT NOT NULL,
	number_of_doors INT DEFAULT 5 NOT NULL,
	car_model_id INT NOT NULL REFERENCES CarModel(car_model_id),
	mileage INT
);


CREATE TABLE Advertisement(
	advertisement_id SERIAL PRIMARY KEY,
	advertisement_date TIMESTAMP WITH TIME ZONE NOT  NULL,
	car_id INT NOT NULL REFERENCES Car(car_id),
	seller_account_id INT NOT NULL REFERENCES AppUser(account_id)
);
