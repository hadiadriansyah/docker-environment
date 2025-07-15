<VirtualHost *:80>
    ServerName $SERVER_NAME
    DocumentRoot $DOC_ROOT

    <Directory $DOC_ROOT>
        AllowOverride All
        Require all granted
        DirectoryIndex apache.php index.php index.html
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/$SERVER_NAME_error.log
    CustomLog ${APACHE_LOG_DIR}/$SERVER_NAME_access.log combined
</VirtualHost>