# ICT171 Cloud Server Blog Project

## Overview
This repository contains the files and documentation for a blog website deployed on an AWS EC2 instance using Apache. The project covers the setup of a cloud server environment, deployment of a static blog, and basic server configuration.

## Project Contents
- Blog website files (HTML, CSS, images)
- Server configuration commands and scripts
- Documentation of the setup process
- Bash script for server updates and Apache restart

## How to Create EC2 Instance
1. Log in to the AWS Management Console.
2. Navigate to the EC2 service and launch a new instance.
3. Choose an Ubuntu Server AMI.
4. Select an instance type (e.g., t2.micro).
5. Configure instance details and add storage.
6. Set up Security Groups allowing:
   - SSH (port 22) — restrict to your IP for security
   - HTTP (port 80)
   - HTTPS (port 443)
7. Launch the instance and download the key pair (`.pem` file).

## How to Install & Configure the Web Server
1. Connect to your EC2 instance via SSH:
   ```bash
   ssh -i /path/to/key.pem ubuntu@your-ec2-ip

2.  Install Apache web server:
    ```bash
    sudo apt install apache2 -y

3.  Confirm firewall (security group) rules are set to allow traffic on ports 22, 80, and 443 if needed.

## How to deploy your blog
1.  Upload your blog files from your local machine to the EC2 instance:
    ```bash
    scp -i /path/to/key.pem -r /local/blog-folder/* ubuntu@your-ec2-ip:/tmp/

2.  Move the files to Apache’s web root directory:
    ```bash
    sudo mv /tmp/* /var/www/html/

3.  Set correct ownership and permissions:
    ```bash
    sudo chown -R www-data:www-data /var/www/html
    sudo chmod -R 755 /var/www/html

4.  Restart Apache to apply changes: 
    ```bash
    sudo systemctl restart apache2

## How to link a domain name
- Purchase a domain name from a registar
- Configure DNS to point the domain to your EC2 instance’s public IP.
- Optionally update Apache configuration to serve your domain.

## How to Enable SSL/TLS with Let’s Encrypt
1.  Install Certbot and the Apache plugin:
    ```bash
    sudo apt install certbot python3-certbot-apache -y

2.  Obtain and install SSL certificate for your domain:
    ```bash
    sudo certbot --apache -d yourdomain.com

3. Certbot will automatically configure Apache for HTTPS.

## Server update and Maintenance Script
Use this script to update your server and restart Apache:
```bash
#!/bin/bash
# Update server packages and restart Apache web server
sudo apt update && sudo apt upgrade -y
sudo systemctl restart apache2
```

Save this script (e.g., update-server.sh)
Make it executable:
```bash
chmod +x update-server.sh
```
Run it regularly.

## Author
Yann Fernandez Puig
Student at Murdoch University
Email: 35608158@student.murdoch.edu.au