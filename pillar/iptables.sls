firewall:
  install: True
  enabled: True
  strict: True
  services:
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
      ip_allow:
        - 10.0.0.0/8
        - 192.168.0.0/24
