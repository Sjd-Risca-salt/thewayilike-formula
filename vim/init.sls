vim:
  pkg:
    - installed

vimconfig-syntaxon:
  file:
    - replace
    - name: /etc/vim/vimrc
    - pattern: '" *syntax on'
    - repl: 'syntax on'
    - backup: false
    - require:
      - pkg: vim
vimconfig-darkbgd:
  file:
    - replace
    - name: /etc/vim/vimrc
    - pattern: '" *set background=dark'
    - repl: 'set background=dark'
    - backup: false
    - require:
      - pkg: vim

{%  if salt['pillar.get']('vim:history', False) -%}
{%-   set commented = ' ' -%}
{%- else -%}
{%-   set commented = '"' -%}
{%- endif %}
{%- if salt['pillar.get']('vim:extra', False) -%}
{%-   set extra = salt['pillar.get']('vim:extra') %}
{%- else %}
{%-   set extra = '' %}
{%- endif %}
vimHistorySave:
  file.blockreplace:
    - name: /etc/vim/vimrc
    - marker_start: '" This section is managed by SALTSTACK - donotedit!'
    - marker_end: '" End of section managed by SALTSTACK'
    - append_if_not_found: True
    - require:
      - pkg: vim
    - content: |
        {{ commented }}au BufWritePre * let &backupext = '~~' . strftime("%Y.%m.%d-%H.%M.%S")
        {{ commented }}set backup
        {{ commented }}set writebackup
        {{ extra|indent(8) }}

vimDefaultEditor:
  alternatives.install:
    - name: editor
    - link: /usr/bin/editor
    - path: /usr/bin/vim
    - priority: 100
    - require:
      - pkg: vim
