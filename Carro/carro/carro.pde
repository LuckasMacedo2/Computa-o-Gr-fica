void setup() {
  size(500, 500);
  //translate(width, height/2);
  background(255);
  smooth();

  //rectMode(CENTER); // show bounding boxes
  //bezier(50, 75, 25, 25, 125, 25, 100, 75);
  stroke(0);
  
  // Teto
  //line(100, 150, 300, 150);
  curve(100, 250, 125, 125, 275, 125, 300, 250); 
  
  // Antena
  line(100, 100, 150, 115);
  
  // Vidro
  curve(85, 175, 135, 125, 265, 125, 300, 175);
  line(265, 125, 300, 160);
  line(135, 125, 110, 160);
  line(110, 160, 300, 160);
  line(265, 125, 265, 160);
  line(200, 120, 200, 160);
  
  // Porta
  line(200, 160, 200, 240);
  line(300, 160, 300, 196);
  arc(300, 240, 85, 85, PI , 3 * PI / 2);
  line(200, 240, 256, 240);
  
  // Maçaneta
  ellipse(220, 170, 25, 10);
  
  // Parabrisa
  line(275, 125, 310, 160);
  line(125, 125, 100, 160);
  
  // Parachoque
  bezier(310, 160, 500, 150, 390, 300, 310, 240);
  bezier(100, 160, 0, 150, 0, 300, 100, 240);
  // Luz
  arc(400, 190, 50, 25, PI / 2, 3 * PI / 2);
  line(400, 202, 415, 202);
  
  // Piso
  line(300, 245, 100, 245);
  
  // Rodas
  fill(0);
  arc(100, 250, 75, 75, -PI, PI);  
  arc(300, 250, 75, 75, -PI, PI);  
  noFill();
  fill(255);
  arc(100, 250, 50, 50, -PI, PI);  
  arc(300, 250, 50, 50, -PI, PI); 
  
  // Tanque
  arc(75, 180, 15, 15, -PI, PI);  
  
}
