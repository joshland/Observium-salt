{% set observium = pillar['observium'] -%}
include:
  - .php7

pkgs:
  pkg.installed:
    - pkgs:
      - nginx
      - php-fpm
      - php-mysqlnd
      - mariadb-server
      - python2-PyMySQL
      - python3-PyMySQL
      - python2-mysqldb

## Configure system packages and services
/etc/php-fpm.d/www.conf:
  file.managed:
    - user:  root
    - group: root
    - mode:  0655
    - template: jinja
    - source: salt://observium/files/www.obs.php

{% if grains.ssl_cert is defined -%}
{% if grains.ssl_key is defined -%}
/etc/pki/tls/certs/observium.crt:
  file.managed:
    - user:  nginx
    - group: nginx
    - mode:  0650
    - template: jinja
    - contents: |
       {{ netbox.ssl_cert_content | indent(8) }}

/etc/pki/tls/private/observium.key:
  file.managed:
    - user:  nginx
    - group: nginx
    - mode:  0650
    - template: jinja
    - contents: |
        {{ observium.ssl_key_content | indent(8) }}

{%- endif %}
{%- endif %}

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


mariadb-service:
  service.running:
    - name: mariadb
    - enable: True

      
nginx-service:
  service.running:
    - name: nginx
    - enable: True

php-service:
  service.running:
    - name: php-fpm
    - enable: True


## Deploy Observium
/opt/observium/rrd:
  file.directory:
    - makedirs: True

/opt/observium/logs:
  file.directory:
    - makedirs: True
 
acquire_observium:
  cmd.run:
    - cwd: /opt
    - name: 'wget http://www.observium.org/observium-community-latest.tar.gz'
    - creates: /opt/observium-community-latest.tar.gz

observium_extract:
  cmd.run:
    - cwd: /opt
    - name: 'tar zxvf observium-community-latest.tar.gz'
    - creates: /opt/observium/discovery.php
    - only_if: test -e /opt/observium-community-latest.tar.gz

copy_config:
  cmd.run:
    - cwd: /opt/observium
    - name: cp config.php.default config.php
    - only_if: test ! -e /opt/observium/config.php

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

Create_db:
  cmd.run:
    - names:
      - mysql -e "CREATE DATABASE observium DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"

Change_privilages:
  cmd.run:
    - names:
      - mysql -e "GRANT ALL PRIVILEGES ON {{ observium['dbname'] }}.* TO '{{ observium['dbuser'] }}'@'localhost'IDENTIFIED BY '{{ observium['dbpass'] }}';"

mysql reload:
  cmd.run:
    - names:
      - mysqladmin reload

Change_permission:
  cmd.run:
    - cwd: /opt/observium
    - names:
      - chown nginx:nginx /opt/observium/rrd /opt/observium/logs

schema installation:
  cmd.run:
    - cwd: /opt/observium
    - names:
      - ./discovery.php -u

Add_observium_user:
  cmd.run:
    - cwd: /opt/observium
    - name: ./adduser.php "{{ observium['user'] }}" "{{ observium['pass'] }}" {{ observium['level'] }}

polling_discovery:
  cmd.run:
    - cwd: /opt/observium
    - names:
      - ./discovery.php -h all
      - ./poller.php -h all

{% if observium.users is defined %}
{% for user, detail in observium['users'].items %}
observium create {{ user }}:
  cmd.run:
    - cwd: /opt/observium
    - name: ./adduser.php "{{ user }}" "{{ detail['pass'] }}" {{ detail.get('level', 10) }}
{% endfor %}
{% endif %}
