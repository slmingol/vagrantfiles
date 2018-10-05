#!/bin/bash

vagrant package --vagrantfile Vagrantfile --output centos_7_1node_openshift_$(<VERSION).box

echo ""
echo "************"
echo "* upload via website - https://app.vagrantup.com/slmingol/boxes/centos_7_1node_openshift/"
echo "************"
echo ""
