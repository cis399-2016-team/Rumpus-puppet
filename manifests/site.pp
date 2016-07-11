node ip-10-0-7-43{
	cron { "puppet update":
		command => "cd /etc/puppet && git pull -q origin master",
		user => root,
		minute => "*/1",
	}
}

node ip-10-0-7-235{
	include sshd
}

node ip-10-0-7-187{
}
