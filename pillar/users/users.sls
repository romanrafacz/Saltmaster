users:
  roman:
    fullname: Roman Rafacz
    password: $6$Yh4Qv.FM$g2i8qEo6ePlkgWwJ8FitHiH.ieJm16Y8XkiYv8EDE7Aws220nabkPL0sK5kzXGxpLDxO0kHyC/C4rNbyaw9uP1
    enforce_password: True
    empty_password: False
    hash_password: False
    groups:
      - sudo
    home: /home/roman
    homedir_owner: roman
    user_dir_mode: 750
    createhome: True
    shell: /bin/zsh
    manage_vimrc: True
    pub_ssh_key:
      - salt://users/keys/roman_rsa_key.pub
    file.managed:
      - user: roman
      - mode: 600
      - name: /home/roman/.ssh/authorized_keys
      - source: salt://users/userskeys/authorized_keys
    sudouser: True

