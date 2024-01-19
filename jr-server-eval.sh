#!/usr/bin/env sh

print_divider(){
    echo "============================";
}
print_newline(){
    printf "\n";
}

echo "OS Details";
print_divider
    uname -a
print_divider
print_newline

echo "CPU Details";
print_divider
    lscpu
    top -n 1 -b -c
print_divider
print_newline

echo "Memory Details";
print_divider
    free -h
print_divider
print_newline

echo "Disk Details";
print_divider
    lsblk -a
    df -ha
    iostat -dxm 1 3
print_divider
print_newline

echo "Web Server Details";
print_divider
    /usr/sbin/nginx -T | grep -E " server_name | root " | uniq
    php -v
    php -m
print_divider
print_newline

echo "MySQL Details";
print_divider
    mysql -V
    mysql -e 'SHOW VARABILES;'
print_divider
