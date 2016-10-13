sensu:
  client:
    name: {{ grains['host'] }}
    address: {{ grains['ip_interfaces']['eth0'][0] }}
    subscriptions: ['ALL']
