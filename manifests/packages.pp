class tornode::packages {
	package {
                "pyOpenSSL":                    ensure => installed;
                "python-simplejson":            ensure => installed;
                "pyparsing":                    ensure => installed;
                "python-inotify":               ensure => installed;
                "python-pycurl":                ensure => installed;
                "python-paramiko":              ensure => installed;
        	"bind-utils":			ensure => installed;
		"bind":				ensure => installed;
		"tor":				ensure => installed, require => Yumrepo["tor"];	
		"nmap":				ensure => installed;
		"nginx":			ensure => installed;
	}

}
