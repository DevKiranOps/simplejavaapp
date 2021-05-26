#!/bin/sh
yum update && yum upgrade -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

#Opening Firewall Port 80 on the VM
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload


/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync