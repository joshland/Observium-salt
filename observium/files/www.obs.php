[www]
user   = apache
group  = apache
listen = /run/php-fpm/www.sock
listen.acl_users       = apache,nginx
listen.allowed_clients = 127.0.0.1

pm = dynamic
pm.max_children      = 50
pm.start_servers     = 2
pm.min_spare_servers = 2
pm.max_spare_servers = 5
 
slowlog = /var/log/php-fpm/www-slow.log
 
php_flag[display_errors]   = on
php_admin_value[error_log] = /var/log/php-fpm/www-error.log
php_admin_flag[log_errors] = on
php_admin_value[memory_limit] = 256M

php_value[session.save_handler] = files
php_value[session.save_path]    = /var/lib/php/session
php_value[soap.wsdl_cache_dir]  = /var/lib/php/wsdlcache
