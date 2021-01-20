// Aluno: Lucas Macedo da Silva
// Código para aplica a operação de aumento de escala no objeto casa

// A operação de aumento de escala é definida por:
// x' = a * x
// y' = b * y
// onde,
// x e y são as coordenadas atuais
// x' é o novo para a coordenada x
// y' é o novo para a coordenada y
// a é a escala em x
// b é a escala em y



// Objeto que cria a caasa
House house;

//  -------------------------------------------------- Função de aumento de escala --------------------------------------------------
// https://processing.org/reference/PShape_getVertex_.html
// Realiza a operação de aumento de escala

void escala (PShape s, float x, float y){
  // Parametros
  //     PShape s -> O objeto PShape que contém os vertices
  //     x = o valor de aumento de escala em x
  //     y = o valor de aumento de escala em y
  
  // Pega o tamanho do vetor dos vertices
  int tam = s.getVertexCount();
  
  
  // Percorre os vertices e atribui os novos valores
  for (int i = 0; i < tam; i ++) {
    
    // Pega o vétice
    PVector vetor = s.getVertex(i);

    // Aumenta a escala
    vetor.x = vetor.x * x;
    vetor.y = vetor.y * y;
    
    // Seta os vertices de volta
    s.setVertex(i, vetor);
    
  }
}
//  -------------------------------------------------- Função de aumento de escala --------------------------------------------------


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
      textSize(32);
      text("Fique em casa!", 10, 30);
      
      // Aplica a operação de aumento de escala
      escala(house.houseWall.squareShape, 1.5, 1.5);
      escala(house.houseRoof.triangleShape, 1.5, 1.5);
      
      house.display();
      popMatrix();
}

void draw(){

}
