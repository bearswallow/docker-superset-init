#!/bin/bash

# create database if not exist
mysql -h$MYSQL_HOST -P$MYSQL_PORT -u$MYSQL_USERNAME -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\` CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'"

# Create an admin user
fabmanager create-admin --app superset --username $ADMIN_USERNAME --password $ADMIN_PASSWORD --firstname $ADMIN_FIRSTNAME --lastname $ADMIN_LASTNAME --email $ADMIN_EMAIL

# Initialize the database
superset db upgrade

# Create default roles and permissions
superset init

mysql -h$MYSQL_HOST -P$MYSQL_PORT -u$MYSQL_USERNAME -p$MYSQL_PASSWORD -e "USE \`$DB_NAME\`; DROP TABLE IF EXISTS tb_init;
CREATE TABLE tb_init  (
  init_time datetime NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;
INSERT INTO tb_init values(CURRENT_TIMESTAMP);
"