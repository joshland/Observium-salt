  snmp:
    pkg:
      - installed
      - order: 5
 
  snmp-mibs-downloader:
    pkg:
      - installed
      - order: 6

  /etc/snmp/snmp.conf:
    file.replace:
      - pattern: 'mibs :'
      - repl: '#mibs :'
      - order: 7
