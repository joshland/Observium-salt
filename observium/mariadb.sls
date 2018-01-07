{% set mdb = pillar.get('observium:mariadb', {}) -%}

mariadb-server:
  pkg.installed:
    - order: 9
    - require:
    #- debconf: mariadb_setup

mariadb-client:
  pkg.installed:
    - order: 8 

python-mysqldb:
  pkg.installed:
    - order: 10

mariadb-service:
  service.running:
    - name: mariadb
    - require:
      - pkg: mariadb-server
      - pkg: python-mysqldb
    - order: 12

#  /etc/salt/minion:
#    file.append:
#      - text:  
#        - "mariadb.host: 'localhost'"
#        - "mariadb.port: 3306"
#        - "mariadb.user: 'root'"
#        - "mariadb.pass: '{{ pillar ['mariadb']['PASS'] }}'"
#        - "mariadb.db: 'observium'"
#        - "mariadb.unix_socket: '/tmp/mariadb.sock'"
