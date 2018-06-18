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
source /script/config/clients-disable/*.cfg
#Question / Réponse
echo -n "Nom du client "
read answer
#Move du fichier
ls /script/config/clients-enable/$answer.cfg > /dev/null 2>&1
if [ $? != 0 ]; then
echo "L'utilisateur n'existe pas !"
else
#fichier ok
echo ""
fi	
mv /script/config/clients-enable/$answer.cfg /script/config/clients-disable/$answer.cfg 