base:
  '*':
    - users.users
    - sensu.client
    - sensu.rabbitmq
    - sensu.sensu
  'elastic':
    - users.users
  'turkey':
    - java
    - iptables

