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
    4505:
      block_nomatch: False
      protos:
       - udp
       - tcp
      ips_allow:
        - 0.0.0.0/0
    4506:
      block_nomatch: False
      protos:
       - udp
       - tcp
      ips_allow:
        - 0.0.0.0/0
