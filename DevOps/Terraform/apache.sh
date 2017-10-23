#!/bin/sh

sudo yum install -y httpd

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>Hello
World</title>
</head>
<body>
<h1>Hello
World!</h1>
</body>
</html>
EOF
sudo service httpd start
