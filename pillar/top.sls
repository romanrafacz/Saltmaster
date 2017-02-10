base:
  '*':
    - users.users
    - sensu.client
    - sensu.rabbitmq
    - java.java
    - openssh.openssh
  'elastic':
    - users.users
  'turkey':
    - java
    - iptables

