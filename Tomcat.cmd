sudo apt update

sudo apt-get install -y openjdk-11-jdk

cd /opt

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.86/bin/apache-tomcat-9.0.86.tar.gz

sudo tar -xf apache-tomcat-9.0.86.tar.gz

sudo mv apache-tomcat-9.0.86 tomcat9

sudo rm -rf apache-tomcat-9.0.86.tar.gz

sudo chown -R  ubuntu:ubuntu tomcat9/

cd /opt/tomcat9/bin

ln -s /opt/tomcat9/bin/startup.sh /usr/bin/startTomcat
ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/stopTomcat

cd /opt/tomcat9/webapps/manager/META-INF

vim context.xml

# Comment the  Value class name 
-->
<Context antiResourceLocking="false" privileged="true" >
<!-- <Valve className="org.apache.catalina.valves.RemoteAddrValve"
allow="127\.\d+\.\d+\.\d+| :: 1|0:0:0:0:0:0:0:1" /> -- >

stopTomcat
startTomcat

cd /opt/tomcat9/conf/

vim tomact-users.xml

Update user.xml file {or} create new user credentials

stopTomcat
startTomcat

vi tomcat-users.xml

=================== for only Tomcat login ====================================
<user username="role1" password="<must-be-changed>" roles="role1"/>

<user username="tomcat" password="password" roles="admin-gui,manager-gui"/>
===============================================================================


=========================Tomcat CI/CD Integration=======================

<user username="tomcat" password="password" roles="admin-gui,manager-gui,manager-script"/>

stopTomcat

startTomcat

Refresh the browser and use the credentials
-------------------------------------------
username= tomcat
password= password