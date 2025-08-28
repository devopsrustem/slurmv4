FROM rockylinux:8

# Установка переменных окружения
ENV CONTAINER=docker

# Обновление системы и установка EPEL
RUN dnf update -y && \
    dnf install -y epel-release && \
    dnf clean all

# Установка PHP 7.4 (критично для Open XDMoD)
RUN dnf module -y reset php && \
    dnf module -y enable php:7.4

# Установка Node.js 16 (требование Open XDMoD)  
RUN dnf module -y reset nodejs && \
    dnf module -y install nodejs:16

# Установка основных зависимостей
# Установка основных зависимостей
RUN dnf install -y \
    httpd \
    php php-cli php-fpm php-mysqlnd php-gd php-xml php-mbstring \
    php-curl php-opcache php-readline php-pdo php-intl php-json php-bcmath \
    mariadb-server mariadb \
    mod_ssl mod_security \
    cronie logrotate postfix \
    wget curl tar gzip \
    sudo vim nano openssl

# Установка Open XDMoD из официального RPM
RUN wget https://github.com/ubccr/xdmod/releases/download/v11.0.1-1/xdmod-11.0.1-1.el8.noarch.rpm && \
    dnf install -y xdmod-11.0.1-1.el8.noarch.rpm && \
    rm xdmod-11.0.1-1.el8.noarch.rpm

# Создание пользователя xdmod
#RUN groupadd -r xdmod && \
#    useradd -r -M -c "Open XDMoD" -g xdmod \
#    -d /etc/xdmod -s /sbin/nologin xdmod

# Настройка PHP для Open XDMoD
RUN echo "date.timezone = Europe/Moscow" >> /etc/php.ini && \
    echo "memory_limit = 512M" >> /etc/php.ini && \
    echo "max_execution_time = 300" >> /etc/php.ini

# Создание директорий
RUN mkdir -p /var/log/xdmod /var/lib/mysql /opt/xdmod-data && \
    chown -R mysql:mysql /var/lib/mysql && \
    chown -R apache:xdmod /var/log/xdmod

# Копирование конфигурационных файлов
COPY config/mysql/my.cnf /etc/my.cnf
COPY config/apache/xdmod.conf /etc/httpd/conf.d/xdmod.conf
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

# Права на выполнение
RUN chmod +x /usr/local/bin/entrypoint.sh

# Проброс портов
EXPOSE 80 443 3306

# Монтируемые директории
VOLUME ["/var/lib/mysql", "/var/log/slurm", "/var/spool/slurm", "/opt/xdmod-data"]

# Точка входа
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["httpd", "-D", "FOREGROUND"]
