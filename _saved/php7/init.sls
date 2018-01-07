base:
  pkg.installed:
    - order: 4
    - pkgs:
      - wget
      - httpd
      - php
      - php-opcache
      - php-mysql
      - php-gd
      - php-posix
      - php-mcrypt
      - php-pear
      - cronie
      - net-snmp
      - net-snmp-utils
      - fping
      - mariadb-server
      - mariadb
      - MySQL-python
      - rrdtool
      - subversion
      - jwhois
      - ipmitool
      - graphviz
      - ImageMagick
      - php-mysql
      - php-cli
      - php-json
      - mariadb-client
      - libvirt

httpd:
  pkg:
    - installed
    - order: 1
  service:
    - running
    - enable: True
    - reload: True
