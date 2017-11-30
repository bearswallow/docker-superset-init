# docker-superset-init
Dockerfile and config files for superset initializer, using mysql as metadata storage.

# docker specification
```
docker run -d --name=superset-init malebear311/docker-superset-init
```

You must execute the initializer only once. It will create superset metadata database, create tables, generate default admin account and generate default permission data.

You can specify following ENVs when execute docker run command. So the container will create with your config.
- mysql config
    - MYSQL_HOST: mysql server host.
    - MYSQL_PORT: mysql server port.
    - MYSQL_USERNAME: mysql server username. The mysql user must have the privilege to create database and create tables.
    - MYSQL_PASSWORD: mysql server user password.
- admin account
    - ADMIN_USERNAME: admin username.
    - ADMIN_PASSWORD: admin password.
    - ADMIN_FIRSTNAME: admin first name.
    - ADMIN_LASTNAME: admin last name.
    - ADMIN_EMAIL: admin email.