firewall:
  services:
    ssh:
      block_nomatch: False
      ips_allow:
        - 0.0.0.0/0
    http:
      block_nomatch: False
      ips_allow:
        - 0.0.0.0/0
    http-alt:
      block_nomatch: False
      ips_allow:
        - 0.0.0.0/0

