// Aluno: Lucas Macedo da Silva
// Disciplina: Computação gráfica
// Turma: A01

// Código para aplicar a operação de Cisalhamento
// A operação de cisalhamento pode ser definida pelas seguintes equações
// x' = x + a * y
// y' = y + b * x
// Onde,
// x' é o novo valor para a corrdenada x
// y' é o novo valor para a corrdenada y
// x e y são os valores atuais das coordenadas
// a e b são constantes que definem o cisalhamento,
// se a = 0, o cisalhamento ocorre somente na horizontal
// se b = 0, o cisalhamento ocorre somente na vertical
// se a e b != 0 o cisalhamento ocorre tantoo horizontalmente quanto verticalmente

// OBS.: No presente código a operação ficou cumulativa ao realizar a operação o objeto é modificado de forma que os vértices fiquem agora localizados nas posições 
// ocasionadas pelo cisalhamento. Assim, ao aplicar ao aplicar a operação varias vezes o objeto aumenta. 

// Objeto que cria a casa
House house;

//  -------------------------------------------------- Função de cisalhamento --------------------------------------------------
// https://processing.org/reference/PShape_getVertex_.html
// Realiza a operação de aumento de escala

void cisalhamento (PShape s, float a, float b){
  // Parametros
  //     PShape s -> O objeto PShape que contém os vertices
  //     a = o valor que sera multiplicado no eixo x para o efeito de cisalhamento
  //     b = o valor que sera multiplicado no eixo y para o efeito de cisalhamento
  
  // Pega o tamanho do vetor dos vertices
  int tam = s.getVertexCount();
  
  float x, y;
  // Percorre os vertices e atribui os novos valores
  for (int i = 0; i < tam; i ++) {
    
    // Pega o vétice
    PVector vetor = s.getVertex(i);
    
    x = vetor.x;
    y = vetor.y;

    // Aumenta a escala
    vetor.x =  x + a * y;
    vetor.y =  y + b * x;
    
    // Seta os vertices de volta
    s.setVertex(i, vetor);
    
  }
}
//  -------------------------------------------------- Função de cisalhamento --------------------------------------------------

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

void setup(){
  size(800,600);
  background(255);

  house = new House();
  pushMatrix();
  house.display();
  popMatrix();
}

void mouseClicked(){
      background(255, 255, 255);        // Redesenha o fundo
      pushMatrix();
      
      // Imprime um textinho
      
      // Aplica a operação de aumento de escala
     // escala(house.houseWall.squareShape, 1.5, 1.5);
     // escala(house.houseRoof.triangleShape, 1.5, 1.5);
      
      cisalhamento(house.houseWall.squareShape, 2, 0);
      cisalhamento(house.houseRoof.triangleShape, 2, 0);
      
      house.display();
      popMatrix();
}

void draw(){

}
