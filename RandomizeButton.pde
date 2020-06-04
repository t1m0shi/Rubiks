class RandomizeButton{
  float w = 50;
  float h = 20;
  float x = -220;
  float y = height - h;//220-h;
  String Text = "Randomize";
  
  //void start(){
  //  push();
  //  fill(255);
  //  rect(x,y,w,h);
  //  fill(0);
  //  textAlign(LEFT,TOP);
  //  fittedText(Text, createFont("Arial", 30), x+2, y+5, w,h);
  //  pop();
  //}
  void update(){
    //undo camera rotation
    float[] rotations = cam.getRotations();
    push();
    rotateX(rotations[0]);
    rotateY(rotations[1]);
    rotateZ(rotations[2]);
    
    fill(255);
    rect(x,y,w,h);
    fill(0);
    textAlign(LEFT,TOP);
    fittedText(Text, createFont("Arial",30), x+2, y+5, w, h);
    pop();
  }
  void fittedText(String t, PFont font, float posX, float posY, float fitX, float fitY){
    scale(0.85);
    textFont(font);
    textSize(min(font.getSize()*fitX/textWidth(t),fitY));
    text(t,posX/0.85,posY/0.85);
  }
  
  
  
}
