import arb.soundcipher.*;

SoundCipher sc;

int nbNotes = 26;
float[] notes = new float[nbNotes];
String input = "";
String dernierMotJoue = ""; // pour mémoriser le mot joué

ArrayList<String> mots = new ArrayList<String>();
boolean actif = false;

// bouton Entrer
int bx = 600, by = 300, bw = 150, bh = 40;
// bouton sélection "Ce mot sonne bien"
int b2x = 300, b2y = 240, b2w = 200, b2h = 40;

float doBase = 48; // Do3
float demiTon = 1; // chaque lettre = 1 demi-ton

color green1 = color(0, 255, 0);
PFont pixelFont;

void setup() {
  size(800, 400);
  textSize(20);

  sc = new SoundCipher(this);

  // calcul des notes en MIDI
  for (int i = 0; i < nbNotes; i++) {
    notes[i] = doBase + i;
  }

  // test sonore au lancement : C majeur
  float[] test = {60, 64, 67};
  sc.playChord(test, 0.8, 1.0);
  
  // police pixel
  pixelFont = createFont("PressStart2P-Regular.ttf", 32);
  textFont(pixelFont); 
}

void draw() {
  background(0);
  stroke(green1);
  strokeWeight(2);
  fill(green1);

  // ===== TITRE =====
  textAlign(CENTER, CENTER);
  textSize(20);
  text("LA MELODIE DES MOTS", width/2, 30);

  // ===== TABLEAU DES MOTS =====
  noFill();
  rect(50, 60, 700, 120);

  String affichage = "";
  for (String m : mots) {
    affichage += m + ", ";
  }

  fill(green1);
  textAlign(LEFT, TOP);
  textSize(10);
  text(affichage, 60, 75, 680, 100);

  // ===== DERNIER MOT JOUÉ =====
  textSize(10);
  text("Dernier mot joué : " + dernierMotJoue, 50, 190);

  // ===== ZONE DE SAISIE =====
  stroke(green1);
  noFill();
  rect(50, 300, 530, 40);

  fill(green1);
  textAlign(LEFT, CENTER);
  textSize(10);
  text(input, 60, 320);

  // curseur vert
  if (actif && frameCount % 60 < 30) {
    float w = textWidth(input);
    rect(60 + w, 310, 8, 20);
  }

  // ===== BOUTON ENTRER =====
  noFill();
  rect(bx, by, bw, bh);
  fill(green1);
  textAlign(CENTER, CENTER);
  text("ENTRER", bx + bw/2, by + bh/2);

  // ===== BOUTON SÉLECTION =====
  noFill();
  rect(b2x, b2y, b2w, b2h);
  fill(green1);
  textSize(8);
  text("CE MOT SONNE BIEN !", b2x + b2w/2, b2y + b2h/2);
}

// transforme une lettre en note MIDI
int lettreVersNoteMidi(char c) {
  c = Character.toUpperCase(c);
  if (c < 'A' || c > 'Z') return -1;
  return round(notes[c - 'A']);
}

// clavier
void keyPressed() {
  if (!actif) return;

  if (key == BACKSPACE && input.length() > 0) {
    input = input.substring(0, input.length() - 1);
  }
  else if (key == ENTER || key == RETURN) {
    if (input.length() > 0) {
      dernierMotJoue = input;   // mémoriser
      jouerMotPlaque(input);    // jouer
      input = "";
    }
  }
  else if (key >= 32 && key <= 126) {
    input += key;
  }
}

// souris
void mousePressed() {
  // activation zone texte
  if (mouseX > 50 && mouseX < 550 && mouseY > 300 && mouseY < 340) {
    actif = true;
  } else {
    actif = false;
  }

  // clic bouton ENTRER
  if (mouseX > bx && mouseX < bx + bw &&
      mouseY > by && mouseY < by + bh) {
    if (input.length() > 0) {
      dernierMotJoue = input;
      jouerMotPlaque(input);
      input = "";
    }
  }

  // clic bouton "CE MOT SONNE BIEN"
  if (mouseX > b2x && mouseX < b2x + b2w &&
      mouseY > b2y && mouseY < b2y + b2h) {
    if (dernierMotJoue.length() > 0) {
      mots.add(dernierMotJoue);
    }
  }
}

// joue le mot en plaqué (accord simultané)
void jouerMotPlaque(String mot) {
  ArrayList<Float> notesList = new ArrayList<Float>();
  
  for (int i = 0; i < mot.length(); i++) {
    int midi = lettreVersNoteMidi(mot.charAt(i));
    if (midi > 0) notesList.add((float)midi);
  }
  
  if (notesList.size() > 0) {
    float[] chord = new float[notesList.size()];
    for (int i = 0; i < notesList.size(); i++) {
      chord[i] = notesList.get(i);
    }
    
    sc.playChord(chord, 50, 2.0); // plaqué
  }
}
