firewall:
  install: True
  enabled: True
  strict: True
  services:
    ssh:
      block_nomatch: False
      ips_allow:
        - 0.0.0.0
        - 192.168.0.0/24
        - 10.0.2.2/32
    http:
      block_nomatch: False 
      protos:
        - udp
        - tcp
    https:
      block_nomatch: False 
      protos:
        - udp
        - tcp
    snmp:
      block_nomatch: False
      protos:
        - udp
        - tcp
      interfaces:
        - eht0
    4505:
      block_nomatch: False
      protos:
        - tcp
    8080:
      block_nomatch: False
      protos:
        - tcp
    3606:
      block_nomatch: False
      protos:
        - tcp

  whitelist:
    networks:
      ips_allow:
        - 10.0.0.0/8

