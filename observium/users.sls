{% from "observium/map.jinja" import obdata with context %}
{% for user, udict in obdata['users'].items() -%}
{{ user }} Add_observium_user:
  cmd.run:
    - cwd: /opt/observium
    - name: ./adduser.php "{{ user }}" "{{ udict['pass'] }}" {{ udict.get('level', '') }}  {{ udict.get('email', '') }} 
{% endfor -%}
