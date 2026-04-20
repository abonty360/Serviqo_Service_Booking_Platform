#!/bin/bash

echo "STEP 1: Waiting for SQL Server..."

# Wait for SQL Server with timeout (60 seconds)
COUNTER=0
MAX_ATTEMPTS=30

until /opt/mssql-tools18/bin/sqlcmd -h -1 -S tcp:mssql,1433 -U sa -P StrongPass!123 -Q "SELECT 1" > /dev/null 2>&1
do
  COUNTER=$((COUNTER+1))
  if [ $COUNTER -ge $MAX_ATTEMPTS ]; then
    echo "⚠️  SQL Server not responding after 60 seconds, continuing anyway..."
    break
  fi
  echo "Attempt $COUNTER/$MAX_ATTEMPTS: Still waiting..."
  sleep 2
done

echo "STEP 2: SQL Server connection attempt complete!"

echo "STEP 3: Running init.sql..."

timeout 60 /opt/mssql-tools18/bin/sqlcmd -S tcp:mssql,1433 -U sa -P StrongPass!123 -C -i /var/www/database/init.sql

if [ $? -ne 0 ]; then
  echo "⚠️  Database initialization had issues, but continuing..."
fi

echo "STEP 4: Database initialized successfully!"

echo "STEP 5: Starting PHP-FPM..."

exec php-fpm