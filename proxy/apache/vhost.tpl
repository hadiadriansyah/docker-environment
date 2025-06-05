<VirtualHost *:80>
    ServerName {{SERVER_NAME}}
    DocumentRoot {{DOC_ROOT}}

    <Directory {{DOC_ROOT}}>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/{{SERVER_NAME}}_error.log
    CustomLog ${APACHE_LOG_DIR}/{{SERVER_NAME}}_access.log combined
</VirtualHost>