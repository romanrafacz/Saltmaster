base:
  '*':
    - users.users
    - openssh.openssh
    - iptables.iptables
    - nagios.nrpe
    - firewall.base
  'old_elastic_test':
    - iptables.iptables
    - sensu.client
    - sensu.rabbitmq
    - firewall.jvm
  'appserver*':
    - java
    - maven
    - firewall.jvm
    - postgres
  'db*':
    - postgres
    - firewall.jvm
    - docker
  'nagios':
    - postgres
  'elastic*':
    - java
    - elasticsearch
    - kibana
    - firewall.elastic
    - firewall.jvm
    - maven
  'ngins*':
    - nginx
  'icinga*':
    - postgres
    - icinga2 
    - postgres.icinga2
  'build*':
    - docker
    - firewall.docker
    - firewall.jvm
    - java
    - maven
