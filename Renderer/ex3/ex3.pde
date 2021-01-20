// Desenha uma localização pro mouse a cada frame
// Mas desenha um ciculo a cada vez que o botão é pressionado

PGraphics circles;

void setup() {
  size(100, 100);
  circles = createGraphics(width, height); circles.beginDraw();
  circles.background(0);
  circles.noStroke();
  circles.fill(255, 100); circles.endDraw();
  noCursor();
} 

void draw() {
  image(circles, 0, 0);
  stroke(255);
  line(mouseX, 0, mouseX, height);
  line(0, mouseY, width, mouseY);
}

void mousePressed() {
  circles.beginDraw();
  circles.ellipse(mouseX, mouseY, 40, 40);
  circles.endDraw();
}
