firewall:
  services:
    ssh:
      block_nomatch: False
      ips_allow:
        - 172.31.0.0/20
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
        - 172.31.0.0/20
    4506:
      block_nomatch: False
      protos:
       - udp
       - tcp
      ips_allow:
        - 172.31.0.0/20
    5666:
      block_nomatch: False
      protos:
       - tcp
      ips_allow:
        - 172.31.0.0/20