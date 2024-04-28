CREATE TABLE contacts(
	contact_id INT PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(80) NOT NULL
);

SELECT * FROM contacts;


CREATE TABLE category(
	category_id VARCHAR(15) PRIMARY KEY,
	category VARCHAR(15) NOT NULL
);

SELECT * FROM category;

CREATE TABLE subcategory(
	subcategory_id VARCHAR(15) PRIMARY KEY, 
	subcategory VARCHAR(20) NOT NULL
);


SELECT * FROM subcategory;

CREATE TABLE campaign(
	cf_id INT PRIMARY KEY, 
	contact_id INT NOT NULL,
	company_name VARCHAR(50) NOT NULL,
	description VARCHAR(100) NOT NULL,
	goal DEC NOT NULL,
	pledged DEC NOT NULL,
	outcome VARCHAR(12) NOT NULL,
	backers_count INT NOT NULL,
	country VARCHAR(10) NOT NULL,
	currency VARCHAR(10) NOT NULL,
	launched_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR(15) NOT NULL,
	subcategory_id VARCHAR(15) NOT NULL,
	FOREIGN KEY (category_id) REFERENCES category(category_id),
	FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
	FOREIGN KEY (subcategory_id) REFERENCES subcategory(subcategory_id)
);

SELECT * FROM campaign;





