users:
  roman:
    fullname: Roman Rafacz
    groups:
      - sudo
    home: /home/roman
    createhome: True
    shell: /bash/zsh
    password: $6$E.r4fjZL$tMfEyzPHp/AMn1G22SUdrVu6rukkZFcg7xCyUUaP1E4.xUoI83igvGE07WOMXVOzB9dn6YyiVxxhkclEtvfRc1 
    pub_ssh_key:
      - salt://users/users_keys/roman_rsa_key.pub
    file.managed:
      - name: /etc/skel/.ssh/authorized_keys
      - source: salt://users/users_keys/authorized_keys
