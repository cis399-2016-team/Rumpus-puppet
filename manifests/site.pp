node ip-10-0-7-43{
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user => root,
		minute => "*/1",
	}
	include sshd
        include users
}

node ip-10-0-7-76{
	include sshd
	include apache
        include users
	include postfix
}

node ip-10-0-7-187{
	include sshd
	include apache
        include users
}
