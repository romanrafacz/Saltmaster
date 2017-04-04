restart_services:
  cmd.service.restart:
    - tgt: '*' 
    - arg:
      - nginx 
