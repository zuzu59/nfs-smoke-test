# nfs-smoke-test
Juste un petit test de performance NFS
zf201123.1657

<!-- TOC titleSize:2 tabSpaces:2 depthFrom:1 depthTo:6 withLinks:1 updateOnSave:1 orderedList:0 skip:1 title:1 charForUnorderedList:* -->
## Table of Contents
* [Buts](#buts)
* [Problématique](#problématique)
* [Moyens](#moyens)
* [Utilisation](#utilisation)
<!-- /TOC -->

## Buts
Juste de tester la performance au cours du temps d'une connexion NFS. 

Cela ne mesure pas *précisément* la vitesse de transfert mais la *continuité* de service, afin de voir si tout à coup, il y a une baisse de *qualité* de la connexion due à une *saturation* du réseau par exemple.

Et de pouvoir le *grapher* dans un InfluxDB/Grafana.


## Problématique
Des fois il n'est pas possible d'installer une sonde *Telegraf* dans un container K8S pour mesurer les étranglements d'une connexion NFS !

Il ne faut pas que le test NFS ne consomme trop de bande passante afin de ne pas trop perturber les mesures globales du processus.


## Moyens
On va juste écrire et lire un *petit* fichier sur un *mount* NFS et de voir sa variabilité au cours du temps de vie du container K8S


## Utilisation
Simplement faire:
```
./start.sh fichier_cible taille_du_test_en_KB duree_entre_deux_tests
```

