<?php

$pdo = new PDO("sqlsrv:Server=mssql;Database=master", "sa", getenv('DB_PASSWORD'));

$sql = file_get_contents(__DIR__ . '/init.sql');

$pdo->exec($sql);

echo "Database imported successfully!";