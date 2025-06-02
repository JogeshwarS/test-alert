#!/bin/sh

sed -e "s+SLACK_CHANNEL+${SLACK_CHANNEL}+" \
    -e "s+SLACK_WEBHOOK+${SLACK_WEBHOOK}+" \
    /etc/alertmanager/alertmanager.yml.tpl > /etc/alertmanager/alertmanager.yml

cat /etc/alertmanager/alertmanager.yml
exec /bin/alertmanager --config.file=/etc/alertmanager/alertmanager.yml

