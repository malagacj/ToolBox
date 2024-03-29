#!/usr/bin/env bash

# https://www.influxdata.com/downloads/

# influxdata-archive_compat.key GPG fingerprint:
#     9D53 9D90 D332 8DC7 D6C8 D3B9 D8FF 8E1F 7DF8 B07E

wget -q https://repos.influxdata.com/influxdata-archive_compat.key

echo '393e8779c89ac8d958f81f942f9ad7fb82a25e133faddaf92e15b16e6ac9ce4c influxdata-archive_compat.key' | sha256sum -c && cat influxdata-archive_compat.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg > /dev/null

echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive_compat.gpg] https://repos.influxdata.com/debian stable main' | sudo tee /etc/apt/sources.list.d/influxdata.list

apt-get update
apt-get install -y influxdb2

systemctl start influxdb
systemctl enable influxdb

echo "Configure in port http://$(hostname -I | cut -d " " -f 2):8086"

export INFLUX_USER=custom_user
export INFLUX_PASS=custom_password
export INFLUX_ORG=custom_org
export INFLUX_BUCKET=custom_bucket
export INFLUX_RET=24h
export INFLUX_NAME=initial_setup
export INFLUX_TOKEN=YImTwY9gPrzvGWdi4qGMwdlCyOvpswncH7I4ZmCYCz8qZpBMZKHlC3qFmopoKoklxDnmHk6qMUJfQ_5bX0m1Fg==

influx setup -f -u $INFLUX_USER -p $INFLUX_PASS -o $INFLUX_ORG -b $INFLUX_BUCKET -r $INFLUX_RET -n $INFLUX_NAME -t $INFLUX_TOKEN

wget https://raw.githubusercontent.com/influxdata/community-templates/master/linux_system/linux_system.yml

#influx apply --force yes -o $INFLUX_ORG -t $INFLUX_TOKEN -f linux_system.yml
#influx apply --force yes -o $INFLUX_ORG -t $INFLUX_TOKEN -u https://raw.githubusercontent.com/influxdata/community-templates/master/linux_system/linux_system.yml
