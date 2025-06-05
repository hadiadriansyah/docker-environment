#!/bin/bash

VHOST_CONF="/etc/apache2/sites-available/${SERVER_NAME}.conf"
TEMPLATE_PATH="/vhost-template/vhost.tpl"

# Replace placeholders with values from ENV
envsubst < "$TEMPLATE_PATH" > "$VHOST_CONF"

# Enable virtual host
a2ensite "${SERVER_NAME}.conf"
a2dissite 000-default.conf

# Start Apache
exec apache2-foreground

