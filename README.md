\# data-platform-poc



Local, cost-free proof of concept for a self-service data platform — Postgres and MinIO standing in for BigQuery and GCS, with real Snowflake and Okta trials for the pieces named directly in the JD.



customer-orders-sync runs as a Kubernetes Job (not a Deployment) since it's a one-shot task, not a long-running service.

