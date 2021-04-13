
{% macro bashrc(name) %}
/etc/bash.bashrc.d/{{ name }}.sh:
  file.managed:
    - source: salt://{{ tpldir }}/bash.bashrc.d/{{ name }}.sh
    - user: root
    - group: root
    - mode: 755
    - require:
      - file: /etc/bash.bashrc.d
{% endmacro %}

bash-completion:
  pkg.installed

/etc/bash.bashrc:
  file.managed:
    - source: salt://{{ tpldir }}/bashrc
    - user: root
    - group: root
    - mode: 755

/etc/bash.bashrc.d:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mod: 755
    - recurse:
      - user
      - group
      - mode

{{ bashrc('alias') }}
{{ bashrc('history') }}

