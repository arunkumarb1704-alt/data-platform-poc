# data-platform-poc

Local, cost-free proof of concept for a self-service data platform, built against the Senior Platform Engineer (Cloud and Data) JD.

## Stack
- Postgres (local, Docker) - stands in for BigQuery
- MinIO (local, Docker) - stands in for GCS
- Snowflake (real trial) - named directly in the JD
- Okta (real, Integrator Free Plan) - named directly in the JD
- Terraform - provisions roles and the database
- GitHub Actions - runs terraform plan on every push, against a fresh ephemeral Postgres
- Docker and Kubernetes (Minikube) - runs a sample sync job as a Job resource

## What's implemented
1. Identity: Okta groups (data-readers, data-engineers) mapped to matching Postgres roles
2. Storage: analytics database, customer_orders table, raw-landing-zone bucket
3. Governance: customer_email masked via a view for data_readers; data_engineers see the real table
4. Automation: CI pipeline provisions infra from scratch on every push; a containerized job runs on Kubernetes
5. Observability: Postgres query logging enabled; a script flags direct access to the raw table

## What's simulated vs real
- Postgres/MinIO replace BigQuery/GCS to keep this fully free - production would use the real GCP services
- Okta groups aren't SSO-federated into Postgres directly - production would use SAML/OIDC federation
- The alert script checks the query only, not the calling role yet - a known scoping gap, not an oversight
