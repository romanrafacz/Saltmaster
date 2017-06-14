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
    manage_profile: True
    sudouser: True
    ssh_keys:
      privkey: salt://users/keys/ids_rsa
      pubkey: salt://users/keys/ids_rsa.pub
    ssh_auth_file:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCCH8Y10Bkc5r6h5uYZJERgkepI7sjheBwCoM2WhctCLU+PjScve5CUNvLnBphM13TZjTTbvJ2b3OTDyrhweRcFw/EDhhA/wZFqAVSGfIR3+aAhKJ9lD92plwvJlK1V07ZAfeMnB60NClo+yRr6gKXxk4765KfYmA8s1S85DpIv51aW9kzC8t6vgC1XRXg2BfRilxHPT7vdWQrg/ofaNiv81KH9pGb+BK/y2ogddz1PtTnpTCS4J/LrVVbeYoKm0eGyg7K/W66Rfo7Z0jsqw7pImInN/So1+6wy/JfHX7tZjBGqBG33juTcEL7rhxAmj+apzARXJo5ZuCDsfmNRbNGP imported-openssh-key
