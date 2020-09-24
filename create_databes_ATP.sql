DROP TABLE IF EXISTS employers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS job_offers;
DROP TABLE IF EXISTS job_offer_responses;


CREATE TABLE job_offer_responses (
    offer_id SERIAL NOT NULL,
    employee_id SERIAL NOT NULL,
    PRIMARY KEY(offer_id, employee_id)
	FOREIGN KEY(offer_id) REFERENCES job_offers(offer_id)
	FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE job_offers (
    offer_id SERIAL NOT NULL,
    employer_id SERIAL NOT NULL,
    offer_name VARCHAR(50),
    offer_description TEXT,
    
    PRIMARY KEY(offer_id, employer_id),
    FOREIGN KEY(employer_id) REFERENCES employers(employer_id)
);


CREATE TABLE employees (
    employee_id SERIAL NOT NULL
    employee_phone VARCHAR(30) NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    employee_address VARCHAR(200) NOT NULL,
    employee_postal_code VARCHAR(6) NOT NULL,
    employee_city VARCHAR(50) NOT NULL,
	employee_cv 
    
    PRIMARY KEY(employee_id)
);

CREATE TABLE employers (
    employer_id SERIAL NOT NULL,
    employer_phone VARCHAR(30) NOT NULL,
    employer_name VARCHAR(100) NOT NULL,
    employer_address VARCHAR(200) NOT NULL,
    employer_postal_code VARCHAR(6) NOT NULL,
    employer_city VARCHAR(50) NOT NULL,
	
    PRIMARY KEY(employer_id),
);





