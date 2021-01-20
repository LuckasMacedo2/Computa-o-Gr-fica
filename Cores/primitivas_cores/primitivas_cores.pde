/*
* Aluno: Lucas Macedo da Silva
* Computação Gráfica
* Turma: A01
* 
* Investigação sobre as primitivas de cores do Processing
* Modo de Cor RGB
* 
* stroke -> Desenha as linhas da forma (contorno)
* fill -> Seta a cor da figura
*/


void setup(){
  
   size(500,500);

   background(125,150,175); 
  
}

void draw(){
    
  // Teste com stroke(rgb)
  stroke(0);
  
  // Teste com fill(rgb) em RGB
  fill(155);
  circle(150, 150, 150);
  noFill();
  
  // Teste com fill(rgb, intensidade)
  fill(200, 80);
  rect(350, 350, 75, 50);
  noFill();
  
  // Teste com fill(r, g, b)
  fill(200, 200, 200);
  triangle(350, 350, 350, 400, 300, 375);
  noFill();
  
  // Teste com fill(r, g, b, intensidade)
  fill(50, 150, 220, 80);
  triangle(425, 400, 375, 400, 425, 430);
  triangle(425, 350, 375, 350, 425, 320);
  noFill();
  
  // Teste com fill(r, g, b)
  fill(250, 250, 10);
  arc(200, 350, 80, 80, PI/4, PI+3*QUARTER_PI, PIE);
  noFill();
  
  // Teste com fill(rgb)
  fill(0);
  circle(200, 325, 5);
  noFill();
  
  // Teste com fill(rgb) e noStroke()
  fill(255);  
  noStroke();
  triangle(375, 170, 375, 135, 450, 175);
  circle(350, 150, 65);
  noFill();
  
  // Varias itensidades de vermelho
  stroke(0);
  fill(255,0 ,0);
  circle(80, 440, 100);
  noFill();
  fill(190,0 ,0);
  circle(80, 440, 75);
  noFill();
  fill(125,0 ,0);
  circle(80, 440, 50);
  noFill();
  fill(60,0 ,0);
  circle(80, 440, 25);
  noFill();
  
  // Varias intesidades de vermelho e verde
  fill(200);
  noStroke();
  stroke(0, 255,0);
  square(350, 10, 100);
  stroke(0, 190,0);
  square(350, 10, 75);
  stroke(0, 125,0);
  square(350, 10, 50);
  stroke(0, 60,0);
  square(350, 10, 25);
}
