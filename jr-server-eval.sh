#!/usr/bin/env sh

#
# JetRails Server Evaluation Script
#

print_divider(){
    echo "============================";
}
print_newline(){
    printf "\n";
}

## Begin OS Details
echo "OS Details";
print_divider
    uname -a
print_divider
print_newline
## End OS Details

## Begin CPU Details
echo "CPU Details";
print_divider
    lscpu
    top -n 1 -b -c
print_divider
print_newline
## End CPU Details

## Begin Memory Details
echo "Memory Details";
print_divider
    free -h
print_divider
print_newline
## End Memory Details

## Begin Disk Details
echo "Disk Details";
print_divider
    lsblk -a
    df -ha
    iostat -dxm 1 3
print_divider
print_newline
## End Disk Details

## Begin Web Server Details
echo "Web Server Details";
print_divider

webserver="";
if [ ! -z "$(ps auxf |grep -E -i nginx |grep -v grep)" ]; then 
    echo "Web Server: NGINX"; webserver=nginx; 
fi
if [ ! -z "$(ps auxf |grep -E -i httpd\|apache |grep -v grep)" ]; then 
    echo "Web Server: Apache"; webserver=apache; 
fi
if [ -z "$webserver" ]; then 
echo "Unknown Webserver"; 
fi

if [ $webserver=nginx ]; then 
    /usr/sbin/nginx -T | grep -E " server_name | root " | uniq
fi
    php -v
    php -m
print_divider
print_newline
## End Web Server Details

## Begin MySQL Details
echo "MySQL Details";
print_divider
    mysql -V
    mysql -s -N -e 'SHOW VARIABLES;'
print_divider
## End MySQL Details