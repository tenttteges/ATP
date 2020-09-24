DROP TABLE IF EXISTS order_products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS product_categories;


CREATE TABLE product_categories (
    category VARCHAR(20),
    category_description TEXT,
    PRIMARY KEY(category)
);

CREATE TABLE products (
    product_code VARCHAR(20) NOT NULL,
    name VARCHAR(50) NOT NULL,
    price NUMERIC(8, 2) NOT NULL, -- 999999.99
    category VARCHAR(20),
    description TEXT,
    
    PRIMARY KEY(product_code),
    FOREIGN KEY(category) REFERENCES product_categories(category)
);

-- ewentualnie: stany magazynowe

CREATE TABLE customers (
    customer_email VARCHAR(50) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(200) NOT NULL,
    postal_code VARCHAR(6) NOT NULL,
    city VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(customer_email)
);

CREATE TABLE orders (
    order_id SERIAL NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    order_date TIMESTAMP WITH TIME ZONE,
    -- ew. dalsze informacje o realizacji zamówienia

    PRIMARY KEY(order_id),
    FOREIGN KEY(customer_email) REFERENCES customers(customer_email)
);

CREATE TABLE order_products (
    order_id INTEGER NOT NULL,
    product_code VARCHAR(20) NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    actual_price NUMERIC(8, 2) NOT NULL,
    
    PRIMARY KEY(order_id, product_code),
    FOREIGN KEY(order_id) REFERENCES orders(order_id),
    FOREIGN KEY(product_code) REFERENCES products(product_code)
);

INSERT INTO product_categories (category, category_description) VALUES
    ('LP', 'Laptop'),
    ('TELE', 'Telefony'),
	('TV', 'Telewizory');

INSERT INTO products(product_code, name, price, category) VALUES
('TV1', 'Telewizor Samsung', 2399.00, 'TV'),
('TV2', 'Telewizor Panasonic', 2500.00, 'TV'),
('i8', 'iPhone 8', 1234.56, 'TELE');



