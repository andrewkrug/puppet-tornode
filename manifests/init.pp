class tornode {
	
	#Packages to install
	include tornode::packages

	#Files to manage
	include tornode::files

	#Services to start
	include tornode::services

	
}
