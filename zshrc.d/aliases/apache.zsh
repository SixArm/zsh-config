# Alias for Apache webserver

if [ -e /etc/init.d/apache2 ]; then
    alias apache='sudo /etc/init.d/apache2 '
elif [ -e /etc/init.d/httpd ]; then
    alias apache='sudo /etc/init.d/httpd '
fi
