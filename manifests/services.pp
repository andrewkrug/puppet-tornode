class tornode::services {
	        
		service {"named":
		        enable => true,
                        ensure => running,
                        require => [Package["bind"]],
                }

		service {"tor":
                        enable => true,
                        ensure => running,
                        require => [Package["tor"]],
                }

		service {"nginx":
                        enable => true,
                        ensure => running,
                        require => [Package["nginx"]],
                }
}
