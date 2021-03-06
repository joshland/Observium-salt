<?php
## Check http://www.observium.org/wiki/Configuration_Options for documentation of these settings

// Database config ---  This MUST be configured
$config['db_host'] = 'localhost';
$config['db_user'] = 'observium';
$config['db_pass'] = 'observium';
$config['db_name'] = 'observium';

// Base directory
$config['install_dir'] = "/opt/observium";

// Default community list to use when adding/discovering
$config['snmp']['community'] = array("public");

// Authentication Model
$config['auth_mechanism'] = "mysql";    // default, other options: ldap, http-auth, please see documentation for config help

// Enable alerter (not available in CE)
#$config['poller-wrapper']['alerter'] = TRUE;

// Set up a default alerter (email to a single address)
$config['alerts']['alerter']['default']['descr']   = "Default Email Alert";
$config['alerts']['alerter']['default']['type']    = "email";
$config['alerts']['alerter']['default']['contact'] = "you@yourdomain.org";
$config['alerts']['alerter']['default']['enable']  = TRUE;

// End config.p
