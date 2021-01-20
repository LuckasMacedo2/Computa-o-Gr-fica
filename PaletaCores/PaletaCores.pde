/*
* Aluno: Lucas Macedo da Silva
* Computação Gráfica
* Turma: A01
* 
* Paleta de cores
* Para mudar a cor arraste as bolinhas ao lado de cada uma das cores
*/


// Cor do quadrado
int qR = 0;
int qG = 0;
int qB = 0;

// Coordenadas no eixo y dos circulos
int xCR = 10;
int xCG = 10;
int xCB = 10;

// Coordenadas no eixo y dos circulos
int yCR = 10;
int yCG = 35;
int yCB = 60;


void setup(){
  
   size(500,500);
   atualiza_obj();
   textSize(20);
}

void atualiza_cor_hex(){
  // Texto
  fill(0);
  textSize(20);
  println(qR, qG, qB);
  color c = color(qR, qG, qB);
  text("Cor em hexa: #" + hex(c,6), 140, 200);
  textSize(15);
  text("Para mudar a cor\nArraste as bolinhas ao lado", 295, 30); 
  noFill();
}

void atualiza_obj(){
  
  // Fundo
  background(255,255,255); 
   
   // Vermelho (R)
  retangulo(10, 10, 265, 5, 255, 0, 0);
  circulo(xCR,yCR,15, 0);
  
  // Verde (G)
  retangulo(10, 35, 265, 5, 0, 255, 0);
  circulo(xCG,yCG,15, 0);

  
  // Azul (B)
  retangulo(10, 60, 265, 5, 0, 0, 255);
  circulo(xCB,yCB,15, 0);
  
  
  // Quadrado
  quadrado();
  
  atualiza_cor_hex();

}

void atualiza_cor() {
  int x = pmouseX;
  int y = pmouseY;
  
  if (x >=10 && x<= 275){
    // Vermelho (R);
    if (y >= 9 && y <= 15){
      circulo(x,yCR,15, 0);
      qR = abs(x - 10);
      xCR = x;
    }
    
    // Verde (G)
    if (y >= 27 && y <= 40){
      circulo(x,yCG,15, 0);
      qG = abs(x - 10);
      xCG = x;
    }
    
    // Azul (B)
    if (y >= 52 && y <= 65){
      circulo(x,yCB,15, 0);
      qB = abs(x - 10);
      xCB = x;
    }
    atualiza_obj();
    // Atualiza cor em hexadecimal
  }
  
}

void circulo(int x, int y, int raio, int cor){
  noStroke();
  fill(cor);
  circle(x,y,raio);
  noFill();
}

void retangulo(int x, int y, int largura, int altura, int corR, int corG, int corB){
  stroke(corR, corG, corB);
  fill(corR, corG, corB);
  rect(x, y, largura, altura);
  noFill();
}

void quadrado(){
  fill(qR, qG, qB);
  square(150, 230, 200);
  noFill();
}

void draw(){
    if(mousePressed == true)
      atualiza_cor();
}
