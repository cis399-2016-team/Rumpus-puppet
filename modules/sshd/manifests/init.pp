class sshd{
	package{
		"openssh-server": ensure => installed;
	}

	file{ "/etc/ssh/sshd_config": 
		notify => Service["ssh"],
		mode => 644,
		owner => root,
		group => root,
		source => "puppet:///modules/sshd/sshd_config",
		#package must be installed before configuration file
		require => Package["openssh-server"],

	}

	service{ "ssh":
		#automatically start at boot
		enable => true,
		#restart service if it is not running
		ensure => running,
		#package and config file must be present for service
		require => [ Package["openssh-server"],
			     File["/etc/ssh/sshd_config"],  ],
		
	}


}
