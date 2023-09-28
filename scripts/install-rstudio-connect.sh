#!/bin/bash

# Update the system packages
sudo yum update -y

# Install R
sudo yum install R -y

# Install RStudio Connect
wget https://download2.rstudio.org/rstudio-connect-rhel-1.1.442-x86_64.rpm
sudo yum install rstudio-connect-rhel-1.1.442-x86_64.rpm

# Start RStudio Connect
sudo systemctl start rstudio-connect

# Enable RStudio Connect to start on boot
sudo systemctl enable rstudio-connect

# Open the RStudio Connect firewall port
sudo firewall-cmd --zone=public --permanent --add-port=8787/tcp
sudo firewall-cmd --reload

# Print the RStudio Connect URL
echo "RStudio Connect is running at https://$(curl -s ifconfig.me):8787"
