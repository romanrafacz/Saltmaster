nagios:
  nrpe:
    server_address: 172.31.12.218
    server_port: 5666
    pid_file: /var/run/nagios/nrpe.pid
    allowed_hosts: 172.31.12.218
    command_timeout: 60
    connection_timeout: 3000
    dont_blame_nrpe: 0
    nrpe_commands:
      - command[check_users]=/usr/lib/nagios/plugins/check_users -w 5 -c 10
      - command[check_load]=/usr/lib/nagios/plugins/check_load -w 15,10,5 -c 30,25,20
      - command[check_hda1]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/sda1
      - command[check_zombie_procs]=/usr/lib/nagios/plugins/check_procs -w 5 -c 10 -s Z
      - command[check_total_procs]=/usr/lib/nagios/plugins/check_procs -w 150 -c 200
      - command[check_xvda1]=/user/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/xvda1
