#!/bin/bash
#   _____             _               _   _                       
#  / ____|           | |             | | (_)                      
# | (___  _   _ _ __ | |__   ___  ___| |_ _ _ __   __ _  ___ _ __ 
#  \___ \| | | | '_ \| '_ \ / _ \/ __| __| | '_ \ / _` |/ _ \ '__|
#  ____) | |_| | | | | | | | (_) \__ \ |_| | | | | (_| |  __/ |   
# |_____/ \__, |_| |_|_| |_|\___/|___/\__|_|_| |_|\__, |\___|_|   
#          __/ |    Dev par Bastien LANGUEDOC      __/ |          
#         |___/     Pour la société Sitescom      |___/     
#						NE PAS TOUCHER !
#Fichier config
source /script/config/*.cfg
source /script/config/clients-enable/clientnanme.cfg
#Vérification des logiciels		
echo "Check des logiciels obligatoires"
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
$NAME
#Connexion SSHFS
sshfs $ip_oscar:/$mountoscar $folder1/$username/$folderlocal
#Synchro
nextcloudcmd  -u "$username" -p "$password" $folder1/$username/ https://$URL/remote.php/webdav/
echo "-------------------------------------"
echo " Fin du listing des fichiers "
echo "-------------------------------------"

echo " Fin du script : $(date)"

exec &> /var/log/synhostingerbackup/$username.log
mv /var/log/synhostingerbackup$username.log /var/log/synhostingerbackup/$username.log-`date +%Y%m%d-%H%M`
exit 0