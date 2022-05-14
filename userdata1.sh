echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
service sshd restart

echo "password123" | passwd root --stdin
sed  -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
service sshd restart

yum install httpd -y
systemctl enable httpd
systemctl restart httpd

cat <<EOF > /var/www/html/index.html
<html>
<body bgcolor='#CC9900'>
        <h1>Hello World</h1>
</body>
</html>
EOF
