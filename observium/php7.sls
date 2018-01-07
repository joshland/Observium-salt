base:
  pkg.installed:
    - order: 4
    - pkgs:
      - ImageMagick
      - MySQL-python
      - cronie
      - fping
      - graphviz
      - httpd
      - ipmitool
      - jwhois
      - libvirt
      - mariadb
      - mariadb-server
      - net-snmp
      - net-snmp-utils
      - php
      - php-cli
      - php-gd
      - php-json
      - php-mcrypt
      - php-opcache
      - php-pear
      - php-posix
      - rrdtool
      - subversion
      - wget

httpd:
  pkg:
    - installed
    - order: 1
  service:
    - running
    - enable: True
    - reload: True
