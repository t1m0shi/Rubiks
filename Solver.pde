import peasy.*;

PeasyCam cam;

int dim = 3; //only works dim = 3
float cubieSize = 50;
float speed = 0.1;

//TOP, BOTTOM, RIGHT, LEFT, FRONT, BACK ?
color[] colors = {#FFFFFF, #FFFF00, #FFA500, #FF0000, #00FF00, #0000FF};



Cube cube;

final PVector F_ = new PVector(0,0,1);
final PVector B_ = new PVector(0,0,-1);
final PVector Bot_ = new PVector(0,1,0);
final PVector T_ = new PVector(0,-1,0);
final PVector R_ = new PVector(1,0,0);
final PVector L_ = new PVector(-1,0,0);

Move[] allMoves = new Move[] {
  new Move(F_,1), //0
  new Move(F_,-1), //1
  new Move(B_,1), //2
  new Move(B_,-1), //3
  new Move(Bot_,1), //4
  new Move(Bot_,-1), //5
  new Move(T_,1), //6
  new Move(T_,-1), //7
  new Move(R_,1), //8
  new Move(R_,-1), //9
  new Move(L_,1), //10
  new Move(L_,-1), //11
  new Move(new PVector(0,0,0),0) //12 do nothing
};

ArrayList<Move> sequence = new ArrayList<Move>();
int numMoves = 50;
int counter = 0;
boolean started = false;
Move currentMove;
RandomizeButton rb;
ResetButton rs;

void setup(){
  size(1000,1000, P3D);
  cam = new PeasyCam(this,400); 
  cube = new Cube(dim, cubieSize);
  rb = new RandomizeButton();
  rs = new ResetButton();
  //rb.start();
  
  //for(int i = 0; i < numMoves; i++){
  //  int ind = int(random(allMoves.length));
  //  Move m = allMoves[ind];
  //  sequence.add(m);
  //}
  //currentMove = sequence.get(counter);
  currentMove = allMoves[12];
  
  //reverse the sequence
  //for (int j = numMoves-1; j>=0; j--){
  //  Move 
  //}
}

//String flipCase(String c){
//  if(c.equals(c.toLowerCase()))
//    return c.toUpperCase();
//  else
//    return c.toLowerCase();
//}

void draw(){
  background(225);
  push();
  rotateX(-0.5);
  rotateY(0.4);
  rotateZ(0.1);
  
  
  currentMove.update();
  if(started){
    currentMove.update();
    if(currentMove.finished() && counter < sequence.size()-1){
      counter++;
      currentMove = sequence.get(counter);
      currentMove.start();
    }
    if(counter == sequence.size()-1)
      started = false;
  }
  pop();
  rb.update();
  rs.update();
  cube.show();
}

void mousePressed(){
  println(mouseX);
  println(mouseY);
  //randomize
  if(mouseY > rb.y && mouseY < (rb.y + rb.h)) {
    if(mouseX > rb.x && mouseX < (rb.x + rb.w)){
      for(int i = 0; i < numMoves; i++){
        int ind = int(random(allMoves.length));
        Move m = allMoves[ind];
        sequence.add(m);
      }
      currentMove = sequence.get(counter);
      started = true;
    }
    //reset
    else if(mouseX > rs.x && mouseX < (rs.x + rb.w)){
      
    }
  }
}
