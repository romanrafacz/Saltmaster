firewall:
  services:
    5601:
      block_nomatch: False
      protos:
       - udp
       - tcp
      ips_allow:
        - 172.31.0.0/0
    9200:
      block_nomatch: False
      protos:
       - udp
       - tcp
      ips_allow:
        - 172.31.0.0/0
