#!/bin/bash
#   _____             _               _   _                       
#  / ____|           | |             | | (_)                      
# | (___  _   _ _ __ | |__   ___  ___| |_ _ _ __   __ _  ___ _ __ 
#  \___ \| | | | '_ \| '_ \ / _ \/ __| __| | '_ \ / _` |/ _ \ '__|
#  ____) | |_| | | | | | | | (_) \__ \ |_| | | | | (_| |  __/ |   
# |_____/ \__, |_| |_|_| |_|\___/|___/\__|_|_| |_|\__, |\___|_|   
#          __/ |    Dev par Bastien LANGUEDOC      __/ |          
#         |___/     Pour la soci�t� Sitescom      |___/     
#	
#Fichier config
source /script/config/*.cfg
source /script/config/clients-disable/*.cfg
#Question / R�ponse
echo -n "Nom du client "
read answer
#Move du fichier
mv /script/config/clients-disable/$answer.cfg /script/config/clients-enable/$answer.cfg 