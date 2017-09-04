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
<<<<<<< HEAD
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
=======
    - target: {{vim.share_dir}}/Vundle.vim
>>>>>>> a3c72bc17ea3b538d094a377e5a26c2696255ed6
