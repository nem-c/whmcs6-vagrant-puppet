class php {

  $packages = [
    "php54w",
    "php54w-cli",
    "php54w-common",
    "php54w-gd",
    "php54w-mcrypt",
    "php54w-intl",
    "php54w-imap",
    "php54w-mbstring",
    "php54w-mysql",
    "php54w-pdo",
    "php54w-pear",
    "php54w-soap",
    "php54w-xml",
    "php54w-pecl-imagick",
    "php54w-xmlrpc",
  ]

  file { "/tmp/webtatic-el6.rpm":
    source => "/vagrant/puppet/modules/php/files/webtatic-el6.rpm"
  }

  package { 'webtatic-el6':
    ensure          => present,
    provider        => 'rpm',
    install_options => ['-ivh'],
    source          => "/tmp/webtatic-el6.rpm",
    require         => File["/tmp/webtatic-el6.rpm"],
    alias           => 'grab-webtatic'
  }

  package { $packages:
    ensure  => present,
    require => Package["grab-webtatic"]
  }

  file { "/etc/php.ini":
    owner   => "root",
    group   => "root",
    mode    => 644,
    replace => true,
    ensure  => present,
    source  => "/vagrant/puppet/modules/php/files/php.ini",
    notify  => Service["httpd"]
  }

}