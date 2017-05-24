firewall:
  install: True
  enabled: True
  strict: True
  services:
    httpd:
      iptables.append:
        - table: filter
        - chain: INPUT
        - jump: ACCEPT
        - match: state
        - connstate: NEW
        - dport: 80
        - sport: 1025:65535
        - save: True
