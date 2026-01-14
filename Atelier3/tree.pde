class Tree {
  Branch trunk;
  float baseLen;
  float angle;
  float xpos;
  int maxLevels;
  color treeColor;

  color[] treePalette = {
  color(40, 90, 60),
  color(60, 120, 70),
  color(80, 150, 90)
  };
  

  // constructeur de l'arbre
  Tree(float xpos, float baseLen, float angle, int maxLevels) {
    this.xpos = xpos;
    this.baseLen = baseLen;
    this.angle = angle;
    this.maxLevels = maxLevels;
    treeColor = treePalette[int(random(treePalette.length))]; // choisit une couleur aléatoire parmis le tableau de palette de couleur
    trunk = new Branch(xpos, height, angle, baseLen, 0, maxLevels, treeColor); // // crée le tronc de l'arbre

  }
  
  // affiche l'arbre jusqu'au niveau demandé
  void show(int level) {
    trunk.show(level);
  }
}
