base:
  '*':
    - users.users
    - openssh.openssh
    - firewall.base
    - iptables.iptables
  'elastic':
    - users.users
    - iptables
    - sensu.client
    - sensu.rabbitmq
  'appserver*':
    - java.java
    - maven.maven
    - firewall.jvm
    - postgres
  'db*':
    - postgres
    - java.java
    - maven.maven


