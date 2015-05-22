#!/bin/bash

# Check to see that puppet itself is installed
dpkg -s puppet &> /dev/null
if [ $? != 0 ]; then
    apt-get -y install puppet
fi

if [ ! -d /etc/puppet/hiera/data ]; then
	mkdir -p /etc/puppet/hiera/data
fi

# Create the base directory for the system-wide puppet modules
rm -rf /etc/puppet/modules
if [ ! -d /etc/puppet/modules ]; then
	mkdir -p /etc/puppet/modules
fi

puppet="/usr/bin/puppet"

# Check for each of the modules we need. If they're not installed, install them.
base_modules='puppetlabs/stdlib puppetlabs/inifile puppetlabs/concat stahnma/epel saz/sudo domcleal/augeasproviders puppetlabs/git puppetlabs/vcsrepo'
for module in $base_modules; do
    $puppet module list | grep -q $(basename $module)
    if [ $? != 0 ]; then
        $puppet module install $module
	if [ $? != 0 ]; then
		"Puppet module $module failed to install"
	fi
    fi
done

for module in hubspot/nexus ; do
    $puppet module list | grep -q $(basename $module)
    if [ $? != 0 ]; then
        $puppet module install $module
	if [ $? != 0 ]; then
		"Puppet module $module failed to install"
	fi
    fi
done

