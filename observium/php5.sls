base:
  pkg.installed:
    - order: 4
    - pkgs:
      - imagemagick
      - fping
      - rrdtool
      - subversion
      - whois
      - mtr-tiny
      - ipmitool
      - graphviz
      - libvirt-bin 
    - require:
      - pkgrepo: php5_ppa
      - pkg: mysql-client
      - pkg: apache2
      - pkg: php5

php5_ppa:
  pkgrepo.managed:
    - ppa: ondrej/php5        
 
apache2:
  pkg:
    - installed
    - order: 1
  service:
    - running
    - enable: True
    - reload: True
  
php5:
  pkg.installed:
    - order: 3
    - pkgs:
      - php5-mysql
      - php5-cli
      - libapache2-mod-php5
      - php5-gd
      - mcrypt
      - php5-mcrypt
      - php-pear
      - php5-json
    - refresh: True
    - require:
      - pkgrepo: php5_ppa
      - pkg: mysql-client
      - pkg: apache2
  
mysql-client:
  pkg.installed:
    - order: 2
