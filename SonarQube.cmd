sudo su -

wget https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.rpm

sudo rpm -ivh jdk-17_linux-x64_bin.rpm

java -version

cd /opt

wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.4.0.54424.zip

sudo unzip sonarqube-9.4.0.54424.zip

useradd sonar

visudo

sonar ALL=(ALL)	NOPASSWD:ALL   #101 line

chown -R sonar:sonar /opt/sonarqube-9.4.0.54424/

chmod -R 775 /opt/sonarqube-9.4.0.54424/

su - sonar

cd /opt/sonarqube-9.4.0.54424

ls

cd bin

ls

cd linux-x86-64

ls

./sonar.sh start

starting SonarQube
Started SonarQube

./sonar.sh status

cd ../../logs/

ls 

cat sonar.log   {or} cat sonar.20230714.log

sonarQube runs on 9000

username: admin
password: admin