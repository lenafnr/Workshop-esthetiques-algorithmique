# Workshop Esthétiques et Algorithmique

Travail de Léna Fournier IMAC 1

## Atelier 1 : *Dessin Algorithmique*
*Cet atelier a été réalisé en processing sur la version java et est composé de 2 fichiers*

**atelier1_fig1** : Un exercice de représentation d’une représentation, issu du *Livre de Graphisme Atari ST*, couplé à un jeu de couleurs sur les lignes, avec un effet de dégradé de nuances de bleu.

**atelier1_exo2** : Une création originale : une représentation en vue de dessus 3D de Central Park et de ses alentours, réalisée à partir d’une matrice de boîtes en trois dimensions. L’ensemble est structuré par l’utilisation d’une lumière, de nuanciers de couleurs et de variations de dimensions permettant de délimiter les différentes zones.

## Atelier 2 : *Automate Cellulaire*
*Cet atelier a été réalisé en processing sur la version java et est composé de 1 fichier*

**atelier2** : une représentation graphique de la propagation des feux sur une foret d'arbre posés aléatoirement dans une grille selon une densitée de 0.6. Cet automate se base sur l'utilisation du voisinage de Von Neumann. Ce projet a été inspiré par le travail suivant : http://pascal.ortiz.free.fr/contents/tkinter/projets_tkinter/feu_foret/feu_foret.html.

Il existe 4 états de cellule différents :
0 : case sol (en gris)
1 : arbre sain (vert)
2 : arbre en feu (rose)
3 : arbre en cendre (violet)

Le feu se propage tant qu'un arbre sain se trouve sur le voisinage d'un feu. Un feu peut etre posé en cliquant sur une case contenant un arbre sain et plusieurs feux peuvent etre posés simultanément. Après qu'un feu a brulé un arbre, il le transforme en cendre le faisant passer de vert (arbre sain) à rose (arbre en feu) à violet (arbre en cendre).
Après avoir testé plusieurs densitées j'en ai conclue que la plus complète visuellement a regarder était la 0.6, au dela le feu se propage en losagne et en dessous il ne se propage pas très longtemps.


