sudo su -
apt-get update -y
sudo apt-get install java-1.8.0-openjdk.x86_64 -y
java -version

cd /opt

sudo wget -0 latest-unix.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz

tar -xvzf latest-unix.tar.gz

mv /opt/nexus-3.63.0-01 /opt/nexus

useradd nexus

visudo

nexus ALL=(ALL) NOPASSWD: ALL # 101 line
chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/sonatype-work
chmod -R 775 /opt/nexus
chmod -R 775 /opt/sonatype-work
vi /opt/nexus/bin/nexus.rc
run_as_user="nexus"
ln -s /opt/nexus/bin/nexus /etc/init.d/nexus --- > ln -s to creat link
sudo systemctl enable nexus
sudo systemctl start nexus
sudo systemctl status nexus

username: admin
sudo cat /opt/sonatype-work/nexus3/admin.password   ==> copy the password
password: paste the password here

sudo firewall-cmd --add-port=8081/tcp --permanent
sudo firewall-cmd --reload

Plugin as " Nexus Artifact Uploader" and "Pipeline Utility step"