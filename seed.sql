CREATE TABLE IF NOT EXISTS customer_orders (
    customer_id SERIAL PRIMARY KEY,
    customer_email TEXT NOT NULL,
    signup_date DATE NOT NULL
);

INSERT INTO customer_orders (customer_email, signup_date)
VALUES
    ('alice@example.com', '2026-01-15'),
    ('bob@example.com', '2026-02-20'),
    ('carol@example.com', '2026-03-05');