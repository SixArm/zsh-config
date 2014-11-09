# apache = /etc/init.d/apache2 || /etc/initd.httpd
[ -e /etc/init.d/apache2 ] && alias apache='sudo /etc/init.d/apache2 '
[ -e /etc/init.d/httpd ] && alias apache='sudo /etc/init.d/httpd '
