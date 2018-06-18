#!/bin/bash
#   _____             _               _   _                       
#  / ____|           | |             | | (_)                      
# | (___  _   _ _ __ | |__   ___  ___| |_ _ _ __   __ _  ___ _ __ 
#  \___ \| | | | '_ \| '_ \ / _ \/ __| __| | '_ \ / _` |/ _ \ '__|
#  ____) | |_| | | | | | | | (_) \__ \ |_| | | | | (_| |  __/ |   
# |_____/ \__, |_| |_|_| |_|\___/|___/\__|_|_| |_|\__, |\___|_|   
#          __/ |    Dev par Bastien LANGUEDOC      __/ |          
#         |___/     Pour la société Sitescom      |___/     
#	
#Fichier config
source /script/config/*.cfg
source /script/config/clients-enable/*.cfg
source /script/config/.defaultclient.cfg
dpkg -p "sshfs" > /dev/null 2>&1
dpkg -p "toilet" > /dev/null 2>&1
if [ $? != 0 ]; then
#Installation des logiciels	
$logiciel > /dev/null 2>&1
else  
#logiciels Ok
echo "fin"
fi	
clear
#Ascii écriture shell	
toilet Sitescom
#Question / Réponse
echo -n "Nom de l'entreprise "
read clientname
#Create fichier du fichier
cp -R /script/config/.defaultclient.cfg /script/config/clients-enable/$clientname.cfg
#Config
sed -i 's/Client/'$clientname'/g' /script/config/clients-enable/$clientname.cfg
echo \n folder1=''/home/oscar'' >> /script/config/clients-enable/$clientname.cfg
###########################################################################
echo -n "Nom d'utilisateur Oscardrive "
read username_oscar
echo \n username=''$username_oscar'' >> /script/config/clients-enable/$clientname.cfg
#Création du fichier
ls /home/oscar/ > /dev/null 2>&1
if [ $? != 0 ]; then
#Création du fichier
mkdir /home/oscar/$username_oscar
else
#fichier ok
echo ""
fi	
###########################################################################
echo -n "Key API "
read api_key
echo \n password=''$api_key'' >> /script/config/clients-enable/$clientname.cfg
###########################################################################
echo -n "URL du drive HTTPS :  "
read urldrive
echo \n URL=''$urldrive'' >> /script/config/clients-enable/$clientname.cfg
###########################################################################
echo -n "Point de montage de l'oscar /mnt/example:  "
read mount
echo \n mountoscar=''$mount'' >> /script/config/clients-enable/$clientname.cfg
###########################################################################
echo -n "nom du dossier example sage :  "
read folderoscar
echo \n folderlocal=''$folderoscar'' >> /script/config/clients-enable/$clientname.cfg
###########################################################################
cp -R /script/scriptshell/default.sh  /script/scriptshell/$clientname.sh
sed -i 's/clientnanme/'$clientname'/g' /script/scriptshell/$clientname.sh
echo Success pour le client $clientname 
exit
