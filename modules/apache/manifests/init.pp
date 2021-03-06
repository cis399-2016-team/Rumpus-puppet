class apache{
	package{
		"apache2": ensure => installed;
		}

	file{ "/etc/apache2/apache2.conf":
		source  =>  "puppet:///modules/apache/apache2.conf",
		mode => 644,
		owner => root,
		group => root,
		require => Package["apache2"],
	}

	file{ "/var/www/html":
		source => ["puppet:///modules/apache/html"],
		mode => 644,
		recurse => true,
	}

	service{ "apache2":
		enable => true,
		ensure => running,
		hasstatus => true,
		hasrestart => true,
		require => [Package["apache2"],
			File["/etc/apache2/apache2.conf"] ],

		subscribe => File["/etc/apache2/apache2.conf"],
	}
}
