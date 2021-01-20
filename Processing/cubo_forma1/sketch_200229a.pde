void setup()  {
  size(640, 360, P3D);
  noStroke();
  fill(204);
}

void draw()  {
  background(0);    // Fundo preto
  lights();          
  translate(width/2, height/2, 0);
  rotateX(-PI/6); 
  rotateY(PI/3); 
  box(160); 
}
