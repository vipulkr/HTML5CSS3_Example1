class nodejs {

  file { '/etc/apt/sources.list':
    owner => root,
    group => root,
    ensure => present,
    source => '/vagrant/puppet/modules/niit/sources.list',
  }
  exec { 'run update script':
    command => '/usr/bin/curl --silent --location https://deb.nodesource.com/setup_0.12 | /bin/bash -',
    require => File['/etc/apt/sources.list'],
  }
  package { 'nodejs':
    ensure  => installed,
    require  => Exec['run update script'],
  }
  exec { 'install node static':
    command => '/usr/bin/npm install -g node-static',
    require => Package['nodejs'],
  }
  file { '/etc/profile.d/000niitvars.sh':
    ensure => present,
    source => '/vagrant/puppet/modules/niit/000niitvars.sh',
  }
}

include nodejs
