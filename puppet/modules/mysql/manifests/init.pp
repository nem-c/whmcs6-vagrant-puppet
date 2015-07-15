class mysql {
  $packages = [
    "mysql-server",
    "mysql"
  ]
  package { $packages:
    ensure  => present
  }

  service { "mysqld":
    enable  => true,
    ensure  => running,
    require => Package["mysql-server", "php54w"]
  }

  exec { "set-mysql-password":
    unless  => "mysqladmin -uroot -p$mySqlRootPassword status",
    command => "mysqladmin -uroot password $mySqlRootPassword",
    require => Service["mysqld", "httpd"]
  }
}