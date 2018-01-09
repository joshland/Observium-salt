{% set observium = pillar['observium'] -%}
{% set starttls = observium.get('starttls', False) %}


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
        $config['auth_ldap_server']    = {{ observium['auth_ldap_server'] }};
        $config['auth_ldap_port']      = {{ observium['auth_ldap_port']   }};
        $config['auth_ldap_suffix']    = {{ observium['auth_ldap_suffix'] }};
        $config['auth_ldap_prefix']    = {{ observium['auth_ldap_prefix'] }};
        $config['auth_ldap_group']     = array({{ observium['auth_ldap_group']  }});
        $config['auth_ldap_groupbase'] = {{ observium['auth_ldap_groupbase'] }};
        $config['auth_ldap_groups']['admin']['level']  = {{ observium['auth_ldap_groups'] }};
        $config['auth_ldap_groups']['nagios']['level'] = {{ observium['auth_ldap_groups'] }};
