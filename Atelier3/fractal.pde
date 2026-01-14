import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
Oscil oscil;
PFont pixelFont;

int currentNote = 0;

ArrayList<Tree> forest = new ArrayList<Tree>();
int[] treeLevels;
int treeIndex = 0;
int maxLevels = 6;

int lastUpdate = 0;
int interval = 400;

//on range les notes dans un tableau
float[] note = {
  196.00, 164.815, 146.83, 130.815, 146.83, 164.815, 196.00,
  164.815, 146.83, 130.815, 146.83, 164.815, 196.00,
  164.815, 196.00, 220.00, 164.815, 220.00, 196.00, 164.815, 146.83, 130.815,146.83,130.815,
  392.00, 329.63, 293.66, 261.63, 293.66, 329.63, 392.00,
  329.63, 293.66, 261.63, 293.66, 329.63, 392.00,
  329.63, 392.00, 440.00, 329.63, 440.00, 392.00, 329.63, 293.66, 261.63, 293.66, 261.63
};

color backgroundColor = color(180, 240, 200);

void setup() {
  size(1480, 400);
  frameRate(90);

  //on initialise l'entrée et la sortie de l'audio en lui appliquant un oscillateur
  minim = new Minim(this);
  out = minim.getLineOut();
  oscil = new Oscil(0, 0.25, Waves.TRIANGLE);
  oscil.patch(out); 

  //arbres
  float baseTree = 40;
  //on crée l'arbre central
  forest.add(new Tree(width/2 - 70, baseTree, random(PI/15, PI/12), maxLevels));
  
  float baseSpacing = 180; // distance de départ entre arbres
  for(int i = 1; i <= 4; i++){
    float offset = baseSpacing * i; // écart qui grandit
    forest.add(new Tree(width/2 - 70 + offset, baseTree + i*5, random(PI/15, PI/12)+i*0.05, maxLevels));
    forest.add(new Tree(width/2 - 70 - offset, baseTree + i*5, random(PI/15, PI/12)+i*0.05, maxLevels));
  }

  // on initialise les valeurs des niveaux des arbres à 0
  treeLevels = new int[forest.size()];
  
  // charger la police 
  pixelFont = createFont("PressStart2P-Regular.ttf", 32);
  textFont(pixelFont);
}

//cette fonction a été debuggée avec de l'IA
void draw() {
  
  background(0);
  
  fill(200, 220, 255);
  textAlign(CENTER, TOP);
  text("Music of the Trees", width/2, 20);
 

  // Affiche tous les arbres
  for(int i=0; i<forest.size(); i++){
    forest.get(i).show(treeLevels[i]);
  }

  // Avance niveau et note à intervalle constant
  if(millis() - lastUpdate > interval && currentNote < note.length){
    lastUpdate = millis();
    playNote(currentNote);

    // Augmente niveau de l'arbre courant
    if(treeLevels[treeIndex] < maxLevels){ // si l'arbre courant  n'a pas atteint soon niveau max
      treeLevels[treeIndex]++; //on + 1 son niveau
    } else if(treeIndex < forest.size()-1){ // sinon si des arbres restent à faire pousser
      treeIndex++; // passe à l'arbre suivant
      treeLevels[treeIndex]++; //on + 1 son niveau
    }

    currentNote++; // note suivante
  }
}

// jouer une note
void playNote(int index){
  if(index < 0 || index >= note.length) return;
  for(int i=0; i<4; i++){
    oscil.setFrequency(note[index]);
  }
}
