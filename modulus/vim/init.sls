{% from "vim/map.jinja" import vim with context %}
git clone https://github.com/VundleVim/Vundle.vim.git:
  git.latest:
    - name: https://github.com/VundleVim/Vundle.vim.git
    - rev: 'HEAD'
    - target: {{vim.share_dir}}/Vundle.vim
