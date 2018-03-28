# Change to puppet manifest
file { '/tmp/hello.txt':
  ensure  => file,
  content => "#This file is managed by Puppet - manual edits will be lost\n\nhello, world\n",
}

# Set up regular Puppet runs
file { '/usr/local/bin/run-puppet':
  source => '/etc/puppetlabs/code/environments/production/files/run-puppet.sh',
  mode   => '0755',
}

cron { 'run-puppet':
  command => '/usr/local/bin/run-puppet',
  hour    => '*',
  minute  => '*/15',
}
