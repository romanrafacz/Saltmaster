sshd_config:
  # This keyword is totally optional
  ConfigBanner: |
    # Alternative banner for the config file
    # (Indented) hash signs lose their special meaning here
    # and the lines will be written as-is.
  Port: 22
  Protocol: 2
  HostKey:
    - /etc/ssh/ssh_host_rsa_key
    - /etc/ssh/ssh_host_dsa_key
    - /etc/ssh/ssh_host_ecdsa_key
    - /etc/ssh/ssh_host_ed25519_key
  UsePrivilegeSeparation: 'yes'
  KeyRegenerationInterval: 3600
  ServerKeyBits: 768
  SyslogFacility: AUTH
  LogLevel: INFO
  ClientAliveInterval: 0
  ClientAliveCountMax: 3
  LoginGraceTime: 120
  PermitRootLogin: 'yes'
  PasswordAuthentication: 'no'
  StrictModes: 'yes'
  MaxAuthTries: 6
  MaxSessions: 10
  RSAAuthentication: 'yes'
  PubkeyAuthentication: 'yes'
  AuthorizedKeysCommand: '/usr/bin/sss_ssh_authorizedkeys'
  AuthorizedKeysCommandUser: 'nobody'
  IgnoreRhosts: 'yes'
  RhostsRSAAuthentication: 'no'
  HostbasedAuthentication: 'no'
  PermitEmptyPasswords: 'no'
  ChallengeResponseAuthentication: 'no'
  AuthenticationMethods: 'publickey,keyboard-interactive'
  AuthorizedKeysFile: '%h/.ssh/authorized_keys'
  X11Forwarding: 'yes'
  X11DisplayOffset: 10
  PrintMotd: 'no'
  PrintLastLog: 'yes'
  TCPKeepAlive: 'yes'
  AcceptEnv: "LANG LC_*"
  Subsystem: "sftp /usr/lib/openssh/sftp-server"
  UsePAM: 'yes'
  UseDNS: 'yes'
  AllowUsers: 'vader@10.0.0.1 maul@evil.com sidious luke'
  DenyUsers: 'yoda chewbaca@112.10.21.1'
  AllowGroups: 'wheel staff imperial'
  DenyGroups: 'rebel'
  matches:
    sftp_chroot:
      type:
        Group: sftpusers
      options:
        ChrootDirectory: /sftp-chroot/%u
        X11Forwarding: no
        AllowTcpForwarding: no
        ForceCommand: internal-sftp
  # Check `man sshd_config` for supported KexAlgorithms, Ciphers and MACs first.
  # For these three keywords, the options may be specified as a list...
  KexAlgorithms:
    - diffie-hellman-group14-sha1
    - diffie-hellman-group1-sha1
  # ... or a single string.
  Ciphers: 'aes128-ctr,aes256-ctr'
  MACs: 'hmac-sha1'
  # Similar situation for ssh_config

ssh_config:
  StrictHostKeyChecking: no
  ForwardAgent: no
  ForwardX11: no
  RhostsRSAAuthentication: no
  RSAAuthentication: yes
  PasswordAuthentication: yes
  HostbasedAuthentication: no
  GSSAPIAuthentication: no
  GSSAPIDelegateCredentials: no
  BatchMode: 'yes'
  CheckHostIP: 'yes'
  AddressFamily: 'any'
  ConnectTimeout: 0
  IdentityFile: '~/.ssh/id_rsa'
  Port: 22
  Protocol: 2
  Cipher: '3des'
  Tunnel: 'no'
  TunnelDevice: 'any:any'
  PermitLocalCommand: 'no'
  VisualHostKey: 'no'

openssh:
  # Controls if SSHD should be enabled/started
  sshd_enable: true
  auth:
    rom-valid-ssh-key:
      - user: roman 
        present: True
        enc: ssh-rsa
        comment: romans key
        source: salt://users/users_keys/rome.pub

  generate_dsa_keys: False
  absent_dsa_keys: False
  provide_dsa_keys: False
  dsa:
    private_key: |
      -----BEGIN DSA PRIVATE KEY-----
      NOT_DEFINED
      -----END DSA PRIVATE KEY-----
    public_key: |
      ssh-dss NOT_DEFINED

  generate_ecdsa_keys: False
  absent_ecdsa_keys: False
  provide_ecdsa_keys: False
  ecdsa:
    private_key: |
      -----BEGIN EC PRIVATE KEY-----
      NOT_DEFINED
      -----END EC PRIVATE KEY-----
    public_key: |
      ecdsa-sha2-nistp256 NOT_DEFINED

  generate_rsa_keys: False
  generate_rsa_size: 4096
  absent_rsa_keys: False
  provide_rsa_keys: False
  rsa:
    private_key: |
      -----BEGIN RSA PRIVATE KEY-----
      NOT_DEFINED
      -----END RSA PRIVATE KEY-----
    public_key: |
      ssh-rsa NOT_DEFINED

  generate_ed25519_keys: False
  absent_ed25519_keys: False
  provide_ed25519_keys: False
  ed25519:
    private_key: |
      -----BEGIN OPENSSH PRIVATE KEY-----
      NOT_DEFINED
      -----END OPENSSH PRIVATE KEY-----
    public_key: |
      ssh-ed25519 NOT_DEFINED

  known_hosts:
    # The next 2 settings restrict the set of minions that will be added in
    # the generated ssh_known_hosts files (the default is to match all minions)
    target: '*'
    expr_form: 'glob'
    # Name of mining functions used to gather public keys and hostnames
    # (the default values are shown here)
    mine_keys_function: public_ssh_host_keys
    mine_hostname_function: public_ssh_hostname
    # List of DNS entries also pointing to our managed machines and that we want
    # to inject in our generated ssh_known_hosts file
    aliases:
      - cname-to-minion.example.org
      - alias.example.org

  # specify DH parameters (see /etc/ssh/moduli)
  moduli: |
    # Time Type Tests Tries Size Generator Modulus
    20120821045639 2 6 100 2047 2 DD2047CBDBB6F8E919BC63DE885B34D0FD6E3DB2887D8B46FE249886ACED6B46DFCD5553168185FD376122171CD8927E60120FA8D01F01D03E58281FEA9A1ABE97631C828E41815F34FDCDF787419FE13A3137649AA93D2584230DF5F24B5C00C88B7D7DE4367693428C730376F218A53E853B0851BAB7C53C15DA7839CBE1285DB63F6FA45C1BB59FE1C5BB918F0F8459D7EF60ACFF5C0FA0F3FCAD1C5F4CE4416D4F4B36B05CDCEBE4FB879E95847EFBC6449CD190248843BC7EDB145FBFC4EDBB1A3C959298F08F3BA2CFBE231BBE204BE6F906209D28BD4820AB3E7BE96C26AE8A809ADD8D1A5A0B008E9570FA4C4697E116B8119892C604293680B09D63
    20120821045830 2 6 100 2047 2 DD2047CBDBB6F8E919BC63DE885B34D0FD6E3DB2887D8B46FE249886ACED6B46DFCD5553168185FD376122171CD8927E60120FA8D01F01D03E58281FEA9A1ABE97631C828E41815F34FDCDF787419FE13A3137649AA93D2584230DF5F24B5C00C88B7D7DE4367693428C730376F218A53E853B0851BAB7C53C15DA7839CBE1285DB63F6FA45C1BB59FE1C5BB918F0F8459D7EF60ACFF5C0FA0F3FCAD1C5F4CE4416D4F4B36B05CDCEBE4FB879E95847EFBC6449CD190248843BC7EDB145FBFC4EDBB1A3C959298F08F3BA2CFBE231BBE204BE6F906209D28BD4820AB3E7BE96C26AE8A809ADD8D1A5A0B008E9570FA4C4697E116B8119892C6042936814C2FFB
    20120821050046 2 6 100 2047 2 DD2047CBDBB6F8E919BC63DE885B34D0FD6E3DB2887D8B46FE249886ACED6B46DFCD5553168185FD376122171CD8927E60120FA8D01F01D03E58281FEA9A1ABE97631C828E41815F34FDCDF787419FE13A3137649AA93D2584230DF5F24B5C00C88B7D7DE4367693428C730376F218A53E853B0851BAB7C53C15DA7839CBE1285DB63F6FA45C1BB59FE1C5BB918F0F8459D7EF60ACFF5C0FA0F3FCAD1C5F4CE4416D4F4B36B05CDCEBE4FB879E95847EFBC6449CD190248843BC7EDB145FBFC4EDBB1A3C959298F08F3BA2CFBE231BBE204BE6F906209D28BD4820AB3E7BE96C26AE8A809ADD8D1A5A0B008E9570FA4C4697E116B8119892C60429368214FC53
    20120821050054 2 6 100 2047 5 DD2047CBDBB6F8E919BC63DE885B34D0FD6E3DB2887D8B46FE249886ACED6B46DFCD5553168185FD376122171CD8927E60120FA8D01F01D03E58281FEA9A1ABE97631C828E41815F34FDCDF787419FE13A3137649AA93D2584230DF5F24B5C00C88B7D7DE4367693428C730376F218A53E853B0851BAB7C53C15DA7839CBE1285DB63F6FA45C1BB59FE1C5BB918F0F8459D7EF60ACFF5C0FA0F3FCAD1C5F4CE4416D4F4B36B05CDCEBE4FB879E95847EFBC6449CD190248843BC7EDB145FBFC4EDBB1A3C959298F08F3BA2CFBE231BBE204BE6F906209D28BD4820AB3E7BE96C26AE8A809ADD8D1A5A0B008E9570FA4C4697E116B8119892C60429368218E83F
  # ALTERNATIVELY, specify the location of the moduli file. Examples:
  #moduli_source: http://some.server.somewhere/salt/moduli
  #moduli_source: salt://files/ssh/moduli
  # If moduli is specified, moduli_source will be ignored.
  # Also, a proper hash file *must* be included in the same path. E.g.:
  #     http://some.server.somewhere/salt/moduli.hash
  #     salt://files/ssh/moduli.hash
  # These will be automatically referenced to by the ssh_moduli state.

# Required for openssh.known_hosts
mine_functions:
  public_ssh_host_keys:
    mine_function: cmd.run
    cmd: cat /etc/ssh/ssh_host_*_key.pub
    python_shell: True
  public_ssh_hostname:
    mine_function: grains.get
    key: id
