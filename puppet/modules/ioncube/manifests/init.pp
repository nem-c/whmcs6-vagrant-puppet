class ioncube {
  file { "/tmp/downloads":
    owner   => "root",
    group   => "root",
    path    => "/tmp/downloads",
    mode    => 700,
    ensure  => directory,
    require => Package['php54w']
  }->
  file { "/tmp/downloads/ioncube_loaders_lin_x86.tar.gz":
    replace => true,
    ensure  => present,
    source  => "/vagrant/puppet/modules/ioncube/files/ioncube_loaders_lin_x86.tar.gz"
  }->
  exec { "unpack-loaders":
    command => "tar -zxvf ioncube_loaders_lin_x86.tar.gz",
    cwd     => "/tmp/downloads/",
    creates => "/tmp/downloads/ioncube/",
    require => Package["php54w"]
  }->
  exec { "copy-to-modules":
    command => "cp /tmp/downloads/ioncube/*.so ./",
    cwd     => "/usr/lib/php/modules/",
    creates => "/usr/lib/php/modules/ioncube_loader_lin_5.4.so",
    require => Exec["unpack-loaders"]
  }->
  file { "/etc/php.d/ioncube.ini":
    owner   => "root",
    group   => "root",
    mode    => 644,
    replace => true,
    ensure  => present,
    source  => "/vagrant/puppet/modules/ioncube/files/ioncube.ini",
    require => Package["httpd"],
    notify  => Service["httpd"]
  }
}