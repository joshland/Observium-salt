{% from "observium/map.jinja" import obdata with context %}
base:
  pkg.installed:
    - pkgs:
      - ImageMagick
      - php-mysqlnd
      - cronie
      - fping
      - graphviz
      - ipmitool
      - jwhois
      - libvirt
      - net-snmp
      - net-snmp-utils
      - php-cli
      - php-gd
      - php-json
      - php-mcrypt
      - php-opcache
      - php-pear
      - rrdtool
      - subversion
      - wget
