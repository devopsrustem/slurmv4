#!/bin/bash
set -e

echo "=== Запуск Open XDMoD контейнера ==="

# Установка переменных по умолчанию
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-changeme_root_password}
XDMOD_DB_PASSWORD=${XDMOD_DB_PASSWORD:-changeme_xdmod_password}

# Создание необходимых директорий
mkdir -p /var/log/mysql
chown mysql:mysql /var/log/mysql

# Инициализация MySQL при первом запуске
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Инициализация MySQL..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql

    # Запуск MySQL для настройки
    mysqld_safe --user=mysql --datadir=/var/lib/mysql &
    sleep 15

    # Ожидание готовности MySQL
    echo "Ожидание готовности MySQL..."
    for i in {1..30}; do
        if mysql -e "SELECT 1" &>/dev/null; then
            break
        fi
        echo "Попытка $i/30..."
        sleep 2
    done
    
    # Настройка root пользователя
    echo "Настройка root пользователя MySQL..."
    mysql -e "UPDATE mysql.user SET Password=PASSWORD('${MYSQL_ROOT_PASSWORD}') WHERE User='root';"
    mysql -e "DELETE FROM mysql.user WHERE User='';"
    mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
    mysql -e "DROP DATABASE IF EXISTS test;"
    mysql -e "FLUSH PRIVILEGES;"
    
    # Создание баз данных для XDMoD
    echo "Создание баз данных XDMoD..."
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE mod_hpcdb;"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE mod_logger;"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE mod_shredder;"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE moddb;"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE modw;"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE modw_aggregates;"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE modw_filters;"
    
    # Создание пользователя XDMoD
    echo "Создание пользователя XDMoD..."
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER 'xdmod'@'localhost' IDENTIFIED BY '${XDMOD_DB_PASSWORD}';"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON mod_hpcdb.* TO 'xdmod'@'localhost';"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON mod_logger.* TO 'xdmod'@'localhost';"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON mod_shredder.* TO 'xdmod'@'localhost';"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON moddb.* TO 'xdmod'@'localhost';"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON modw.* TO 'xdmod'@'localhost';"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON modw_aggregates.* TO 'xdmod'@'localhost';"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL ON modw_filters.* TO 'xdmod'@'localhost';"
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
    
    # Останов MySQL
    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
    sleep 5
    echo "Инициализация MySQL завершена"
fi

# Генерация SSL сертификата
if [ ! -f "/etc/ssl/certs/xdmod-selfsigned.crt" ]; then
    echo "Генерация SSL сертификата..."
    mkdir -p /etc/ssl/{certs,private}
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/ssl/private/xdmod-selfsigned.key \
        -out /etc/ssl/certs/xdmod-selfsigned.crt \
        -subj "/C=RU/ST=Moscow/L=Moscow/O=Company/CN=10.20.90.240"
    chmod 600 /etc/ssl/private/xdmod-selfsigned.key
    echo "SSL сертификат создан"
fi

# Запуск MySQL
echo "Запуск MySQL..."
mysqld_safe --user=mysql --datadir=/var/lib/mysql &
sleep 10

# Проверка доступности SLURM логов
if [ -d "/var/log/slurm" ]; then
    echo "SLURM логи доступны в /var/log/slurm"
    ls -la /var/log/slurm/ | head -5
else
    echo "ВНИМАНИЕ: SLURM логи не обнаружены. Создаем тестовую директорию..."
    mkdir -p /var/log/slurm
    chown slurm:slurm /var/log/slurm 2>/dev/null || true
fi

# Настройка Apache (Rocky Linux)
echo "Настройка Apache..."

# Отключение стандартного SSL конфига Rocky Linux
if [ -f "/etc/httpd/conf.d/ssl.conf" ]; then
    mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.conf.disabled
    echo "Стандартный SSL конфиг отключен"
fi

# В Rocky Linux модули SSL, rewrite, headers уже загружены по умолчанию
echo "Apache модули настроены"

# Настройка cron для SLURM интеграции (создаем заготовку)
if [ ! -f "/etc/cron.d/xdmod" ]; then
    echo "Создание заготовки cron заданий..."
    cat > /etc/cron.d/xdmod << 'EOF'
# Ежедневная обработка данных SLURM в 1:00
# 0 1 * * * xdmod /usr/bin/xdmod-slurm-helper -q -r cluster && /usr/bin/xdmod-ingestor -q

# Еженедельная агрегация данных  
# 0 4 * * 0 xdmod /usr/bin/xdmod-ingestor --aggregate

# Планировщик отчетов
# 0 3 * * * xdmod /usr/bin/php /usr/share/xdmod/classes/ReportTemplateEmailScheduler.php
EOF
fi

# Запуск crond
crond

# Запуск PHP-FPM
mkdir -p /run/php-fpm
php-fpm -D
echo "PHP-FPM запущен"

# Настройка пути к SLURM sacct
if [ -f "/opt/slurm/bin/sacct" ]; then
    echo "Обновление пути к sacct в конфигурации XDMoD..."
    sed -i 's|sacct = "sacct"|sacct = "/opt/slurm/bin/sacct"|g' /etc/xdmod/portal_settings.ini
    echo "Путь к sacct настроен: /opt/slurm/bin/sacct"
fi

echo "=== Open XDMoD контейнер готов ==="
echo "URL: https://localhost:8443"
echo "Для настройки войдите в контейнер: docker exec -it xdmod-container bash"
echo "Затем выполните: xdmod-setup"

# Запуск основного процесса
exec "$@"
