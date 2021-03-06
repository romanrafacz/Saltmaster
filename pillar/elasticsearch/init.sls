elasticsearch:
  version: 5.3.0
  config:
    #cluster.name: my-application
    #node.name: node2
    #node.rack: r2
    #path.data: /srv/data
    #path.logs: /srv/logs
    #bootstrap.mlockall: true
    network.host: 127.0.0.1
    http.port: 9200
    #discovery.zen.ping.unicast.hosts: ["host1", "host2"]
    #discovery.zen.minimum_master_nodes: 3
    #gateway.recover_after_nodes: 3
    #node.max_local_storage_nodes: 1
    #action.destructive_requires_name: true
  sysconfig:
    ES_STARTUP_SLEEP_TIME: 5
    ES_HEAP_SIZE: 8g
    MAX_OPEN_FILES: 65535
  plugins:
    lang-python: lang-python
    kopf: lmenezes/elasticsearch-kopf
