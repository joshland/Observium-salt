  mysql_setup:
    debconf.set:
      - name: mysql-server
      - data:
          'mysql-server/root_password': {'type': 'string', 'value': '{{ pillar['mysql']['PASS'] }}'}
          'mysql-server/root_password_again': {'type': 'string', 'value': '{{ pillar['mysql']['PASS'] }}'}
  mysql-server-5.5:
    pkg.installed:
      - order: 9
      - require:
        - debconf: mysql_setup
  
#  /etc/salt/minion:
#    file.append:
#      - text:  
#        - "mysql.host: 'localhost'"
#        - "mysql.port: 3306"
#        - "mysql.user: 'root'"
#        - "mysql.pass: '{{ pillar ['mysql']['PASS'] }}'"
#        - "mysql.db: 'observium'"
#        - "mysql.unix_socket: '/tmp/mysql.sock'"
  

  mysql-client-5.5:
    pkg.installed:
      - order: 8 

  python-mysqldb:
    pkg.installed:
      - order: 10

  mysql-service:
    service.running:
      - name: mysql
      - require:
        - pkg: mysql-server-5.5
        - pkg: python-mysqldb
      - order: 12

