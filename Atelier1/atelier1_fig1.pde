void setup() {
  size(640, 400);
  background(0);
}

void draw() {
  int N = 0;
  int X = 640;
  int Y = 400;
  int D = 1;
  int R = 10;
  int V = 30;
  int B = 50;
  
  while(N < Y) {

    strokeWeight(D);
    
    line(N, N, N, Y);
    line(N, Y, X, Y);
    line(X, Y, X, N);
    line(X, N, N, N);
    
    D = D+1;
    
    stroke(R, V, B);
    
    N = N + D + 1;
    X = X - D - 10;
    Y = Y - D - 10;
    
    R += 18;
    V += 18;
    B += 18;
  }
    
}
