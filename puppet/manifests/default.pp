Exec { path => ["/bin/", "/usr/bin", "/usr/local/bin/"] }
import 'nodes.pp'
/*
user { 'arjun':
    ensure => 'present',
    groups => ['sudo'],
    home => '/home/arjun',
    managehome => true,
    password => "test",
    shell => '/bin/bash',
    }
*/
