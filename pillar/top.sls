base:
  '*':
    - users.users
    - openssh.openssh
    - iptables.iptables
    - nagios.nrpe
  'elastic':
    - firewall.base
    - iptables.iptables
    - sensu.client
    - sensu.rabbitmq
  'appserver*':
    - firewall.base
    - java.java
    - maven.maven
    - firewall.jvm
    - postgres
  'db*':
    - firewall.base
    - postgres
    - firewall.jvm
  'nagios':
    - firewall.base
    - postgres
  'elastic*':
    - firewall.base
    - java.java
    - elasticsearch
    - kibana
    - firewall.elastic
    - nginx


