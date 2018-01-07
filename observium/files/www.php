[www]
user = apache
group = apache

listen = /var/run/php-fpm/php7.0-fpm.sock
listen.owner = nginx
listen.group = nginx
listen.mode = 0660
listen.acl_users = apache,nginx
listen.allowed_clients = 127.0.0.1

pm = dynamic
pm.max_children = 50
pm.start_servers = 5
pm.min_spare_servers = 5
pm.max_spare_servers = 35
 
slowlog = /var/log/php-fpm/www-slow.log
 
php_flag[display_errors] = on
php_admin_value[error_log] = /var/log/php-fpm/www-error.log
php_admin_flag[log_errors] = on
php_value[session.save_handler] = files
php_value[session.save_path]    = /var/lib/php/session
php_value[soap.wsdl_cache_dir]  = /var/lib/php/wsdlcache
