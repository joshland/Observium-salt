{% set mdb    = pillar.get('observium:mariadb', {}) -%}
{% set obdata = pillar['observium']                 -%}

/opt/observium:
  file.directory:
    - makedirs: True
    - order: 12 
 
install_observium:
  cmd.run:
    - cwd: /opt
    - name: 'wget http://www.observium.org/observium-community-latest.tar.gz'
    - creates: /opt/observium-community-latest.tar.gz
    - order: 13

observium_extract:
  cmd.run:
    - cwd: /opt
    - name: 'tar zxvf observium-community-latest.tar.gz'
    - creates: /opt/observium/discovery.php
    - order: 14

copy_config:
  cmd.run:
    - cwd: /opt/observium
    - name: cp config.php.default config.php
    - order: 14

#Change_php.config:
/opt/observium/config.php:   
  file.blockreplace:
    - name: /opt/observium/config.php
    - marker_start: $config['db_host'] = 'localhost';
    - marker_end: $config['db_name'] = 'observium';
    - content: | 
        $config['db_user'] = '{{ obdata["user"] }}';
        $config['db_pass'] = '{{ obdata["password"] }}';
    - order: 17
 
Create_db:
  cmd.run:
    - names:
      - mysql -u{{ mdb['user'] }} -p{{ mdb['pass'] }} -e "CREATE DATABASE observium DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
      - mkdir -p /opt/observium/rrd
    - order: 15

Change_privilages:
  cmd.run:
    - names:
      - mysql -u{{ mdb['user'] }} -p{{ mdb['pass'] }} -e "GRANT ALL PRIVILEGES ON {{ obdata.dbname }}.* TO '{{ obdata.user }}'@'localhost'IDENTIFIED BY '{{ obdata.pass }}';"
#        -  mysql -u{{ mdb['user'] }} -p{{ mdb['pass'] }} -e "exit;"
      - mkdir -p /opt/observium/logs
    - order: 16
  
Change_permission:
  cmd.run:
    - cwd: /opt/observium
    - names:
      - php includes/update/update.php
      - chown www-data:www-data /opt/observium/rrd
    - order: 18
 
/etc/apache2/sites-available/default:
  file.managed:
    - source: salt://observium/files/apache-default
    - order: 19

Reload_apache:
 cmd.run:
   - name: service apache2 reload
   - order: 20

Enable_modules:
  cmd.run:
    - cwd: /opt/observium
    - names:  
#        - php5enmod php5-mcrypt
      - a2enmod rewrite
      - apache2ctl restart
    - order: 21

Add_observium_user:
  cmd.run:
    - cwd: /opt/observium
    - name: ./adduser.php {{ pillar ['observium']['user'] }} {{ pillar ['observium']['pass'] }} {{ pillar ['observium']['level'] }}    
    - order: 22 
  
  polling_discovery:
  cmd.run:
    - cwd: /opt/observium
    - names:
      - ./discovery.php -h all
      - ./poller.php -h all
    - order: 23
  
/etc/cron.d/observium:
  file.managed:
    - source: salt://observium/files/cron
    - order: 24
 
