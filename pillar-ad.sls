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
  auth_ldap_binddn: "cn=LookupUse,cn=User,dc=contoso,dc=com" 
  auth_ldap_bindpw: "sekrits I keep"
  auth_ldap_bindanonymous: False

  auth_ldap_version: 3;
  auth_ldap_server: "domaincontroller.example.com";
  auth_ldap_port: 389;
  auth_ldap_starttls: TRUE;

 auth_ldap_prefix: "CN=";
 auth_ldap_suffix: ",CN=Users,DC=ad,DC=example,DC=com";
 auth_ldap_group: array("CN=Observium Users,OU=Groups,DC=ad,DC=example,DC=com");
 auth_ldap_groupbase: "OU=Groups,DC=ad,DC=example,DC=com";

 auth_ldap_groupmembertype: "fulldn";
 auth_ldap_groupmemberattr: "member";

 auth_ldap_attr_uid: "sAMAccountName";
 auth_ldap_attr_uidNumber: "objectSid";
 auth_ldap_attr_cn: "name";
 auth_ldap_attr_dn: "distinguishedname";
 auth_ldap_objectclass: "person";
 
 auth_level10_group: 'CN=Observium Admins,OU=Groups,DC=example,DC=COM'
 #auth_level8_group: 'CN=Observium Admins,OU=Groups,DC=example,DC=COM'
 #auth_level5_group: 'CN=Observium Admins,OU=Groups,DC=example,DC=COM'
 #...
 auth_level1_group: 'CN=Observium Users,OU=Groups,DC=example,DC=COM'

  
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
