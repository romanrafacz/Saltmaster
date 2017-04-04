base:
  '*':
    - users.users
    - openssh.openssh
    - firewall.base
    - iptables.iptables
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


