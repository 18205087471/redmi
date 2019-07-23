#!/bin/bash
ssh-keygen   -f /root/.ssh/id_rsa    -N ''
for i in 10  11  12  13
do
     ssh-copy-id  192.168.4.$i
     scp  /etc/hosts  192.168.4.$i:/etc/
scp  /etc/yum.repos.d/ceph.repo  192.168.4.$i:/etc/yum.repos.d/
scp /etc/chrony.conf 192.168.4.$i:/etc/
     ssh 192.168.4.$i "systemctl restart chronyd"
done
