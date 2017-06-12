base:
  '*':
    - users.users
    - openssh.openssh
    - nagios.nrpe
    - firewall
    - vim
  'old_elastic_test':
    - firewall.base
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
    - java
    - maven
  'stacks*':
    - postgres
    - java
    - maven 
    - firewall.jvm 
