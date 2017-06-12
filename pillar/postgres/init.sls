postgres:
  # Set True to configure upstream postgresql.org repository for YUM or APT
  #use_upstream_repo: False
  # Version to install from upstream repository
  version: '9.5'

  # These are Debian/Ubuntu specific package names
  pkg: 'postgresql-9.5'
  pkg_client: 'postgresql-client-9.5'

  # Additional packages to install with PostgreSQL server,
  # this should be in a list format
  pkgs_extra:
    - postgresql-contrib


  acls:
    - ['host', 'all', 'all', '0.0.0.0/0']
    - ['host', 'all', 'all', '127.0.0.1/32']
    - ['host', 'steam', 'all', '172.31.0.0/20']

  users:
    roman:
      ensure: present
      password: 'snickers'
      createdb: True 
      createroles: True 
      createuser: True 
      inherit: True
      replication: False

    steam:
      ensure: present
      password: 'snickers'
      createdb: True 
      createroles: False 
      createuser: False 
      inherit: True
      replication: False

    rome:
      ensure: present
      password: 'snickers'
      createdb: False
      createroles: False
      createuser: False
      inherit: True
      replication: False
  
  databases:
    roman:
      owner: 'roman'
      template: 'template0'
      lc_ctype: 'en_US.UTF-8'
      lc_collate: 'en_US.UTF-8'
    steam:
      owner: 'steam'
      template: 'template0'
      lc_ctype: 'en_US.UTF-8'
      lc_collate: 'en_US.UTF-8'
    steam_db:
      owner: 'steam'
      template: 'template0'
      lc_ctype: 'en_US.UTF-8'
      lc_collate: 'en_US.UTF-8'

