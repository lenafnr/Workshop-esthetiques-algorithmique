// parametres matrix
int col = 45;        
int row = 100;        
float spaceX = 10;  
float spaceY = 10; 

//parametres box
float boxSizeMin = 3;
float boxSizeMax = 10;
float boxHeightMin = 3;
float boxHeightMax = 10;

// parametres building
float buildingMinD = 40;
float buildingMaxD = 160;

// parametres park
float parkMinD = 1;
float parkMaxD = 20;

// parametres lac
int centerLine = 22;
int centerRow = 60;
float radiusX = 6;
float radiusY = 7;

// Paramètres lac 2
int centerLine2 = 19;
int centerRow2 = 78;
float radiusX2 = 2;
float radiusY2 = 1;


void setup() {
  size(400, 850, P3D);
  noLoop();
}

void draw() {
  background(30);
  lights();
  
  //centrer la matrix
  translate(width/2, height/2, -310);

  for (int i = 0; i < col; i++) {
    for (int j = 0; j < row; j++) {

      //logique calculatoire réalisée à l'aide de l'IA
      float x = (i - col/2) * spaceX;
      float y = (j - row/2) * spaceY;
      float z = 100;
      float depth;
      
      float boxSize;
      float boxHeight;
      boxSize = random(boxSizeMin, boxSizeMax);
      boxHeight = random(boxHeightMin, boxHeightMax);

      // création des lacs
      //logique calculatoire réalisée à l'aide de l'IA
      if (i >= 15 && i <= 30 && j >= 20 && j <= 80) {
        float dx1 = (i - centerLine) / radiusX;
        float dy1 = (j - centerRow) / radiusY;
        float dx2 = (i - centerLine2) / radiusX2;
        float dy2 = (j - centerRow2) / radiusY2;

        if (dx1*dx1 + dy1*dy1 <= 1 || dx2*dx2 + dy2*dy2 <= 1) { 

          float r = random(0, 50);
          float g = random(0, 50);
          float b = random(100, 255);
          fill(r, g, b);
        } 
        
        // création du park
        else {
          float r = random(20, 80);
          float g = random(80, 160);
          float b = random(20, 80);
          fill(r, g, b);
        }

        depth = random(parkMinD, parkMaxD);
      } 
      
      // création buildings
      else {
        float gray = random(50, 255);
        fill(gray);
        depth = random(buildingMinD, buildingMaxD);
      }

      pushMatrix();
      translate(x, y, z);
      box(boxSize, boxHeight, depth);
      popMatrix();
    }
  }
}
