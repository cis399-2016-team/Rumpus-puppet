class sshd{
	package{
		"openssh-server": ensure => installed;
	}

	file{ "/etc/sshd/sshd_config": 
		notify => Service['sshd'],
		source => "puppet:///modules/sshd/sshd_config",
		mode => 644,
		owner => root,
		group => root,
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

	ssh_authorized_key { "ACG-key-pair":
		user=> "ubuntu",
		type => "ssh-rsa",
		key => "AAAB3NzaC1yc2EAAAADAQABAAABAQCdEemHGVVeacdNNYhmAG0FMn05Su+mXTMehI3xuFnl1BCU4dEv+x2VIQbwJDCY/YlfhSs1ozEab3bO2/CrcauqZYLUmvRW0oyKbgO2sFKFG2FOaEAejjy3nmhL5dmDiooQm0Ctk4rPE8Sf6Kt427yhErx462fHoGxJ/UVP4VGHHREA4MgdncyChCK/Zv5qj7M4woOV5Pw+mU2qjZVgIQrTjPUgO7P8PGhyYv4eBQTVvp6G7kbYafX+rYZUFUpyE84344WB5beLvFw+Am5imbm79oOaWJ4vUh75wfUnD0tBOXCMcCnlTinRX/cxTfs7eM61t3euMGn8ShzlaqBcMkTZ"
		}

	ssh_authorized_key { "pasha-key-pair-oregon":
		user => "ubuntu",
		type => "ssh-rsa",
		key => "AAAB3NzaC1yc2EAAAADAQABAAABAQCU0FxFGLvLP7eKHzPU2YsaHuBKVLO2dVnrSHWLplVZbPPF0V7r+D6kzkLrx0/xjJ965TmrTrzs0ODF6nWq3lNUkleUqtS+FFPuzXgJoL65LCQttnGdOhlaU2ntT0XX4teRgenQOuzUBH88F5jfK+jNiZnF7XcXJzIufgT/JLDRtknLpuda59HHtNyEQqWAyuWySj3NwYit+hG3qKzq8DOGZJIz2R1osCyHLqqYjpHQjyYK8cR1TI5CfDvvloGtk+2rmjphYFBlKLa6bjPUDC1qkzElpIrlKZUWsI+wuHHUb5ppm356CCf6uhnGInTvpkwr8tw1/i0LzAIc/JKeiPYf"
		}

}
