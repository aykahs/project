# #!/bin/bash
# set -e

# # -------------------------------
# # Variables
# # -------------------------------
# PROJECT_DIR="/opt/project"
# VENV_DIR="$PROJECT_DIR/.venv"
# DEPLOY_SCRIPT="$PROJECT_DIR/deployment.sh"
# GUNICORN_SERVICE="$PROJECT_DIR/gunicorn/gunicorn.service.txt"
# NGINX_CONF="$PROJECT_DIR/nginx/default.conf"

# # -------------------------------
# # Ensure project directory exists
# # -------------------------------
# mkdir -p $PROJECT_DIR

# # -------------------------------
# # Fix line endings in deployment.sh (in case from Windows)
# # -------------------------------
# if [ -f "$DEPLOY_SCRIPT" ]; then
#     apt-get update
#     apt-get install -y dos2unix
#     dos2unix $DEPLOY_SCRIPT
# fi

# # -------------------------------
# # Make deployment.sh executable
# # -------------------------------
# chmod +x $DEPLOY_SCRIPT

# # -------------------------------
# # Run deployment.sh
# # -------------------------------
# $DEPLOY_SCRIPT

# # -------------------------------
# # Verify Gunicorn is running
# # -------------------------------
# if systemctl is-active --quiet gunicorn; then
#     echo "Gunicorn is running ✅"
# else
#     echo "Gunicorn failed ❌"
#     journalctl -u gunicorn -n 50 --no-pager
# fi

# # -------------------------------
# # Verify Nginx is running
# # -------------------------------
# if systemctl is-active --quiet nginx; then
#     echo "Nginx is running ✅"
# else
#     echo "Nginx failed ❌"
#     nginx -t
# fi

# echo "Deployment complete!"
