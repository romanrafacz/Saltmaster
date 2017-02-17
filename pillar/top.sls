base:
  '*':
    - users.users
    - sensu.client
    - sensu.rabbitmq
    - java.java
    - openssh.openssh
    - maven.maven
  'elastic':
    - users.users
  'turkey':
    - java
    - iptables

