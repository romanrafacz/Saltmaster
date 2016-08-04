java:
  lookup:
    manage:
      jdk:
        current_ver: 8u91
        versions:
          8u91:
            source: 'salt://tomcat/jdk-8u91-linux-x64.tar.gz'
            version: jdk1.8.0_91
users:
  manage:
    tomcat:
      home: /var/lib/tomcat
      shell: /bin/false
      system: True
      groups:
        - tomcat

groups:
  manage:
    tomcat:
      system: True

sysctl:
  params:
    - name: vm.swappiness
      value: 0

tomcat:
  lookup:
    instances:
      i1:
        id: 1
        cur_version: 8.0.35
        source: 'salt://tomcat/apache-tomcat-8.0.35.tar.gz'
        versions:
          '8_0_35':
            version: 8.0.35
            settings:
              users:
                plain: |
                  <role rolename="manager"/>
                  <user username="admin" password="admin" roles="manager-gui"/>
                  <user username="deploy" password="admin" roles="manager-script,manager-gui"/>
                  <user username="tomcat" password="snickers" roles="manager-script,manager-gui"/>
            files:
              manage:
                - setenv
                - server
                - tomcat_users
                - init
              setenv:
                contents: |
                  export \
                  JAVA_OPTS="-Xms128m -Xmx128m" \
                  JAVA_HOME=/opt/java/jdk/current/src/ \
                  JAVA_OPTS="\
                    -Djava.net.preferIPv4Stack=true \
                    -Dhudson.DNSMultiCast.disabled=true \
                    "
              init:
                path: /etc/init.d/tomcat-i1
            webapps:
              docs:
                manage: True
                ensure: absent
              examples:
                manage: True
                ensure: absent
              host_manager:
                alias: host-manager
                manage: True
                ensure: absent
              manager:
                manage: False
              ROOT:
                manage: True
                ensure: absent
              jenkins:
                manage: True
                war:
                  deployment_type: manager
                  url: 'http://localhost:18080/manager'
                  source: 'salt://tomcat/jenkins.war'
                  #source: 'file:///vagrant/share/misc/jenkins.war'
                  #source: 'http://mirrors.jenkins-ci.org/war/latest/jenkins.war'
                  #source_hash: sha512=b059869971dc14db0398fa1727df8ed1446fa21b0ed25697c1eef8fe9044ca720b61cfa3b4a38ba8e3101bb0c34f82ec8cb18516f80c9c2359a7e04fe040cfe2
tomcat-manager:
  user: tomcat-salt
  passwd: snickers
