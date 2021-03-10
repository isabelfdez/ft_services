# Start telegraf
/usr/bin/telegraf &

# Run PHP specifying port and file location
php-fpm7 &

/usr/sbin/nginx -g "daemon off;"