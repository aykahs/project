#!/bin/bash
set -e

# -----------------------------
# Install Nginx and other dependencies
# -----------------------------
sudo yum update -y
sudo yum install -y nginx python3 python3-pip python3-venv amazon-efs-utils

# -----------------------------
# Create project directories if not exist
# -----------------------------
sudo mkdir -p /opt/project
sudo chown ec2-user:ec2-user /opt/project
sudo chmod 755 /opt/project

# -----------------------------
# Copy Gunicorn service
# -----------------------------
echo "Copying gunicorn.service..."
sudo cp /opt/project/gunicorn/gunicorn.service.txt /etc/systemd/system/gunicorn.service

# -----------------------------
# Copy Nginx config
# -----------------------------
echo "Copying default nginx config..."
sudo cp /opt/project/nginx/default.conf /etc/nginx/nginx.conf

# Test Nginx configuration
sudo nginx -t

# -----------------------------
# Reload systemd and restart services
# -----------------------------
echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Restarting gunicorn..."
sudo systemctl restart gunicorn
sudo systemctl enable gunicorn

echo "Restarting nginx..."
sudo systemctl restart nginx
sudo systemctl enable nginx

echo "Setup complete!"
