// Aluno: Lucas Macedo da Silva
// Disciplina: Computação gráfica
// Turma: A01

// 
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

// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

// ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PGraphics sol;
PGraphics terra;
PGraphics nave;

void cria_sol(PGraphics astro, int r, int g, int b, float x, float y, float z, int raio){
  astro.beginDraw();
  astro.clear();
  astro.lights();
  astro.translate(x, y, z);
  astro.noStroke();
  astro.fill(r, g, b);
  astro.sphere(raio);
  astro.noFill();
  astro.endDraw();
  image(astro, 0, 0);
}

void cria_terra(PGraphics astro, int r, int g, int b, float x, float y, float z, int raio){
  astro.beginDraw();
  astro.clear();
  astro.lights();
  astro.rotateY(frameCount*0.01);
  astro.translate(x, y, z);
  astro.noStroke();
  astro.fill(r, g, b);
  astro.sphere(raio);
  astro.noFill();
  astro.endDraw();
  image(astro, 0, 0);
}

void cria_nave(PGraphics astro, int r, int g, int b, float x, float y, float z, float dx, float dy, float dz){
  astro.beginDraw();
  astro.clear();
  astro.lights();
  astro.translate(x, y, z);
  astro.rotateX(frameCount*0.01);
  astro.noStroke();
  astro.fill(r, g, b);
  astro.box(dx, dy, dz);
  astro.noFill();
  astro.endDraw();
  image(astro, 0, 0);
}

void setup(){
  size(800,600, P3D);
  
  sol = createGraphics(width, height, P3D);
  terra = createGraphics(width, height, P3D);
  nave = createGraphics(width, height, P3D);
  
  frameRate(30);
}


float y =  0;

void draw(){  
  pushMatrix(); 
  beginCamera();
  //camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, -width, 0, 1, 0);
  //perspective(PI/3.0, width/height, ((height/2.0) / tan(PI*60.0/360.0))/10.0, ((height/2.0) / tan(PI*60.0/360.0))*10.0);
  background(125);
  //rect(0, 0, width, height);
  cria_terra(terra, 0, 101, 225, 800, height/2, 0, 100);
  cria_sol(sol, 233, 252, 0, width/2, height/2, 0, 100);
  cria_nave(nave, 255, 255, 255,  600, height/2, 100, 50, 50, 50);
  endCamera();
  popMatrix();

}
