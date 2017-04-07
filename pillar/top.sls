base:
  '*':
    - users.users
    - openssh.openssh
    - iptables.iptables
    - nagios.nrpe
    - firewall.base
  'elastic':
    - iptables.iptables
    - sensu.client
    - sensu.rabbitmq
  'appserver*':
    - java.java
    - maven.maven
    - firewall.jvm
    - postgres
  'db*':
    - postgres
    - firewall.jvm
  'nagios':
    - postgres
  'elastic*':
    - java.java
    - elasticsearch
    - kibana
    - firewall.elastic
    - nginx


