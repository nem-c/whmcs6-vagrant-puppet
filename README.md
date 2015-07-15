# Vagrant/Puppet setup for WHMCS 6
Vagrant/Puppet configuration for WHMCS 6 installation

Based on CentOS 6.5 <br/>
https://dl.dropbox.com/s/3fgr7lbvcpn51py/centos_6-5_i386.box

Default settings:
<ul>
    <li>1G RAM</li>
    <li>1CPU</li>
</ul>

Clone repo to location<br/>
```
$git clone https://github.com/nem-c/whmcs6-vagrant-puppet.git whmcs
```
If you want to use root login without password, create authorized_keys file in puppet/modules/users/files/authorized_keys

Run<br/>
```
$vagrant up
```

In about 4-5 minutes your vagrant machine would be ready to run.

Machine is always running on same IP and under same directory, so if you have developers license,
there should be no issues with licenses IP/Location change, even with multiple developers working on project

Machine is running on <b>192.168.56.101</b> and with hostname <b>whmcs.dev</b>

You will have to add 
```
192.168.56.101 whmcs.dev www.whmcs.dev
```
To your hosts file in order to easily access it from browser.

When your WHMCS code is in place, just follow installation guideline, and in about 30 seconds you should be ready.

Database details required are:
```json
{
    username: "whmcs"
    password: "whmcs"
    database_name: "whmcs_db"
}
```

WHMCS code is not included and you can aquire your version on https://www.whmcs.com, where you can also receive
developers license