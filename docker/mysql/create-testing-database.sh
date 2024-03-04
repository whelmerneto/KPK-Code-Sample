#!/usr/bin/env bash

mysql --user=root --password="$MYSQL_ROOT_PASSWORD" <<-EOSQL
    CREATE DATABASE IF NOT EXISTS plataforma;
    CREATE DATABASE IF NOT EXISTS telescope;
    CREATE DATABASE IF NOT EXISTS master_testing;
    CREATE DATABASE IF NOT EXISTS plataforma_testing;
    GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';
EOSQL
