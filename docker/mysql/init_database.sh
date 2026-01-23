#!/bin/bash

database_name="BE_196803"
sql_file="scripts/prestashop.sql"
host="mysql"
user="root"
password="student"

mysql -h "$host" -P 3306 -u "$user" -p"$password" -e "SHOW DATABASES;" > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Can't connect to MySQL server."
  exit 1
fi

result=$(mysql -h "$host" -P 3306 -u "$user" -p"$password" -e "SHOW DATABASES LIKE '$database_name';")
if [ $? -ne 0 ]; then
  echo "Failed to check if database '$database_name' exists."
  exit 1
fi

if [ -n "$result" ]; then
  echo "Database '$database_name' already exists."
else
  mysql -h "$host" -P 3306 -u "$user" -p"$password" -e "CREATE DATABASE $database_name;"
  if [ $? -eq 0 ]; then
    echo "Database '$database_name' created successfully."
    if [ -r "$sql_file" ]; then
      mysql -h "$host" -P 3306 -u "$user" -p"$password" "$database_name" < "$sql_file"
      if [ $? -eq 0 ]; then
        echo "Database '$database_name' restored successfully."
      else
        echo "Failed to restore database '$database_name'."
        exit 1
      fi
    else
      echo "SQL file '$sql_file' does not exist or is not readable."
      exit 1
    fi
  else
    echo "Failed to create database '$database_name'."
  fi
fi

echo "Starting Apache server..."
apachectl -D FOREGROUND
