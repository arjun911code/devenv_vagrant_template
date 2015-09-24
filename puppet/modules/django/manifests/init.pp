class django {
    include django::install
}

class django::install {
    exec { "update-apt":
        command => "sudo apt-get update",
    }

    package { ["python", "python-dev", "python-pip", "python-pandas"]:
        ensure => present,
        require => Exec['update-apt'],
    }

    exec { "pip install":
        command => "sudo /usr/bin/pip install -r /vagrant/requirements.txt",
        tries => 3,
        timeout => 600,
        require => Package["python", "python-pip"],
        logoutput => on_failure,
    }
}
