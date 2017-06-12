firewall:
  installed: True
  enabled: True
  strict: True
  services:
    http:
      block_nomatch: False
      ips_allow:
        - 0.0.0.0/0

  whitelist:
    networks:
      ips_allow:
        - 172.31.0.0/20
