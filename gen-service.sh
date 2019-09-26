#!/bin/bash

echo '#!/bin/bash' > /usr/local/bin/ec2-webserver
echo  $(which python3)' '$(pwd)"/ec2-webserver/webapp/server.py" >> /usr/local/bin/ec2-webserver
chmod +x /usr/local/bin/ec2-webserver

cat <<EOF | sudo tee /etc/systemd/system/ec2-webserver.service
[Unit]
Description=ec2-webserver
Documentation=https://github.com/codemation/ec2-webserver

[Service]
ExecStart=/usr/local/bin/ec2-webserver
Restart=on-failure
RestartSec=5

[Install]
WantedBy=multi-user.target
EOF

#Start ec2-webserver service
{
  sudo systemctl daemon-reload
  sudo systemctl enable ec2-webserver
  sudo systemctl start ec2-webserver
}