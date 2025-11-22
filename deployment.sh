#!/bin/bash
set -e

echo "Copying gunicorn.service..."
cp /opt/project/gunicorn/gunicorn.service.txt /etc/systemd/system/gunicorn.service

echo "Copying default nginx config..."
cp /opt/project/nginx/default.conf /etc/nginx/sites-enabled/default


ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
nginx -t
echo "Reloading systemd..."
systemctl daemon-reload

echo "Restarting gunicorn..."
systemctl restart gunicorn
systemctl enable gunicorn

echo "Restarting nginx..."
systemctl restart nginx
systemctl enable nginx

echo "Setup complete!"
