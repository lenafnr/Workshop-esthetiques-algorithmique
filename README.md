# Workshop Esthétiques et Algorithmique

Travail de Léna Fournier IMAC 1

## Atelier 1 : *Dessin Algorithmique*
*Cet atelier a été réalisé en processing sur la version java et est composé de 2 fichiers*

**atelier1_fig1** : Un exercice de représentation d’une représentation, issu du *Livre de Graphisme Atari ST*, couplé à un jeu de couleurs sur les lignes, avec un effet de dégradé de nuances de bleu.

**atelier1_exo2** : Une création originale : une représentation en vue de dessus 3D de Central Park et de ses alentours, réalisée à partir d’une matrice de boîtes en trois dimensions. L’ensemble est structuré par l’utilisation d’une lumière, de nuanciers de couleurs et de variations de dimensions permettant de délimiter les différentes zones.

## Atelier 2 : *Automate Cellulaire*
*Cet atelier a été réalisé en processing sur la version java et est composé de 1 fichier*

**atelier2** : une représentation graphique de la propagation des feux sur une foret d'arbre posés aléatoirement dans une grille selon une densitée de 0.6. Cet automate se base sur l'utilisation du voisinage de Von Neumann. 

![Enregistrementdelcran2026-01-1323 59 34-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/d9428016-9df3-4b85-a72a-9c47734c2da2)
###### *prévisualisation de l'automate cellulaire*

Ce projet a été inspiré par le travail suivant : http://pascal.ortiz.free.fr/contents/tkinter/projets_tkinter/feu_foret/feu_foret.html.

Il existe 4 états de cellule différents :  
0 : case sol (en gris)  
1 : arbre sain (vert)  
2 : arbre en feu (rose)  
3 : arbre en cendre (violet)  

Le feu se propage tant qu'un arbre sain se trouve sur le voisinage d'un feu. Un feu peut etre posé en cliquant sur une case contenant un arbre sain et plusieurs feux peuvent etre posés simultanément. Après qu'un feu a brulé un arbre, il le transforme en cendre le faisant passer de vert (arbre sain) à rose (arbre en feu) à violet (arbre en cendre).
Après avoir testé plusieurs densitées j'en ai conclue que la plus complète visuellement a regarder était la 0.6, au dela le feu se propage en losagne et en dessous il ne se propage pas très longtemps.

## Atelier 3 : *Fractales*
*Cet atelier a été réalisé en processing sur la version java et est composé de 3 fichiers dpe, un folder data et un folder minim *

**atelier3** : une création originale de la représentation de la canopée fractale sous forme de foret d'arbre semblant produire de la musique.

Le projet contient plusieurs fichiers : 

`fractal`  
- Contient les classes principales pour générer la forêt et gérer la logique fractale.
   
`Branch`  
- Représente **une branche individuelle** d’un arbre.  
- Chaque branche peut générer des sous-branches selon son **niveau fractal**
- Contrôle la couleur et l’épaisseur des traits selon le niveau
  
`Tree`    
- Classe qui représente **un arbre complet**.
- Possède une racine et gère la couleur de l’arbre
- Utilise une palette de verts
- Gère l’affichage progressif, niveau par niveau, au rythme des notes

Chaque arbre pousse progressivement un a un sur 6 niveaux de fractale, la croissance est synchronisée avec un tableau de notes reproduisant la musique de Peer Gynt Suite No. 1, Op.46 : Morning (symplifiée en faisant des tests sur garageBand pour voir ce qui sonnait bien). Chaque nouvelle note se joue au moment où un nouveau niveau de l'arbre se dessine.

Ce projet a été réalisé avec l'aide de la video suivante : https://youtu.be/-kvel_C28aI?si=GTeb4s0QB-BVJEB9 et a été débuggé avec l'aide de l'IA.

![Enregistrementdelcran2026-01-1423 40 51-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/597e5270-d47d-4d0c-b79c-d313242d4c06)
###### *prévisualisation de Music of the Trees*


