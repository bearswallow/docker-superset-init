FROM amancevice/superset

# 防止apt-get和dpkg命令执行过程中出现对话框
ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN mkdir ~/downloads && \
    cd ~/downloads && \
    curl -O https://repo.mysql.com//mysql-apt-config_0.8.9-1_all.deb && \
    apt-get install -y \
        lsb-release \
        wget \
        apt-utils && \
    dpkg -i mysql-apt-config_0.8.9-1_all.deb && \
    apt-get update && \
    apt-get install -y \
        mysql-community-client

ENV MYSQL_HOST=galera-lb.galera \
    MYSQL_PORT=3306 \
    MYSQL_USERNAME=root \
    MYSQL_PASSWORD=gt86589089 \
    DB_NAME=superset \
    ADMIN_USERNAME=admin \
    ADMIN_PASSWORD=123456 \
    ADMIN_FIRSTNAME=gtintel \
    ADMIN_LASTNAME=gtintel \
    ADMIN_EMAIL=chengx@gtintel.cn

COPY ["superset-init.sh", "/usr/local/bin/"]
COPY ["superset_config.py", "/etc/superset/"]

RUN chmod +x /usr/local/bin/superset-init.sh

ENTRYPOINT ["sh"]
CMD ["/usr/local/bin/superset-init.sh"]
