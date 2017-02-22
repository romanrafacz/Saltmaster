base:
  '*':
    - users.users
    - openssh.openssh
    - firewall.base
  'elastic':
    - users.users
    - iptables
    - sensu.client
    - sensu.rabbitmq
  'jvm*':
    - java.java
    - maven.maven
    - iptables.iptables
    - firewall.jvm


