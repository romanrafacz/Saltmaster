base:
  '*':
    - users.users
    - openssh.openssh
    - iptables.iptables
    - nagios.nrpe
    - firewall.base
  'oldyteast_elastic':
    - iptables.iptables
    - sensu.client
    - sensu.rabbitmq
    - firewall.jvm
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
    - firewall.jvm
    - maven.maven
  'ngins*':
    - nginx
  'icinga*':
    - postgres
    - icinga2 
    - postgres.icinga2


