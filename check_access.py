import subprocess

result = subprocess.run(
    ["docker", "logs", "data-platform-poc-postgres-1", "--tail", "100"],
    capture_output=True, text=True
)
logs = result.stdout + result.stderr

alert_triggered = False
for line in logs.splitlines():
    if "customer_orders;" in line and "customer_orders_masked" not in line and "CREATE" not in line:
        print(f"ALERT: possible direct access to raw table -> {line}")
        alert_triggered = True

if not alert_triggered:
    print("No unauthorized raw-table access detected.")