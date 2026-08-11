REVOKE ALL ON customer_orders FROM data_readers;
GRANT SELECT ON customer_orders TO data_engineers;
GRANT USAGE ON SCHEMA public TO data_readers, data_engineers;

CREATE VIEW customer_orders_masked AS
SELECT
  customer_id,
  regexp_replace(customer_email, '(.{2}).*(@.*)', '\1***\2') AS customer_email,
  signup_date
FROM customer_orders;

GRANT SELECT ON customer_orders_masked TO data_readers;