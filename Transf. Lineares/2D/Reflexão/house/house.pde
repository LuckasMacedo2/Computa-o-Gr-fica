// Aluno: Lucas Macedo da Silva
// Disciplina: Computação gráfica
// Turma: A01

// Código para aplicar a operação de reflexão
// A operação de rotação pode ser definida conforme descrito pelas equações seguintes:
// Reflexão em torno do eixo x
// x = x
// y = -y
// Reflexão em torno do exio y
// x = -x
// y = y
// Reflexão em torno dos dois eixos
// x = -x
// y = -y

// Objeto que cria a casa
House house;

//  -------------------------------------------------- Função de reflexao --------------------------------------------------
// Realiza a operação de aumento de escala

void reflexao (PShape s, int a, int b){
  // Parametros
  //     PShape s -> O objeto PShape que contém os vertices
  //     a = -1 reflexão no eixo y
  //     b = -1 reflexão no eixo x
  
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
    vetor.x =  a*x;
    vetor.y =  b*y;
    
    // Seta os vertices de volta
    s.setVertex(i, vetor);
    
  }
}
//  -------------------------------------------------- Função de reflexao --------------------------------------------------

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
  
  // Desenha uma especie de plano cartesiano
  line(width, height / 2, 0, height / 2);
  line(width /2, height, width/2 , 0);
  
  translate(width / 2, height / 2);

  house = new House();
  pushMatrix();
  house.display();
  popMatrix();
}

void mouseClicked(){
      background(255, 255, 255);        // Redesenha o fundo
      pushMatrix();
      line(width, height / 2, 0, height / 2);
      line(width /2, height, width/2 , 0);
      // Imprime um textinho
      translate(width / 2, height / 2);
      reflexao(house.houseWall.squareShape, -1, 1);
      reflexao(house.houseRoof.triangleShape, -1, 1);
      
      house.display();
      popMatrix();
}

void draw(){

}
