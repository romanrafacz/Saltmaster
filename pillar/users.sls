users:
  roman:
    fullname: Roman Rafacz
    groups:
      - sudo
    home: /home/roman
    createhome: True
    shell: /bash/zsh
    password: Snick3rs1
    pub_ssh_key:
      - salt://users_keys/roman_rsa_key.pub
    file.managed:
      - name: /etc/skel/.ssh/authorized_keys
      - source: salt://users_keys/authorized_keys
