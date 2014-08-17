class tornode::files {
	yumrepo { "epel":
      		baseurl => "http://download.fedoraproject.org/pub/epel/6/$basearch",
      		descr => "epel el6",
      		enabled => 1,
      		gpgcheck => 0
   	}

        yumrepo { "tor":
                baseurl => "http://deb.torproject.org/torproject.org/rpm/el/6/x86_64/",
                descr => "tor repo",
                enabled => 1,
                gpgcheck => 0
        }

	file {"/tmp/tor":
		ensure => directory,
		owner  => '_tor',
		group  => '_tor',
		mode   => 755,
		require => Package["tor"],
	}

	file {"/tmp/tor/hidden_service":
                ensure => directory,
                owner  => '_tor',
                group  => '_tor',
                mode   => 755,
                require => [File["/tmp/tor"],Package["tor"]],
        } 

	file {"/etc/tor/torrc":
		owner => root,
		group => '_tor',
		mode  => 754,
		require => Package["tor"],
		notify => Service["tor"],
		source => 'puppet:///modules/tornode/torrc',
	}	

	file {"/etc/named.conf":
                owner => named,
                group => 'named',
                mode  => 754,
                notify => Service["named"],
        	require => Package["bind"],
		source => 'puppet:///modules/tornode/named.conf',
	}
}

