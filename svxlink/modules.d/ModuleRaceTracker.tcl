###############################################################################
#  SVXlink TCL Module example Coded by Dan Loranger (KG7PAR)
#  
#  ADD YOUR MODULE DESCRIPTION HERE, BE VERBOSE.
#
#  comment - this is not intended to be functional but rather to provide the
#  basic framework
#
###############################################################################
#
# This is the namespace in which all functions and variables below will exist. 
# The name must match the configuration variable "NAME" in the [ModuleTcl] 
# section in the configuration file. The name may be changed but it must be 
# changed in both places.
#
###############################################################################
namespace eval RaceTracker {
	# Check if this module is loaded in the current logic core
	#
	if {![info exists CFG_ID]} {
		return;
	}
	#
	# Extract the module name from the current namespace
	#
	set module_name [namespace tail [namespace current]]
	
	
	# A convenience function for printing out info prefixed by the module name
	#
	#   msg - The message to print
	#
	proc printInfo {msg} {
		variable module_name
		puts "$module_name: $msg"
	}
	 
	proc activateInit {} {
		# do activities one time when the module is initialized
		
	}
	
	###########################################################################	
	# Read in the values from the config file and set them in local variables
	########################################################################### 
	
	#files read from the config file are prepended by "$CFG_" so you have to 
	# use them as follows
	# $VariableName = $CFG_ValueFromConfigFileByName
	# Example CONF file variable declaration "TEST = 1"
	# $TEST = $CFG_TEST
	
	proc main_every_second {} {
		# do tasks on a 1 second cadence
		
	}
	
	proc dtmfCmdReceived {cmd} {
		printInfo "DTMF command received: $cmd"
		## MODULE GLOBAL COMMANDS 
		if {$cmd == "0"} {
			#play the help information, including module names
			playMsg "config_help"
  
			}
	}


	# Executed when this module is being deactivated
	#
	proc deactivateCleanup {} {
		printInfo "Module deactivated"
	}
	
	# notify svxlink this function will run on the everySecond timer
	append func $module_name "::main_every_second";
	Logic::addSecondTickSubscriber $func;
	
	# end of namespace
}
#
# This file has not been truncated
#
