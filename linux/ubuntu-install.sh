sudo apt-get update
#---------------------------------
sudo apt-get install -y virtualbox
sudo apt-get install -y terminator
sudo apt-get install -y cairo-clock 
sudo apt-get install -y php7.0 apache2 
sudo apt-get install -y libapache2-mod-php7.0
sudo apt-get install -y mysql-server php7.0-mysql
cd /var/www/html/
wget https://download.dokuwiki.org/out/dokuwiki-c5525093cf2c4f47e2e5d2439fe13964.tgz
tar -xvf dokuwiki-c5525093cf2c4f47e2e5d2439fe13964.tgz
rm -rf dokuwiki-c5525093cf2c4f47e2e5d2439fe13964.tgz
sudo apt-get install default-jre
cd /bin/
mkdir circuit
cd circuit/
wget www.falstad.com/circuit-java/circuit.zip
unzip circuit.zip

sudo apt-get install -y xchat

#------- multimedia -----
sudo apt-get install -y openshot
sudo apt-get install -y gimp
sudo apt-get install -y vlc
sudo apt-get install -y audacity
sudo apt-get install -y mixxx
#-------
sudo apt-get install -y extremetuxracer
#---------backup -------
sudon apt-get install -y filezilla
sudo apt-get install -y proftpd
sudo apt-get install -y sshd-server
#sudo apt-get install sshfs
#sudo apt-get install autofs
#ajouter group fuse ajout user ->fuse
#ssh-keygen -t rsa
#copier .pub genereee sur serveur
#sshfs#root@91.134.134.153:/                /media/chip/ovh-web          fuse            port=22,user,allow_other,noatime,_netdev     0 0
#----------network -----
#traceroute nmap

#bashrc color
#alias cl='setxkbmap us'
#alias del_spaces='for file in * ; do mv -T "$file" ${file// /_};done'
#alias avconv_all='for f in *; do avconv -i $f $f.mp3 ;done'

gsettings get com.canonical.Unity.Launcher favorites\\
/usr/share/applications/
dconf write /org/compiz/profiles/unity/plugins/unityshell/icon-size 25

echo "unity gnome ajouter apps backup"
gsettings set com.canonical.Unity.Launcher favorites "['application://gnome-screenshot.desktop', 'application://gimp.desktop', 'application://openshot.desktop', 'application://xchat.desktop', 'application://firefox.desktop', 'application://nautilus.desktop', 'application://gedit.desktop', 'application://terminator.desktop', 'application://vlc.desktop', 'application://ubuntu-software-center.desktop', 'application://transmission-gtk.desktop', 'application://circuit.desktop', 'application://libreoffice-writer.desktop', 'application://script.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"\\

alsamixer -D equal

