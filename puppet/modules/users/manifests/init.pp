class users {
  file { "/root/.ssh":
    owner   => "root",
    group   => "root",
    path    => "/root/.ssh",
    mode    => 700,
    ensure  => directory,
  }->
  file { "/root/.ssh/authorized_keys":
    owner   => "root",
    group   => "root",
    mode    => 600,
    replace => true,
    ensure  => present,
    source  => "/vagrant/puppet/modules/users/files/authorized_keys"
  }
}