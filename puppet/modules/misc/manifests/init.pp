class misc {
  file { "/tmp/epel-release-6-8.noarch.rpm":
    source => "/vagrant/puppet/modules/misc/files/epel-release-6-8.noarch.rpm"
  }

  package { "epel-6-8":
    ensure          => present,
    provider        => "rpm",
    install_options => ["-ivh"],
    source          => "/tmp/epel-release-6-8.noarch.rpm",
    require         => File["/tmp/epel-release-6-8.noarch.rpm"],
    alias           => "grab-epel"
  }

  $packages = [
    "curl",
    "htop",
    "ImageMagick"
  ]

  package { $packages :
    ensure  => present,
    require => Package["epel-6-8"]
  }
}