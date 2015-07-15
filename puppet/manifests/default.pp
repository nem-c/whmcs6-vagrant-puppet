# default path
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

$mySqlRootPassword = "password"
$whmcsMySqlDbName = "whmcs_db"
$whmcsMySqlDbUsername = "whmcs"
$whmcsMySqlDbPassword = "whmcs"

define mysqldb( $user, $password ) {
  exec { "create-${name}-db":
    unless  => "/usr/bin/mysql -u${user} -p${password} ${name}",
    command => "/usr/bin/mysql -uroot -p$mySqlRootPassword -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
    require => Service["mysqld"],
  }
}

include iptables
include users
include misc
include httpd
include php
include mysql

include ioncube

include whmcs