{% set observium = pillar['observium'] -%}
{% for user, udict in observium['users'].items() -%}
{{ user }} Add_observium_user:
  cmd.run:
    - cwd: /opt/observium
    - name: ./adduser.php "{{ user }}" "{{ udict['pass'] }}" {{ udict.get('level', '') }}  {{ udict.get('email', '') }} 
{% endfor -%}
