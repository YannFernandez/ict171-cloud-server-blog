# ICT171 Cloud Server Blog Project

## Project Overview
This project hosts a personal blog on an AWS EC2 instance running Ubuntu with Apache web server.

---

## Table of Contents
- [EC2 Instance Setup](#ec2-instance-setup)
- [Web Server Installation](#web-server-installation)
- [Deploying the Blog](#deploying-the-blog)
- [Domain Name Setup](#domain-name-setup)
- [SSL/TLS Setup (Future)](#ssltls-setup-future)
- [Maintenance Script](#maintenance-script)
- [Video Explainer](#video-explainer)
- [Contact](#contact)

---

## EC2 Instance Setup
- Created EC2 Ubuntu instance via AWS Management Console.
- Configured security group to allow ports:
  - 22 (SSH)
  - 80 (HTTP)
  - 443 (HTTPS) (future)
- Connected using SSH and private key.

---

## Web Server Installation
Commands used to install and configure Apache:

```bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
