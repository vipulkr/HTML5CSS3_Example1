class nodejs {

  exec { 'run update script':
    command => '/usr/bin/curl --silent --location https://deb.nodesource.com/setup_0.12 | /bin/bash -'
  }
  package { 'nodejs':
    ensure  => installed,
    require  => Exec['run update script'],
  }
  exec { 'install node static':
    command => '/usr/bin/npm install -g node-static',
    require => Package['nodejs'],
  }

}

include nodejs
