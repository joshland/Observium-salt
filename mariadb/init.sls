  mariadb_setup:
    debconf.set:
      - name: mariadb-server
      - data:
          'mariadb-server/root_password': {'type': 'string', 'value': '{{ pillar['mariadb']['PASS'] }}'}
          'mariadb-server/root_password_again': {'type': 'string', 'value': '{{ pillar['mariadb']['PASS'] }}'}
  mariadb-server-5.5:
    pkg.installed:
      - order: 9
      - require:
        - debconf: mariadb_setup
  
#  /etc/salt/minion:
#    file.append:
#      - text:  
#        - "mariadb.host: 'localhost'"
#        - "mariadb.port: 3306"
#        - "mariadb.user: 'root'"
#        - "mariadb.pass: '{{ pillar ['mariadb']['PASS'] }}'"
#        - "mariadb.db: 'observium'"
#        - "mariadb.unix_socket: '/tmp/mariadb.sock'"
  

  mariadb-client-5.5:
    pkg.installed:
      - order: 8 

  python-mysqldb:
    pkg.installed:
      - order: 10

  mariadb-service:
    service.running:
      - name: mariadb
      - require:
        - pkg: mariadb-server-5.5
        - pkg: python-mysqldb
      - order: 12

