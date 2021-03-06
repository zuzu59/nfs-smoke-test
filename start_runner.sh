#!/usr/bin/env bash
# Petit script pour juste tester la performance au cours du temps d'une connexion NFS
# Cela ne mesure pas précisément la vitesse de transfert mais la continuité de service, 
# afin de voir si tout à coup il y a une baisse de qualité de la connexion due à une
# saturation du réseau par exemple

echo -e "
VERSION spéciale pour le runner Ansible !

start_runner.sh  zf201123.1709 \n"

#test si l'argument est vide
if [ -z "$1" ]
  then
    echo -e "\nUsage:
./start_runner.sh fichier_cible taille_du_test_en_KB duree_entre_deux_tests

Par exemple:

./start_runner.sh /srv/znfs.test 1024 2

"
    exit
fi


while [ 1=1 ]
do
  dd if=/dev/zero of=$1 bs=1024 count=$2 > dd.log 2>&1
  t1=$(cat dd.log |tail -1 |awk '{print $10}' |sed "s/(//g") 
  echo "Ecriture: "$t1" MB/S"

  dd if=$1 of=/dev/null bs=1024 count=$2 > dd.log 2>&1
  t1=$(cat dd.log |tail -1 |awk '{print $10}' |sed "s/(//g") 
  echo "Lecture: "$t1" MB/S"
  echo ""
  sleep $3
done





 