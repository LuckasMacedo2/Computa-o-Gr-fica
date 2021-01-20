// Aluno: Lucas Macedo da Silva
// Disciplina: Computação gráfica
// Turma: A01

// Código que aplica a operação de rotação no objeto casa
// A operação de rotação é definida por:
// x' = x * cos(angulo) - y * sin(angulo);
// y' = y * cos(angulo) + x * sin(angulo);
// onde,
// x e y são as posições originais do vertice
// x' é a nova posição do vértice
// y' é a nova posição do vértice
// angulo é o ângulo em que o objeto será rotacionado
// O objeto é então rotacionado.


//  -------------------------------------------------- Função de rotação --------------------------------------------------
void rotacao (PShape s, float angulo){
  // Parametros
  //     PShape s -> O objeto PShape que contém os vertices
  //     angulo -> O ângulo em graus
  
  // Pega os vertices do objeto
  int tam = s.getVertexCount();
  
  // Converte o angulo para radianos
  angulo = (angulo * PI) / 180;
  
  
  // Percorre os vertices e atribui os novos valores
  float x, y;
  for (int i = 0; i < tam; i ++) {
    
    
    // Pega os vétices
    PVector vetor = s.getVertex(i);
    
    x = vetor.x;
    y = vetor.y;
    
    // Aplica a operação de rotação
    vetor.x = x * cos(angulo) - y * sin(angulo);
    vetor.y = y * cos(angulo) + x * sin(angulo);
    
    // Seta os vertices de volta
    s.setVertex(i, vetor);
    
  }
}
//  -------------------------------------------------- Função rotação --------------------------------------------------

class Square{
  PShape squareShape;
  float posX;
  float posY;
  color colr;
  Square(){
    posX=0;
    posY=0;
    colr = color(0,0,255);
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX+30, posY+40);
    squareShape.vertex(posX+80, posY+40);
    squareShape.vertex(posX+80, posY+75);
    squareShape.vertex(posX+30, posY+75);
    
    squareShape.endShape(CLOSE);
  }
  Square(color c, float posX, float posY){
    colr = c;
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX+30, posY+40);
    squareShape.vertex(posX+80, posY+40);
    squareShape.vertex(posX+80, posY+75);
    squareShape.vertex(posX+30, posY+75);
    
    squareShape.endShape(CLOSE);
  }
  void display(){
    stroke(0);
    fill(colr);
    shape(squareShape);
  }
}

class Triangle{
  PShape triangleShape;
  float posX;
  float posY;
  color colr;
  Triangle(){
    posX=0;
    posY=0;
    colr = color(0,0,255);
    triangleShape = createShape();
    triangleShape.beginShape(TRIANGLES);
    
    triangleShape.vertex(posX+10, posY+40);
    triangleShape.vertex(posX+100, posY+40);
    triangleShape.vertex(posX+55, posY+20);
    
    triangleShape.endShape(CLOSE);
  }
  Triangle(color c, float posX, float posY){
    colr = c;
    triangleShape = createShape();
    triangleShape.beginShape();
    
    triangleShape.vertex(posX+10, posY+40);
    triangleShape.vertex(posX+100, posY+40);
    triangleShape.vertex(posX+55, posY+20);
    
    triangleShape.endShape(CLOSE);
  }
  void display(){
    stroke(0);
    fill(colr);
    shape(triangleShape);
  }
}

class House{
  Square houseWall;
  Triangle houseRoof;
  color colr;
  House(){
    houseWall = new Square();
    houseRoof = new Triangle();
    colr = color(0, 0, 255);
  }
  void display(){
    houseWall.display();
    houseRoof.display();
  }
}
  

Square square1;
Triangle triangle2;
House house;


void setup(){
  size(800,600);
  background(255);

  house = new House();
  pushMatrix();
  // Desenha uma especie de plano cartesiano
  //line(width, height / 2, 0, height / 2);
  //line(width /2, height, width/2 , 0);
  
  translate(width / 2, height / 2);
        

  house.display();
  popMatrix();
}

float angulo = 45;
void mouseClicked(){
    

      background(255);        // Redesenha o fundo
      pushMatrix();
      translate(width / 2, height / 2);
       
      rotacao(house.houseWall.squareShape, angulo);
      rotacao(house.houseRoof.triangleShape, angulo);
      
      house.display();
      popMatrix();
}

void draw(){
}
