{% set mdb    = pillar.get('observium:mariadb', {}) -%}
{% set obdata = pillar['observium']                 -%}
/tmp/observium:
  file.managed:
    - contents: |
        - marker_start: $config['db_host'] = 'localhost';
        - marker_end: $config['db_name'] = 'observium';
        {{ pillar['observium'] }}
        
        ## obdata
        {{ obdata }}

        ## obdata
        {{ mdb }}
        
        ## Eviction
        #mysql -u{ { mdb['user'] } } -p{ { mdb['pass'] } } -e "CREATE DATABASE observium DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
        #
        
