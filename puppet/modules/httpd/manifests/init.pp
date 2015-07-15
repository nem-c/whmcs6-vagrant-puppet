class httpd {

  $packages = [
    "httpd",
    "elinks",
  ]

  package { $packages:
    ensure  => present
  }

  service { 'httpd':
    name      => 'httpd',
    require   => Package["httpd"],
    ensure    => running,
    enable    => true
  }

  file { "/etc/httpd/conf/httpd.conf":
    owner   => "root",
    group   => "root",
    mode    => 644,
    replace => true,
    ensure  => present,
    source  => "/vagrant/puppet/modules/httpd/files/httpd.conf",
    require => Package["httpd"],
    notify  => Service["httpd"]
  }

  file { "/etc/httpd/conf.d/vhost.conf":
    owner   => "root",
    group   => "root",
    mode    => 644,
    replace => true,
    ensure  => present,
    source  => "/vagrant/puppet/modules/httpd/files/extras/vhost.conf",
    require => Package["httpd"],
    notify  => Service["httpd"]
  }

  file { "/etc/httpd/conf.d/server-status.conf":
    owner   => "root",
    group   => "root",
    mode    => 644,
    replace => true,
    ensure  => present,
    source  => "/vagrant/puppet/modules/httpd/files/extras/server-status.conf",
    require => Package["httpd"],
    notify  => Service["httpd"]
  }
}