// Aluno: Lucas Macedo da Silva
// Disciplina: Computação gráfica
// Turma: A01

// Use as setas do teclado para mudar a posição da luz (esfera superior)
// Use as teclas + e - para ajustar a cor 
//   - diminui a intensidade
//   + aumenta a intensidade da luz
// Use o scroll do mouse para aproximar
// Use o botão direito do mouse clicado para para mover a câmera

// --- Primitivas de luzes e câmera ---
// ambientLight(v1, v2, v3, x, y, z) -> Adiciona uma luz ambiente. Na luz ambiente os objetos são uniformemente iluminados por todos os lados.
// Os parametros são os valores RGB ou HSV e as coordenadas da luz
// 
// directionalLight(v1, v2, v3, nx, ny, nz) -> Adiciona luz direcional. Ela é mais forte ao atingir uma superficie e diminui conforme se espalha pela superficie
// os três primeiros parametros são os valores RGB ou HSV, os outros três parâmetros especificam a direção da luz
//
// lightFalloff(constant, linear, quadratic) -> Define ataxa de queda para luzes pontuais, luzes locais ou luz ambiente. Afeta apenas o objeto criado depois no código
// Os parametros são: constant -> valor constante ou queda determinante. linear -> valor linear para determinar a queda. quadratic -> valor quadratico para determinar a queda
//
// lights() -> Seta a iluminação. 
//
// lightSpecular(v1, v2, v3) -> Define a cor especular para luzes. Afeta apenas elementos criados depois no código. Esse tipo de luz, salta de uma superficie em uma direção preferida e
// é usada para criar realces. Os parametros são valores RGB ou HSV.
// 
// noLights() -> Desabilita todas as luzes
//
// normal(nx, ny, nz) -> Define o vetor normal atual. Define como a iluminação afeta o objeto. Os parametros são as direções em x, y e z respectivamente.
//
// pointLight(v1, v2, v3, x, y, z) -> Adiciona uma luz pontual. Os três primeiros parametros referem-se aos valores RGB ou HSV enquanto os três últimos referem-se as posições x, y e z da
// posição da luz
//
// spotLight(v1, v2, v3, x, y, z, nx, ny, nz, angle, concentration) -> Os três primeiros parametros são os valores RGB ou HSV; x, y e z as coordenadas; nx, ny e nz as direções;
// angle o ângulo do cone de luz; e concentration o expoente que determina o bias central do cone.
//
// beginCamera() e  endCamera() -> Habilitam a customização avançada da câmera
//
// camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ) -> Define a posição da câmera a partir da posição dos olhos, do centro da cena e do eixo que está para cima.
// Os três primeiros parâmetros são a posição dos olhos, os próximos 3 são a posição do centro, e os últimos três são a posição do eixo.
//
// frustum(left, right, bottom, top, near, far) -> Define uma matriz de perspectiva. É uma forma geometrica, uma pirâmede com o topo cortado. Os parametros são:
// left: coordenada esquerda do plano de corte;
// right: coordenada direita do plano de corte;
// bottom: coordenada inferior do plano de corte;
// top: coordenada superior do plano de corte;
// near: componente próximo do plano de corte, deve ser maior que zero;
// far: componente distante do plano de corte, deve ser maior que o valor de near;
//
// ortho(left, right, bottom, top, near, far) -> Define uma projeção ortográfica e define um volume de recorte paralelo. Todos os objetos de mesma dimensão aparecem do mesmo tamanho.
// Os parametros são:
// left: plano esquerdo do volume de recorte;
// right: plano direito do volume de recorte;
// bottom: coordenada inferior do plano de corte;
// top: coordenada superior do plano de corte;
// near: componente próximo do plano de corte, deve ser maior que zero;
// far: componente distante do plano de corte, deve ser maior que o valor de near;
// 
// perspective(fovy, aspect, zNear, zFar) -> Define uma projeção de forma que os objetos mais distantes pareçam menores que os objetos mais próximo. Os parâmetros são:
// fovy: ângulo do campo de visão, em radianos, para a direção vertical.
// aspect: relação largura/altura.
// zNear: posição z do plano de corte mais próximo
// zFar: posição z do plano de recorte mais distante
//
// printCamera() -> Imprime a matriz da câmera corrente no console.
//
// printProjection() -> Imprime a matriz de projeção corrente no console


// Posição da câmera
float xAnt = 800;
float yAnt = 600;

float z = 600;
float x = 800;
float y = 600;

// Posição da luz horizontal
float pXLuz = 0;
float pZLuz = -350;

// Controla o inicio
boolean inicio = true;

void setup(){
  size(800, 600, P3D);
  background(0);
  textSize(32);
  text("Use as setas do teclado para mudar a posição da \nluz (esfera superior)\n\n Use as teclas + e - para ajustar a cor\n- diminui a intensidade\n+ aumenta a intensidade da luz \n\nUse o scroll do mouse para aproximar\nUse o botão direito do mouse clicado\npara para mover a câmera\n\nPressione o botão do mouse para continuar...", 0, 50); 
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
    if (inicio)
      inicio = false;
    else
      atualiza_camera();
  if (!inicio){
  // -------------------- Câmera -----------------------------------
  beginCamera();
  camera(x/2.0, y/2.0, (z/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  
  
  background(0);
  
  // -------------------- Luzes -----------------------------------
  // Apenas muda a cor dos objetos
  ambientLight(255, 255, nivel_azul, -pXLuz, 270, -pZLuz);
  // Direção da luz
  directionalLight(255, 255, nivel_azul, -pXLuz, 270, -pZLuz);
  lightFalloff(-pXLuz, 270, -pZLuz);  
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
  
  // Carinha
  pushMatrix();
  translate(10, -5, 38);
  fill(0, 0, 255);
  circle(0,0,10);
  noFill();
  
  translate(-20, 0, 0);
  fill(0, 0, 255);
  circle(0,0,10);
  noFill();
  
  translate(0, -80, 0);
  fill(0, 0, 255);
  line(-10, 100, 30, 100);
  noFill();
  popMatrix();
  
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
  fill(125, 50, 10);
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
 
}
