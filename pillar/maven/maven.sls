maven:
  version: 3.3.9
  source_url: http://apache.mirrors.hoobly.com/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
  prefix: /usr/lib
  m2_home: /usr/lib/apache-maven-3.3.9/bin

symlink:
  file.symlink:
    - name: /usr/lib/mvn
    - target: /usr/lib/apache-maven-3.3.9/bin

