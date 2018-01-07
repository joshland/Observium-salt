  snmpd:
    pkg:
      - installed
      - order: 25 
#      - require:
#        - refresh: True
  
#  /etc/snmp/snmpd.conf:
#    file.blockreplace:
#      - name: /etc/snmp/snmpd.conf
#      - marker_start: #  Listen for connections from the local system only
#      - marker_end: ############################################################################### 
#      - content: |
#          #agentAddress  udp:127.0.0.1:161
#          #  Listen for connections on all interfaces (both IPv4 *and* IPv6)
#          agentAddress udp:161,udp6:[::1]:161 
#          createUser bootstrap MD5{{ pillar['demo']['pass'] }}  DES{{ pillar['demo']['pass'] }} 
#          rwuser bootstrap priv
#          rwuser demo priv
#      - order: 26
  /etc/snmp/snmpd.conf:
    file.managed:
      - source: salt://agent/snmpd.conf
      - order: 26
    
  /etc/default/snmpd:
    file.replace:
      - pattern: '-Lsd -Lf /dev/null -u snmp -g snmp -I -smux -p /var/run/snmpd.pid'
      - repl: '-Lsd -Lf /dev/null -u snmp -p /var/run/snmpd.pid'
      - order: 27
  
  snmpd_service:
    cmd.run:
      - name: service snmpd restart
      - order: 28
#  ~/.snmp/snmp.conf:
#    file:
#      - managed
#      - contents: | 
#          {{ salt['pillar.get']('snmpd:text')}} 
