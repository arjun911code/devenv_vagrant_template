class users{
user { 'arjun':
    ensure => 'present',
    groups => ['sudo', 'ubuntu'],
    home => '/home/arjun',
    managehome => true,
    password => "test",
    shell => '/bin/bash',
    }

file { '/home/arjun':
    ensure => directory,
    owner => 'arjun',
    group => 'arjun',
    mode => 755,
    source => 'puppet:///modules/users/arjun',
    recurse => remote,
    require => User['arjun'],
    }    
}

class groups{
group { 'ubuntu':
    ensure => 'present',
    members => ['arjun'],
    }
}
