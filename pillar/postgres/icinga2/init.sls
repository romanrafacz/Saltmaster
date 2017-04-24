postgres:
  # Set True to configure upstream postgresql.org repository for YUM or APT
  #use_upstream_repo: False
  # Version to install from upstream repository
  version: '9.5'

  # These are Debian/Ubuntu specific package names
  pkg: 'postgresql-9.5'
  pkg_client: 'postgresql-client-9.3'

  # Additional packages to install with PostgreSQL server,
  # this should be in a list format
  pkgs_extra:
    - postgresql-contrib

  users:
    roman:
      ensure: present
      password: 'snickers'
      createdb: True 
      createroles: True 
      createuser: True 
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

