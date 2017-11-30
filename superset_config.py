import os

# The SQLAlchemy connection string to your database backend
# This connection defines the path to the database that stores your
# superset metadata (slices, connections, tables, dashboards, ...).
# Note that the connection information to connect to the datasources
# you want to explore are managed directly in the web UI
mysqlHost = os.getenv('MYSQL_HOST')
mysqlPort = os.getenv('MYSQL_PORT')
mysqlUsername = os.getenv('MYSQL_USERNAME')
mysqlPassword = os.getenv('MYSQL_PASSWORD')
SQLALCHEMY_DATABASE_URI = 'mysql://%s:%s@%s:%s/superset' % tuple([mysqlUsername, mysqlPassword, mysqlHost, mysqlPort])