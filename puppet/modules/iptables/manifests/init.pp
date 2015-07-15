class iptables {
  package { "iptables":
    ensure  => present
  }

  service { 'iptables':
    name      => 'iptables',
    require   => Package["iptables"],
    ensure    => running,
    enable    => true
  }

  file { "/root/bin":
    owner   => "root",
    group   => "root",
    path    => "/root/bin",
    mode    => 700,
    ensure  => directory,
  }

  file { "/root/bin/deploy-new-rules.sh":
    owner   => "root",
    group   => "root",
    path    => "/root/bin/deploy-new-rules.sh",
    mode    => 700,
    ensure  => present,
    source  => "/vagrant/puppet/modules/iptables/files/deploy-new-rules.sh",
    require => File["/root/bin"],
    notify => Exec['deploy-new-rules'],
  }

  exec { "deploy-new-rules":
    command => "sh /root/bin/deploy-new-rules.sh",
    refreshonly => true,
    notify  => Service["iptables"]
  }
}