nginx:
  install_from_source: True
  use_upstart: True
  use_sysvinit: False

# ========
# nginx.ng
# ========

nginx:
  ng:
    # PPA install
    install_from_ppa: True
    # Set to 'stable', 'development' (mainline), 'community', or 'nightly' for each build accordingly ( https://launchpad.net/~nginx )
    ppa_version: 'stable'

    # Source install
    source_version: '1.10.3'
    source_hash: ''
    
    # These are usually set by grains in map.jinja
    lookup:
      package: nginx-custom
      service: nginx
      webuser: www-data
      conf_file: /etc/nginx/nginx.conf
      server_available: /etc/nginx/sites-available
      server_enabled: /etc/nginx/sites-enabled
      server_use_symlink: True
      # This is required for RedHat like distros (Amazon Linux) that don't follow semantic versioning for $releasever
      rh_os_releasever: '6'
      # Currently it can be used on rhel/centos/suse when installing from repo
      gpg_check: True


    service:
      enable: True # Whether or not the service will be enabled/running or dead
      #opts: {} # this partially exposes parameters of service.running / service.dead

    server:
      opts: {} # this partially exposes file.managed parameters as they relate to the main nginx.conf file

      # nginx.conf (main server) declarations
      # dictionaries map to blocks {} and lists cause the same declaration to repeat with different values
      config: 
        worker_processes: 4
        pid: /run/nginx.pid
        events:
          worker_connections: 768
        http:
          sendfile: 'on'
          include:
            - /etc/nginx/mime.types
            - /etc/nginx/conf.d/*.conf
            - /etc/nginx/sites-enabled/*

    servers:
      disabled_postfix: .disabled # a postfix appended to files when doing non-symlink disabling
      symlink_opts: {} # partially exposes file.symlink params when symlinking enabled sites
      rename_opts: {} # partially exposes file.rename params when not symlinking disabled/enabled sites
      managed_opts: {} # partially exposes file.managed params for managed server files
      dir_opts: {} # partially exposes file.directory params for site available/enabled dirs

      # server declarations
      # servers will default to being placed in server_available
      managed:
        kibana: # relative pathname of the server file
          # may be True, False, or None where True is enabled, False, disabled, and None indicates no action
          available_dir: /tmp/sites-available # an alternate directory (not sites-available) where this server may be found
          enabled_dir: /tmp/sites-enabled # an alternate directory (not sites-enabled) where this server may be found
          disabled_name: kibana.aint_on # an alternative disabled name to be use when not symlinking
          enabled: True
          overwrite: True # overwrite an existing server file or not
          
          # May be a list of config options or None, if None, no server file will be managed/templated
          # Take server directives as lists of dictionaries. If the dictionary value is another list of
          # dictionaries a block {} will be started with the dictionary key name
          config:
            - server:
              - server_name: _
              - listen: 
                - 80
                - default_server
              - location /:
                - proxy_pass: 
		  - localhost:5601
		- proxy_http_version: 
		  - 1.1
		- proxy_set_header: 
		  - Upgrade $http_upgrade
		- proxy_set_header: 
		  - Connection 'upgrade'
		- proxy_set_header:
		  - Host 
                  - $host
		- proxy_cache_bypass: 
	 	  - $http_upgrade
                
          # The above outputs:
          # server {
          #    server_name localhost;
          #    listen 80 default_server;
          #    index index.html index.htm;
          #    location ~ .htm {
          #        try_files $uri $uri/ =404;
          #        test something else;
          #    }
          # }         

