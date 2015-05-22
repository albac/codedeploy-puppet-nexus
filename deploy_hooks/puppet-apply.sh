#!/bin/bash

BASE_DIR="/etc/puppet"

/usr/bin/puppet apply --modulepath=${BASE_DIR}/modules -e "include codedeploy::nexus_server"
if [ $? != 0 ]; then
	echo "base module failed to run: try running this manually:
	/usr/bin/puppet apply --modulepath=${BASE_DIR}/modules -e \"include codedeploy::nexus_server\""
	exit 1
fi

