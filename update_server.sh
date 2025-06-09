#!/bin/bash
# Update server packages and restart Apache web server
sudo apt update && sudo apt upgrade -y
sudo systemctl restart apache2
