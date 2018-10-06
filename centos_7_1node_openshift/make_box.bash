#!/bin/bash

vagrant ssh <<-EOF
set -x
sudo rm -f /swapfile
sudo dd if=/dev/zero of=/EMPTY bs=1M &> /dev/null
sudo rm -f /EMPTY
set +x
EOF

#sudo oc adm prune deployments --confirm
#sudo oc adm prune builds --confirm
#sudo oc adm prune images --confirm > /dev/null 2>&1 

vagrant package --vagrantfile Vagrantfile.prod --output ~/centos_7_1node_openshift_$(<VERSION).box

echo ""
echo "************"
echo "* upload via website - https://app.vagrantup.com/slmingol/boxes/centos_7_1node_openshift/"
echo "************"
echo ""
