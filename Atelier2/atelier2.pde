int col = 70;
int row = 40;         
float cellW, cellH;
int[][] forest; 
float density = 0.6;  
boolean fire = false;

color green = color(190, 229, 191);
color pink = color(206, 125, 165);
color purple = color(73, 54, 87);
color ground = color(50);

void setup() {
  size(1400, 800);
  cellW = 20;
  cellH = 20;
  forest = new int[row][col];
  randomForest(density);
  frameRate(10);
  background(50);
}

void draw() {

  //dessine chaque cellule du tableau
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      
      //definit les différents états visuels d'une cellule
      int state = forest[i][j];
      switch(state) {
        case 0: fill(ground); stroke(50); break;
        case 1: fill(green); stroke(50); break;
        case 2: fill(pink); stroke(50); break;
        case 3: fill(purple); stroke(50); break;
      }
      
      //dessine les cellules
      rect(j*cellW, i*cellH, cellW*0.9, cellH*0.9, 15);
    }
  }
  
  //si la cellule est un feu on appelle updateForest()
  if (fire) updateForest();
}

// fontion qui parcours la grille et définir des arbres aléatoirement selon d densitée
void randomForest(float d) {
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      // on utilise random pour placer des arbres en attrbuant 1 à la case sinon 0
      forest[i][j] = (random(1) < d) ? 1 : 0;
    }
  }
}

//on renvoie les voisins haut bas gauche droite selon le principe du voisinage de Von Neumann
ArrayList<int[]> voisins(int x, int y) {
  ArrayList<int[]> v = new ArrayList<int[]>();
  if (x > 0) v.add(new int[]{x-1, y});
  if (x < row-1) v.add(new int[]{x+1, y});
  if (y > 0) v.add(new int[]{x, y-1});
  if (y < col-1) v.add(new int[]{x, y+1});
  return v;
}

// on update l'apparence et l'état de la grille à chaque 
void updateForest() {
  ArrayList<int[]> toFire = new ArrayList<int[]>();

  // propagation du feu
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      // si l'arbre est en feu (etat 2) on retourne la liste de ses 4 voisins
      if (forest[i][j] == 2) {
        for (int[] nb : voisins(i,j)) {
          // si un de ses voisins est un arbre (etat 1) on l'ajoute dans la liste des arbres a prendre feu à la frame d'après pour avoir une progression
          if (forest[nb[0]][nb[1]] == 1) toFire.add(nb);
        }
      }
    }
  }

  // arbres en cendre
  for (int i = 0; i < row; i++) {
    for (int j = 0; j < col; j++) {
      // si la cellule est en feu (etat 2) elle passe aux cendres (état 3)
      if (forest[i][j] == 2) forest[i][j] = 3;
    }
  }

  // le feu se propage sur de nouveaux arbres voisins récupérés
  for (int[] f : toFire) forest[f[0]][f[1]] = 2;
}

// la cellule sur laquelle on clique prend feu si elle contient un arbre saint
void mousePressed() {
  int r = int(mouseY / cellH);
  int c = int(mouseX / cellW);
  if (r >= 0 && r < row && c >= 0 && c < col && forest[r][c] == 1) {
    forest[r][c] = 2;
    fire = true;
  }
}
