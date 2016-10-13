sensu:
  ssl:
    enable: True
    cert_pem: |
      - salt://sensu/certificates/cert.pem
    key_pem: |
      - salt://sensu/certificates/key.pem
