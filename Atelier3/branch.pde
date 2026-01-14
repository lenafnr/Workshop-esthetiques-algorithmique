class Branch {
  float x, y, a, len;
  int lvl, max;
  color colo;

  // constructeur de la branche
  Branch(float x, float y, float a, float len, int lvl, int max, color c) {
    this.x = x;
    this.y = y;
    this.a = a;
    this.len = len;
    this.lvl = lvl;
    this.max = max;
    this.colo = c;
  }

  // Affiche la branche et les sous-branches selon le niveau
  void show(int level) {
    if (lvl >= level) return; // si le niveau demandé est déjà fait on arrete le dessin

    //paramètre et sauvegarde des branches
    pushMatrix();
    translate(x, y);
    stroke(colo);
    strokeWeight(map(lvl, 0, max, 4, 1));
    line(0, 0, 0, -len);

    if (lvl < level) { // si on a pas atteint le niveau
      // Droite haute
      pushMatrix();
      translate(0, -len);
      rotate(a);
      new Branch(0, 0, a, len * 0.6, lvl + 1, max, colo).show(level);
      popMatrix();

      // Droite basse
      pushMatrix();
      translate(0, -len);
      rotate(a * 4);
      new Branch(0, 0, a, len * 0.2, lvl + 1, max, colo).show(level);
      popMatrix();

      // Gauche haute
      pushMatrix();
      translate(0, -len);
      rotate(-a * 1.3);
      new Branch(0, 0, -a, len, lvl + 1, max, colo).show(level);
      popMatrix();

      // Gauche basse
      pushMatrix();
      translate(0, -len);
      rotate(-a * 4);
      new Branch(0, 0, -a, len * 0.2, lvl + 1, max, colo).show(level);
      popMatrix();
    }

    popMatrix();
  }
}
