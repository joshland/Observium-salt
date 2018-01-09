{% set observium = pillar['observium'] -%}
/etc/php-fpm.d/www.conf:
  file.managed:
    - user:  root
    - group: root
    - mode:  0655
    - template: jinja
    - source: salt://observium/files/www.obs.php

/etc/nginx/conf.d/observium.conf:
  file.managed:
    - user:  root
    - group: root
    - mode:  0655
    - template: jinja
    - source: salt://observium/files/nginx.conf

/etc/cron.d/observium:
  file.managed:
    - source: salt://observium/files/cron

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

