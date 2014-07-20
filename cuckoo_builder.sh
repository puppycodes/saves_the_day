#!/bin/sh -ex

#Cuckoo builder script by @beast_fighter -- last updated: 7/19/2014
#this script is to be run from a barebones fresh install -- assumes root privs
#creates cuckoo-vbox user and assumes cuckoo is base user

#make temp install dir (makes for easier clean up at the end)
mkdir /tmp/installers 

#add all the keys for non-standard repos

#VirtualBox
echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" |  tee -a /etc/apt/sources.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | apt-key add -

#inetsim
echo "deb http://www.inetsim.org/debian/ binary/" | tee -a /etc/apt/sources.list
wget -q http://www.inetsim.org/inetsim.org-archive-signing-key.asc -O- | apt-key add - 

#make sure we are working with newest packages
apt-get update -y && apt-get upgrade -y

#install all necessary packages (pre-reques for Cuckoo install)
apt-get install -y build-essential python-pip git automake python-dpkt python-jinja2 python-magic python-pymongo python-gridfs python-libvirt python-bottle python-pefile python-chardet python python-dev tcpdump libcap2-bin libtool python-sqlalchemy python-bson mongodb-server libxml2-dev libxslt1-dev zlibc zlib1g zlib1g-dev libssl-dev libffi-dev flex byacc inetsim virtualbox

#Python easy setup
wget https://bootstrap.pypa.io/ez_setup.py -O - | python

#grab cybox and install 
cd /tmp/installers/
wget https://github.com/CybOXProject/python-cybox/archive/v2.0.1.4.tar.gz
tar -xzvf v2.0.1.4.tar.gz
cd python-cybox-2.0.1.4
python setup.py build && python setup.py install && ldconfig && cd ~

#install all pip libraries/packages
pip install maec==4.0.1.0 django

#install ssdeep
cd /tmp/installers
wget http://downloads.sourceforge.net/project/ssdeep/ssdeep-2.10/ssdeep-2.10.tar.gz 
tar -xzvf ssdeep-2.10.tar.gz
cd ssdeep-2.10
./configure && make && make install && cd ~

#install pydeep
git clone https://github.com/kbandla/pydeep.git /tmp/installers/pydeep
cd /tmp/installers/pydeep
python setup.py build && python setup.py install && ldconfig && cd ~

#install yara
git clone https://github.com/plusvic/yara.git /tmp/installers/yara
cd /tmp/installers/yara
./bootstrap.sh && ./configure && make && make install &&
cd /tmp/installers/yara/yara-python
python setup.py build && python setup.py install && ldconfig && cd ~

#install volatility
cd /tmp/installers
wget https://volatility.googlecode.com/files/volatility-2.3.1.tar.gz && tar -xzvf volatility-2.3.1.tar.gz -C /opt/
cd /opt/volatility-2.3.1
python setup.py build && python setup.py install && ldconfig && cd ~

#administrative stuff
setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
useradd -m -G vboxusers cuckoo-vbox 
VBoxManage hostonlyif create && VBoxManage hostonlyif ipconfig vboxnet0 --ip 192.168.56.1

#grab newest cuckoo from GIT
git clone https://github.com/cuckoobox/cuckoo.git /opt/cuckoo

#grab all the newest community sigs
su cuckoo && python /opt/cuckoo/utils/community.py -af

#cleaning up
rm -Rf /tmp/installers/


#change ownership
chown -R cuckoo /opt/cuckoo
