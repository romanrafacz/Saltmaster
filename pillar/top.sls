base:
  '*':
    - users.users
    - openssh.openssh
  'elastic':
    - users.users
  'turkey':
    - java
    - iptables
    - sensu.client
    - sensu.rabbitmq
  'jvm*':
    - java.java
    - maven.maven

