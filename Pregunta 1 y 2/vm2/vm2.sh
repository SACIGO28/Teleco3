
sudo -i

yum -y update
yum -y install wget

sudo cp /vagrant/config /etc/selinux/config

## última versión de Oracle Java en el servidor
wget --no-cookies --no-check-certificate --header "Cookie:oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm"

## instalar archivo Red Hat Package Manager (se utiliza para almacenar paquetes de instalación en SO Linux)
yum -y localinstall jdk-8u131-linux-x64.rpm

##  descargar el paquete War de Streama 
wget https://github.com/dularion/streama/releases/download/v1.1/streama-1.1.war

mkdir /opt/streama
mv streama-1.1.war /opt/streama/streama.war

mkdir /opt/streama/media
chmod 664 /opt/streama/media

sudo cp /vagrant/vm2/streama.service /etc/systemd/system/streama.service
mv streama.mv.db /opt/streama/streama.mv.db
mv streama.trace.db /opt/streama/streama.trace.db
systemctl daemon-reload

systemctl start streama
systemctl enable streama
systemctl status streama

systemctl disable firewalld



