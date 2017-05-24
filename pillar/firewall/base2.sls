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
    5432:
      block_nomatch: False
      protos:
       - udp
       - tcp
      ips_allow:
        - 172.31.0.0/16
    4505:
      block_nomatch: False
      protos:
       - udp
       - tcp
      ips_allow:
        - 172.31.0.0/16
    4506:
      block_nomatch: False
      protos:
       - udp
       - tcp
      ips_allow:
        - 172.31.0.0/16
    5666:
      block_nomatch: False
      protos:
       - tcp
      ips_allow:
        - 172.31.0.0/16
    1194:
      block_nomatch: False
      protos:
       - tcp
      ips_allow:
        - 172.31.0.0/16
