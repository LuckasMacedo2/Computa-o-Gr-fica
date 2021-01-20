// Objetivo mostra a localização do cursor do mouse
// Gera o problema de criar linhas com as localizações do mouse

void setup() {
  size(100, 100);
  background(0);
  noCursor();
}

void draw() {
  stroke(255);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY); 
}

void mousePressed() {
  noStroke();
  fill(255, 100);
  ellipse(mouseX, mouseY, 40, 40);
}
