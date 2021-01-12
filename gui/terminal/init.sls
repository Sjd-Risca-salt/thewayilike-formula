
kitty:
  pkg:
    - installed

/home/risca/.config/kitty:
  file.recurse:
    - source: salt://{{ slspath }}/config
    - user: risca
    - group: risca
    - dir_mode: 555
    - file_mode: 444
    - clean: true
