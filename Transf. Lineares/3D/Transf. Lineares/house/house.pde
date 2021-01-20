// Aluno: Lucas Macedo da Silva
// Disciplina: Computação gráfica
// Turma: A01

// Código para aplicação das transformações lineares no objeto casa 3D
// O transformação (operação) a ser realizada pode ser esolchida descomentando uma das seguintes linhas e comentando a outra.
// A operação default é a de rotação no eixo x

// Usada para definir a operação a ser realizada.
String operacao = "Rotação"; // Rotação
//String operacao = "Escala";   // Escala
//String operacao = "Reflexão";
//String operacao = "Cisalhamento";

// As transformações são realizadas conforme as equações das transformações 2D, exceto pelo fato de que a coordenada z é adicionada.
// Além disso, as operações costumam ser realizadas com um dos eixos como referencia, por exemplo, o eixo x como referencia e a operação é 
// aplicada nos eixos y e z. Ao escolher o eixo z como referencia a operação é equivalente a aquela realizada em 2D

// A descrição dos parametros de cada função é feita com os comentários iniciais dentro do corpo de cada função.


Square square1;
Triangle triangle2;
House house;

// ___________________________________________________________________________________________________________________________________________________________________________________
//  -------------------------------------------------- Função de aumento de escala --------------------------------------------------
// Realiza a operação de aumento de escala
void escala (PShape s, float x, float y, float z){
  // Parametros
  //     PShape s -> O objeto PShape que contém os vertices
  //     x = o valor de aumento de escala em x
  //     y = o valor de aumento de escala em y
  //     z = o valor de aumento de escala em z
  
  // Pega o tamanho do vetor dos vertices
  int tam = s.getVertexCount();
  
  
  // Percorre os vertices e atribui os novos valores
  for (int i = 0; i < tam; i ++) {
    
    // Pega o vétice
    PVector vetor = s.getVertex(i);

    // Aumenta a escala
    vetor.x = vetor.x * x;
    vetor.y = vetor.y * y;
    vetor.z = vetor.z * z;
    
    // Seta os vertices de volta
    s.setVertex(i, vetor);
    
  }
}
//  -------------------------------------------------- Função de aumento de escala --------------------------------------------------


//  -------------------------------------------------- Função de rotação --------------------------------------------------
// Para um objeto 3D a rotação é realizada aos pares, isto é, para rotacionar um dos eixos é tipo como referencia e não muda
// Por exemplo para rotacionar em volta do eixo y, o eixo y não muda, já os eixos x e z sim.
void rotacao (PShape s, float angulo, String eixo){
  // Parametros
  //     PShape s -> O objeto PShape que contém os vertices
  //     angulo -> O ângulo em graus
  //     eixo -> O eixo de rotação
   
  
  // Pega os vertices do objeto
  int tam = s.getVertexCount();
  
  // Converte o angulo para radianos
  angulo = (angulo * PI) / 180;
  
  
  // Percorre os vertices e atribui os novos valores
  float x, y, z;
  float cos = cos(angulo), sen = sin(angulo);
  for (int i = 0; i < tam; i ++) {
    
    
    // Pega os vétices
    PVector vetor = s.getVertex(i);
    
    x = vetor.x;
    y = vetor.y;
    z = vetor.z;
    
    // Aplica a operação de rotação
    
    // Rotação em torno do eixo z
    if (eixo == "z"){
      vetor.x = x * cos  - y * sen;
      vetor.y = y * cos + x * sen;
      vetor.z = z;
    }
    
    // Rotação em torno do eixo y
    if (eixo == "y"){
      vetor.x = x * cos  + z * sen;
      vetor.y = y;
      vetor.z = z * cos - x * sen;
    }
    
    // Rotação em torno do eixo x
    if (eixo == "x"){
      vetor.x = x;
      vetor.y = y * cos  - z * sen;
      vetor.z = z * cos + y * sen;
    }
    
    // Seta os vertices de volta
    s.setVertex(i, vetor);
    
  }
}
//  -------------------------------------------------- Função rotação --------------------------------------------------

//  -------------------------------------------------- Função de reflexao --------------------------------------------------
void reflexao (PShape s, int a, int b, int c){
  // Parametros
  //     PShape s -> O objeto PShape que contém os vertices
  //     a = -1 reflexão no eixo x
  //     b = -1 reflexão no eixo y
  //     c = -1 reflexão no eixo z
  
  // Pega o tamanho do vetor dos vertices
  int tam = s.getVertexCount();
  
  float x, y, z;
  // Percorre os vertices e atribui os novos valores
  for (int i = 0; i < tam; i ++) {
    
    // Pega o vétice
    PVector vetor = s.getVertex(i);
    
    x = vetor.x;
    y = vetor.y;
    z = vetor.z;

    // Aumenta a escala
    vetor.x =  a*x;
    vetor.y =  b*y;
    vetor.z =  c*z;
    
    // Seta os vertices de volta
    s.setVertex(i, vetor);
    
  }
}
//  -------------------------------------------------- Função de reflexao --------------------------------------------------

//  -------------------------------------------------- Função de cisalhamento --------------------------------------------------
// https://processing.org/reference/PShape_getVertex_.html
// Realiza a operação de aumento de escala

void cisalhamento (PShape s, float a, float b, float c, String eixo){
  // Parametros
  //     PShape s -> O objeto PShape que contém os vertices
  //     a = o valor que sera multiplicado no eixo x para o efeito de cisalhamento
  //     b = o valor que sera multiplicado no eixo y para o efeito de cisalhamento
  //     c = o valor que sera multiplicado no eixo z para o efeito de cisalhamento
  //     eixo = o eixo em que o cisalhamento será realizado
  
  // Pega o tamanho do vetor dos vertices
  int tam = s.getVertexCount();
  
  float x, y, z;
  // Percorre os vertices e atribui os novos valores
  for (int i = 0; i < tam; i ++) {
    
    // Pega o vétice
    PVector vetor = s.getVertex(i);
    
    x = vetor.x;
    y = vetor.y;
    z = vetor.z;

    // Eixo z
    if (eixo == "z"){
      vetor.x = x + a * y;
      vetor.y = y + b * x;
      vetor.z = z;
    }
    
    // Eixo y
    if (eixo == "y"){
      vetor.x = x + a * z;
      vetor.y = y;
      vetor.z = z + c * x;
    }
    
    // Eixo y
    if (eixo == "x"){
      vetor.x = x;
      vetor.y = y + b * z;
      vetor.z = z + c * y;
    }
    
    // Seta os vertices de volta
    s.setVertex(i, vetor);
    
  }
}
//  -------------------------------------------------- Função de cisalhamento --------------------------------------------------
// ___________________________________________________________________________________________________________________________________________________________________________________


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
  



void setup(){
  size(800,600,P3D);
  background(255);

  house = new House();
  pushMatrix();  
  translate(width / 2, height / 2);
        

  house.display();
  popMatrix();
}

float angulo = 45;

void mouseClicked(){
    

      background(255);        // Redesenha o fundo
      pushMatrix();
      translate(width / 2, height / 2);
      if (operacao == "Rotação"){
        rotacao(house.houseWall.squareShape, angulo, "z");
        rotacao(house.houseRoof.triangleShape, angulo, "z");
      }
      
      if (operacao == "Escala"){
        escala(house.houseWall.squareShape, 2, 2, 2);
        escala(house.houseRoof.triangleShape, 2, 2, 2);
      }
      
      if (operacao == "Reflexão"){
        reflexao(house.houseWall.squareShape, -1, 1, 1);
        reflexao(house.houseRoof.triangleShape, -1, 1, 1);
      }
      
      if (operacao == "Cisalhamento"){
        cisalhamento(house.houseWall.squareShape, 1, 2, 3, "x");
        cisalhamento(house.houseRoof.triangleShape, 1, 2, 3, "x");
      }
      
      house.display();
      popMatrix();
}

void draw(){
}
