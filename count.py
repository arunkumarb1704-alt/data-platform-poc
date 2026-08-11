import os
import psycopg2

conn = psycopg2.connect(
    host=os.environ.get("PG_HOST", "localhost"),
    port=os.environ.get("PG_PORT", "5432"),
    dbname="analytics",
    user="postgres",
    password="localdev",
)
cur = conn.cursor()
cur.execute("SELECT COUNT(*) FROM customer_orders;")
count = cur.fetchone()[0]
print(f"customer_orders row count: {count}")
cur.close()
conn.close()