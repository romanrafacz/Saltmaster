base:
  '*':
    - users.users
    - sensu.client
    - sensu.rabbitmq
    - java.java
  'elastic':
    - users.users
  'turkey':
    - java
    - iptables

