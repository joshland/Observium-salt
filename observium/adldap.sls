{% from "observium/map.jinja" import observium with context -%}
pkgs:
  pkg.installed:
    - pkgs:
      - php-ldap

include:
  - .config
  
ldap version:
  file.append:
    - name:    /opt/observium/config.php
    - content: |
        $config['auth_ldap_binddn'] = {{ observium['auth_ldap_binddn'] }};
        $config['auth_ldap_bindpw'] = {{ observium['auth_ldap_bindpw'] }};

        $config['auth_ldap_attr']['uid'] = {{ observium['auth_ldap_attr'] }};
        $config['auth_ldap_attr']['uidNumber'] = {{ observium['auth_ldap_attr'] }};
        $config['auth_ldap_attr']['cn'] = {{ observium['auth_ldap_attr'] }};
        $config['auth_ldap_attr']['dn'] = {{ observium['auth_ldap_attr'] }};
        $config['auth_ldap_objectclass'] = {{ observium['auth_ldap_objectclass'] }};
        
 $config['auth_ldap_version'] = {{ observium['auth_ldap_version'] }};
 $config['auth_ldap_server'] = {{ observium['auth_ldap_server'] }};
 $config['auth_ldap_port']   = {{ observium['auth_ldap_port'] }};
 $config['auth_ldap_starttls'] = {{ observium['auth_ldap_starttls'] }};
 
 $config['auth_ldap_prefix'] = {{ observium['auth_ldap_prefix'] }};
 $config['auth_ldap_suffix'] = {{ observium['auth_ldap_suffix'] }};
 $config['auth_ldap_group']  = {{ observium['auth_ldap_group'] }};
 $config['auth_ldap_groupbase'] = {{ observium['auth_ldap_groupbase'] }};
 
 $config['auth_ldap_groupmembertype'] = {{ observium['auth_ldap_groupmembertype'] }};
 $config['auth_ldap_groupmemberattr'] = {{ observium['auth_ldap_groupmemberattr'] }};
 
 unset($config['auth_ldap_groups']);
 $config['auth_ldap_groups']['CN=Observium Admins,OU=Groups,DC=example,DC=COM']['level'] = 10;
 $config['auth_ldap_groups']['CN=Observium Users,OU=Groups,DC=example,DC=COM']['level'] = 1;  
