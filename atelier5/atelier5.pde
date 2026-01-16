// ======================
// Données
// ======================
String[] words = {
  "Alex vous remercie pour le savoir acquis.",
  "Elouan a développé une passion pour les petites fourmis.",
  "Alexandre est très fatigué.",
  "Laïn est un escroc.",
  "Corentin est super sympa.",
  "Marine n'a pas d'idée.",
  "Alina mange un chewing-gum.",
  "Yanis a les neurones grillés.",
  "Raphael est en dépression (blague).",
  "Matthieu est content de ce qu'il a fait.",
  "Julien est obstiné par la 3D.",
  "Romane remet sa vie en question.",
  "Lucille a vécu une expérience créative inoubliable.",
  "Benoit remercie P5js.",
  "Jade se sent créative.",
  "Roméo est heureux de la semaine.",
  "Nils n'en peut plus avec ces dominos.",
  "Léna est fière de ses idées."
};

String centerPhrase = "Merci pour le workshop, on s'est bien amusé!";

color[] wordColors = {
  color(222, 63, 61),   // rouge doux
  color(243, 118, 217), // rose
  color(251, 241, 88)   // jaune
};

// ======================
// Buffer graphique
// ======================
PGraphics backgroundLayer;

// ======================
// Setup
// ======================
void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  noStroke();

  // Création du fond figé
  backgroundLayer = createGraphics(width, height);
  backgroundLayer.beginDraw();
  backgroundLayer.background(255);
  backgroundLayer.textAlign(CENTER, CENTER);

  // Mots aléatoires (figés)
  backgroundLayer.textSize(30);
  for (int i = 0; i < 1000; i++) {
    backgroundLayer.fill(wordColors[int(random(wordColors.length))]);
    backgroundLayer.text(
      words[int(random(words.length))],
      random(width),
      random(height)
    );
  }
  
    // Phrase centrale (bleue)
  backgroundLayer.fill(90, 228, 255);
  backgroundLayer.textSize(25);
  backgroundLayer.text(centerPhrase, width/2, height/2);

  backgroundLayer.endDraw();
} // <<< FIN DE SETUP

// ======================
// Draw
// ======================
void draw() {
  // Affiche le fond figé
  image(backgroundLayer, 0, 0);

  // Filtre révélateur (suit la souris)
  fill(255, 0, 0, 210);
  ellipse(mouseX, mouseY, 180, 180);

  noCursor();
}
