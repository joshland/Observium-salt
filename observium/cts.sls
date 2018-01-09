{% set observium = pillar['observium'] -%}

observium user config change:
  file.replace:
    - name:    /opt/observium/config.php
    #- pattern: {{ '$config[[]\'db_user\'[]].*\'USERNAME\';' | regex_escape }}
    - pattern: |
        \$config[[]'db_user'[]].*'USERNAME';
    - repl:    |
        $config['db_user'] = '{{ observium["dbuser"] }}';
    
observium pass config change:
  file.replace:
    - name:    /opt/observium/config.php
    - pattern: |
        \$config[[]'db_pass'[]].*'PASSWORD';
    - repl:    |
        $config['db_pass'] = '{{ observium["dbpass"] }}';
