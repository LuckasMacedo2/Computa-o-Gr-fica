/*
* Aluno: Lucas Macedo da Silva
* Computação Gráfica
* Turma: A01
* 
* Investigação sobre a renderização do Processing
* 
* Cada instância da classe PGraphics é uma camada, desta forma, foram usadas três superficie
* superficie 1) inimigo
* superficie 2) tiro
* superficie 3) nave
*/


/*
* createGraphics -> Cria o objeto PGraphics para desenhar os objetos na tela
* beginDraw -> Define as condigurações padrões de um objeto deve ser chamado antes de qualquer coisa seja inserida no objeto
* endDraw -> Finaliza a criação do objeto para que ele seja impresso na tela
* image -> Coloca a nova superficie na janela. Desenha a superficie na janela
* background -> Cria um novo fundo
* blendMode -> Mistura os pixels na tela de acordo com o modo passado (não usado neste trabalho)
* Cada instância da classe PGraphics é uma superficie de desenho
*
*/


PGraphics nave;      // Triangulo 
PGraphics tiro;      // Retangulo
PGraphics inimigo;   // Circulo

PGraphics cuboGiratorio;


/*
* createGraphics -> Cria o objeto PGraphics para desenhar os objetos na tela
* beginDraw -> Define as condigurações padrões de um objeto deve ser chamado antes de qualquer coisa seja inserida no objeto
* endDraw -> Finaliza a criação do objeto para que ele seja impresso na tela
* image -> Coloca a nova superficie na janela. Desenha a superficie na janela
* background -> Cria um novo fundo
* blendMode -> Mistura os pixels na tela de acordo com o modo passado
* Cada instância da classe PGraphics é uma superficie de desenho
*
*/


// ---- Posição da nave ----
float pXNave = 0;
float pYNave = 0;

// ---- Posição do tiro ----
float pXtiro = 0;
float pYtiro = 0;
// Determina se atirou ou não
boolean atirou = false;

// ---- Posição do inimigo ----
float pXinimigo = 0;
float pYinimigo = 0;
float raio = 75;
// Limites para gerar inimigo em posicção aleatoria
float lim = 0;

// ---- Contador de inimigos derrotados ----
int pontos = 0;

// ---- Mensagem inicial ----
boolean msg = true;

void setup(){
  size(500, 500, P3D);
  
  cuboGiratorio = createGraphics(width, height, P3D);

  nave = createGraphics(width, height);
  tiro = createGraphics(width, height);
  inimigo = createGraphics(width, height);
  
  // Atualiza os vertices
  pXNave = width/2;
  pYNave = height;
  
  pYtiro = height;
  pXtiro = width/2;
  
  lim = width - 75;
  pYinimigo = 30;
  pXinimigo = width/2;
  
  
  noCursor();
  
  smooth(4);
  frameRate(960);
  
  background(0);
  exibe_mensagem_inicial();
  
  blendMode(BLEND);

}


void exibe_mensagem_inicial(){
  noFill();
  textSize(35);
  text("Space Y Game", width/2 - 100, 50);
  textSize(20);
  text("Use a nave espacial (triângulo azul)\npara derrotar o inimigo (círculo vermelho).", 0, 150); 
  text("Atire pressionando o botão esquerdo do mouse.", 0, 250); 
  text("Pressione o botão esquerdo do mouse para jogar.", 0, 350); 
  fill(255, 255, 255); 
}

void cria_cuboGiratorio(){
  cuboGiratorio.beginDraw();
  cuboGiratorio.lights();
  cuboGiratorio.clear();
  cuboGiratorio.noStroke();
  cuboGiratorio.translate(cuboGiratorio.width/2, cuboGiratorio.height/2);
  cuboGiratorio.rotateX(frameCount/100.0);
  cuboGiratorio.rotateY(frameCount/200.0);
  cuboGiratorio.box(80);
  cuboGiratorio.endDraw();
  image(cuboGiratorio, 0, 0);
}

void cria_nave(){

  nave.beginDraw();
  nave.clear();
  nave.triangle(pXNave + 50, pYNave, pXNave - 50, pYNave, pXNave, pYNave - 50);
  nave.fill(50, 50, 200);
  nave.endDraw();
  image(nave, 0, 0);

}

void cria_tiro(){
  tiro.beginDraw();
  tiro.clear();
  tiro.rect(pXtiro - 5, pYtiro - 50, 10, 50);
  tiro.fill(225, 225, 0);
  tiro.endDraw();
  image(tiro, 0, 0);
}

void cria_inimigo(){
  inimigo.beginDraw();
  inimigo.clear();
  inimigo.circle(pXinimigo, pYinimigo, raio);
  inimigo.fill(255, 50, 0);
  inimigo.endDraw();
  image(inimigo, 0, 0);
}

void conta(){
  pontos ++;
}

void mostra_pontos(){
  noFill();
  textSize(20);
  text("Pontos: " + pontos, 390, 20); 
  fill(255, 255, 255); 
}

void atualiza_objeto(){
  background(0);
  cria_cuboGiratorio();
  cria_inimigo();
  if (atirou){
    cria_tiro();
  }
  cria_nave();
  mostra_pontos();
}

void mouseClicked(){
  if(msg){
     msg = false; 
  }else if (!atirou){
    pYtiro = pYNave;
    pXtiro = pXNave;
    atirou = true;
  }
}

void draw() {
  //pYtiro --;
  //if (pYtiro < 0)
  //  pYtiro = height;
  if (!msg){
    pXNave = pmouseX;
    pYNave = pmouseY;
    
    if(atirou){
      if (pYtiro == 0)
        atirou = false;
      if (pow(pXtiro - pXinimigo, 2) + pow(pYtiro - pYinimigo, 2) <= raio*raio){
        atirou = false;
        pYinimigo = random(0, lim);
        pXinimigo = random(0, lim);
        conta();
      }
      pYtiro --;
    }
    
    atualiza_objeto();
  }
}
