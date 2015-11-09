class requirements {

}

class requirements::install {
    exec { "update-apt":
        command => "sudo apt-get update"
    }

    package{ ["python", "python-dev", "python-pip"]:
        ensure => present,
        require => Exec['update-apt'],
    }

    exec {"pip install":
        command => "sudo /usr/bin/pip install -r /vagrant/requirements.txt",
        tries =>3,
        timeout => 600,
        require => Package["python", "python-pip"],
        logoutput => on_failure,
    }

}
