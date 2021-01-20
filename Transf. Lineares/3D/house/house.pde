// Aluno: Lucas Macedo da Silva
// Disciplina: Computação gráfica
// Turma: A01

// Código para criação do objeto casa em 3D
// Primeiramente o modo de exibição foi alterado para 3D, com o parametro P3D passado na função
// size.

// Foi acrescentada a coordenada z ao objeto.
// O objeto 3D foi construído vértice a vértice nos construtores do mesmo.
// Cada posição de vértice foi definida manualmente.

class Square{
  PShape squareShape;
  float posX;
  float posY;
  float posZ;
  color colr;
  Square(){
    posX=0;
    posY=0;
    posZ=0;
    colr = color(0,0,255);
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX + 30, posY + 40, posZ + 0);
    squareShape.vertex(posX + 80, posY + 40, posZ + 0);
    
    squareShape.vertex(posX + 80, posY + 40, posZ + 50);
    squareShape.vertex(posX + 30, posY + 40, posZ + 50);
    
    squareShape.vertex(posX + 30, posY + 40, posZ + 0);
    squareShape.vertex(posX + 30, posY + 75, posZ + 0);
    
    squareShape.vertex(posX + 80, posY + 75, posZ + 0);
    squareShape.vertex(posX + 80, posY + 40, posZ + 0);
    
    squareShape.vertex(posX + 80, posY + 75, posZ + 0);
    squareShape.vertex(posX + 80, posY + 75, posZ + 50);
    
    squareShape.vertex(posX + 80, posY + 40, posZ + 50);
    squareShape.vertex(posX + 80, posY + 75, posZ + 50);
    
    squareShape.vertex(posX + 30, posY + 75, posZ + 50);
    squareShape.vertex(posX + 30, posY + 40, posZ + 50);
    
    squareShape.vertex(posX + 30, posY + 75, posZ + 50);
    squareShape.vertex(posX + 30, posY + 75, posZ + 0);
    
    squareShape.endShape(CLOSE);
  }
  Square(color c, float posX, float posY, float posZ){
    colr = c;
    squareShape = createShape();
    squareShape.beginShape();
    
    squareShape.vertex(posX + 30, posY + 40, posZ + 0);
    squareShape.vertex(posX + 80, posY + 40, posZ + 0);
    
    squareShape.vertex(posX + 80, posY + 40, posZ + 50);
    squareShape.vertex(posX + 30, posY + 40, posZ + 50);
    
    squareShape.vertex(posX + 30, posY + 40, posZ + 0);
    squareShape.vertex(posX + 30, posY + 75, posZ + 0);
    
    squareShape.vertex(posX + 80, posY + 75, posZ + 0);
    squareShape.vertex(posX + 80, posY + 40, posZ + 0);
    
    squareShape.vertex(posX + 80, posY + 75, posZ + 0);
    squareShape.vertex(posX + 80, posY + 75, posZ + 50);
    
    squareShape.vertex(posX + 80, posY + 40, posZ + 50);
    squareShape.vertex(posX + 80, posY + 75, posZ + 50);
    
    squareShape.vertex(posX + 30, posY + 75, posZ + 50);
    squareShape.vertex(posX + 30, posY + 40, posZ + 50);
    
    squareShape.vertex(posX + 30, posY + 75, posZ + 50);
    squareShape.vertex(posX + 30, posY + 75, posZ + 0);
    
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
  float posZ;
  color colr;
  Triangle(){
    posX=0;
    posY=0;
    posZ = 0;
    colr = color(0,0,255);
    triangleShape = createShape();
    triangleShape.beginShape();
    
    triangleShape.vertex(posX + 10, posY + 40, posZ + 0);
    triangleShape.vertex(posX + 100, posY + 40, posZ + 0);
    triangleShape.vertex(posX + 100, posY + 40, posZ + 50);
    triangleShape.vertex(posX + 10, posY + 40, posZ + 50);
    
     triangleShape.vertex(posX + 55, posY + 20, posZ + 50);
     triangleShape.vertex(posX + 100, posY + 40, posZ + 50);
     
     triangleShape.vertex(posX + 100, posY + 40, posZ + 0);
     triangleShape.vertex(posX + 55, posY + 20, posZ + 0);
     triangleShape.vertex(posX + 10, posY + 40, posZ + 0);
     
     triangleShape.vertex(posX + 55, posY + 20, posZ + 0);
     triangleShape.vertex(posX + 55, posY + 20, posZ + 50);
      
     triangleShape.vertex(posX + 10, posY + 40, posZ + 50);
     triangleShape.vertex(posX + 10, posY + 40, posZ + 0);
      
    triangleShape.endShape(CLOSE);
  }
  Triangle(color c, float posX, float posY, float posZ){
    colr = c;
    triangleShape = createShape();
    triangleShape.beginShape();
    
    triangleShape.vertex(posX + 10, posY + 40, posZ + 0);
    triangleShape.vertex(posX + 100, posY + 40, posZ + 0);
    triangleShape.vertex(posX + 100, posY + 40, posZ + 50);
    triangleShape.vertex(posX + 10, posY + 40, posZ + 50);
    
     triangleShape.vertex(posX + 55, posY + 20, posZ + 50);
     triangleShape.vertex(posX + 100, posY + 40, posZ + 50);
     
     triangleShape.vertex(posX + 100, posY + 40, posZ + 0);
     triangleShape.vertex(posX + 55, posY + 20, posZ + 0);
     triangleShape.vertex(posX + 10, posY + 40, posZ + 0);
     
     triangleShape.vertex(posX + 55, posY + 20, posZ + 0);
     triangleShape.vertex(posX + 55, posY + 20, posZ + 50);
      
     triangleShape.vertex(posX + 10, posY + 40, posZ + 50);
     triangleShape.vertex(posX + 10, posY + 40, posZ + 0);
    
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
  size(800,600, P3D);
  house = new House();
}
void draw(){
  background(255);
  translate(width/2, height/2);
  
  // Rotaciona o objeto para verificar de uma forma melhor
  rotateY(map(mouseX, 0, width, 0, PI));    // Rotaciona no eixo Y 
  rotateZ(map(mouseY, 0, height, 0, -PI));  // Rotaciona no eixo Z
  
  house.display();
}
