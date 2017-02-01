sudo apt-get update
sudo apt-get install virtualbox
sudo apt-get install terminator
sudo apt-get install java
sudo apt-get install default-jre
sudo apt-get install php7.0 apache2 
sudo apt-get install libapache2-mod-php7.0
sudo apt-get install sshfs
sudo apt-get install autofs
sudo apt-get install gimp
sudo apt-get install vlc
sudo apt-get install audacity
sudo apt-get install mixxx
extremetuxracer
cairo-clock lancement au demarrage


ajouter group fuse ajout user ->fuse
ssh-keygen -t rsa
copier .pub genereee sur serveur
sshfs#root@91.134.134.153:/                /media/chip/ovh-web          fuse            port=22,user,allow_other,noatime,_netdev     0 0



bashrc color
alias cl='setxkbmap us'
alias del_spaces='for file in * ; do mv -T "$file" ${file// /_};done'
alias avconv_all='for f in *; do avconv -i $f $f.mp3 ;done'

gsettings get com.canonical.Unity.Launcher favorites\\
/usr/share/applications/

echo "unity gnome ajouter apps backup"
gsettings set com.canonical.Unity.Launcher favorites "['application://gnome-screenshot.desktop', 'application://gimp.desktop', 'application://openshot.desktop', 'application://xchat.desktop', 'application://firefox.desktop', 'application://nautilus.desktop', 'application://gedit.desktop', 'application://terminator.desktop', 'application://vlc.desktop', 'application://ubuntu-software-center.desktop', 'application://transmission-gtk.desktop', 'application://circuit.desktop', 'application://libreoffice-writer.desktop', 'application://script.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"\\
