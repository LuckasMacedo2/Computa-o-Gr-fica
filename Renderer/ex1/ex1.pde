
PGraphics circle;

void setup() {
  size(100, 100);
  circle = createGraphics(100, 100);       // Gera uma nova função interface de desenho definida em pixels pelos parâmetros
}

void draw() {
  circle.beginDraw();
  circle.background(0);
  circle.ellipse(50, 50, 75, 75);
  circle.endDraw();
  image(circle, 0, 0);                     // Mostra a imagem
}
