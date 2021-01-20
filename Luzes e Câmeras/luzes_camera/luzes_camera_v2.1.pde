PGraphics obj;

// Posição da câmera
float xAnt = 800;
float yAnt = 600;

float z = 600;
float x = 800;
float y = 600;

// Posição da luz horizontal
float pXLuz = 0;
float pZLuz = -350;

void setup(){
  size(800, 600, P3D);
  background(0);
}


int nivel_azul = 255;

void keyPressed() {
   if (key == '+')
   {
     if (nivel_azul >= 255)
       nivel_azul = 0;
     else
       nivel_azul += 20;
   } else{
     if (key == '-')
     {
       if (nivel_azul <= 0)
         nivel_azul = 0;
       else
         nivel_azul -= 20;
     } else {
        if (keyCode == RIGHT)
          pXLuz += 10;
        if (keyCode == LEFT)
          pXLuz -= 10;
        if (keyCode == UP)
          pZLuz += 10;
        if (keyCode == DOWN)
          pZLuz -= 10;
     }
   } 
}

void mouseWheel(MouseEvent event) {
  int inc = 10;
  println(z);
  
  if (event.getCount() <= 0)
    inc = -10;
  
  
  z += inc;
  if (z <= 0)
    z = height;
  else
    if (z > height)
      z = height;
}

void atualiza_camera()
{
  x = pmouseX*cos(0.01);
  y = pmouseY*sin(0.01);
}

void draw(){
  if(mousePressed == true)
    atualiza_camera();
  // -------------------- Câmera -----------------------------------
  beginCamera();
  camera(x/2.0, y/2.0, (z/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  
  
  background(0);
  
  // -------------------- Luzes -----------------------------------
  // Apenas muda a cor dos objetos
  ambientLight(255, 255, nivel_azul, pXLuz, -270, pZLuz);
  // Direção da luz
  directionalLight(255, 255, nivel_azul, pXLuz, -270, pZLuz);
  lightFalloff(pXLuz, -270, pZLuz);  
  // luz especular
  lightSpecular(255, 255, nivel_azul);
  
  // Corpo
  // Corpo
  stroke(0);
  translate(width/2, height/2, 0);
  rotateY(0.5);
  fill(125);
  box(100, 150, 75);
  noFill();
  
  // Cabeça
  translate(0, -100, 0);
  //rotateY(0.5);
  fill(265, 210, 213);
  box(50, 50, 75);
  noFill();
  
  //translate(10, -5, 38);
  //fill(0, 0, 255);
  //circle(0,0,10);
  //noFill();
  
  //translate(-20, 0, 0);
  //fill(0, 0, 255);
  //circle(0,0,10);
  //noFill();
  
  //translate(0, -80, 0);
  //fill(0, 0, 255);
  //line(-10, 100, 30, 100);
  //noFill();
  
  // Braços
  // Braço 1
  translate(-95, 50, 0);
  //rotateY(0.5);
  fill(265, 210, 213);
  box(90, 30, 75);
  noFill();
  
  // Braço 2
  translate(190, 0, 0);
  //rotateY(0.5);
  fill(265, 210, 213);
  box(90, 30, 75);
  noFill();
  
  // Pernas
  // Perna 1
  translate(-55, 175, 0);
  //rotateY(0.5);
  fill(265, 210, 213);
  box(30, 100, 75);
  noFill();
  
  // Braço 2
  translate(-75, 0, 0);
  //rotateY(0.5);
  fill(265, 210, 213);
  box(30, 100, 75);
  noFill();
  
  // Chão
  translate(0, 60, 0);
  //rotateY(0.5);
  fill(109, 238, 81);
  box(500, 10, 500);
  noFill();
  
  // Bola
  noStroke();
  translate(-100, -60, 150);
  //rotateY(0.5);
  fill(255);
  sphere(25);
  noFill();
    
  // Sol
  translate(pXLuz, -290, pZLuz);
  //rotateY(0.5);
  fill(255, 255, nivel_azul);
  sphere(50);
  noFill();

  endCamera();
 
}
