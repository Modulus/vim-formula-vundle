# TODO: hiv inn denne ogs: https://github.com/saltstack/salt-vim
{% from "vim/map.jinja" import vim with context %}
include:
  - vim
  - vim.salt
  - git

git clone https://github.com/VundleVim/Vundle.vim.git:
  git.latest:
    - name: https://github.com/VundleVim/Vundle.vim.git
    - rev: 'HEAD'
    - target: {{vim.share_dir}}/bundle/Vundle.vim
    - require:
      - sls: vim
      - sls: vim.salt
      # - sls: git

/etc/vim/vimrc.local:
  file.managed:
    - source: salt://modulus/vim/templates/vimrc.local
    - makedirs: True
    - require:
      - git: git clone https://github.com/VundleVim/Vundle.vim.git
