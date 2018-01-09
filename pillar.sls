observium:
  dbuser: observer 
  dbpass: Y0RvD_j@8V-3
  dbname: observium
  level:  10
  user:   obsadmin       ## 'admin' is now disable by default
  pass:   MatterSplatter
  ldap:   'False',
  ## Optional
  # see: http://docs.observium.org/authentication/#ldap-authentication
  auth_ldap_prefix: uid=
  auth_ldap_suffix: cn=users,cn=account,dc=example,dc=org,
  ## Optional-Optional
  auth_ldap_group:
    - cn=observium,ou=groups,dc=example,dc=com
  auth_ldap_groupbase: ou=groups,dc=example,dc=com
  auth_ldap_binddn: ""  # Initial LDAP bind dn and password, leave empty for bind with user's dn
  auth_ldap_bindpw: ""
  auth_ldap_bindanonymous: False
  
  users:
    john:
      password: Ripper
      email: nothing@nowhere.com
      level: 10
    joshua:
      password: Jack
      email: nothing@nowhere.com
      level: 10

#USER LEVELS:
#  0 - Disabled (This user disabled)
#  1 - Normal User (This user has read access to individual entities)
#  5 - Global Read (This user has global read access)
#  7 - Global Secure Read (This user has global read access with secured info)
#  8 - Global Secure Read / Limited Write (This user has secure global read access with scheduled maintenence read/write)
#  10 - Administrator (This user has full administrative access)
