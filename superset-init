#!/bin/bash

# create database if not exist
mysql -u$MYSQL_USERNAME -h$MYSQL_HOST -P$MYSQL_PORT -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS superset CHARACTER SET 'utf8' COLLATE 'utf8_general_ci'"

# Create an admin user
fabmanager create-admin --app superset --username $ADMIN_USERNAME --password $ADMIN_PASSWORD --firstname $ADMIN_FIRSTNAME --lastname $ADMIN_LASTNAME --email $ADMIN_EMAIL

# Initialize the database
superset db upgrade

# Create default roles and permissions
superset init