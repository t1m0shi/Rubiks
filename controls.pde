void keyPressed(){
  //if(key == ' '){
  //  started = true;
  //}
  //else{
  //  if(!currentMove.animating)
  //    applyMove(key);
  //}
  if(!currentMove.animating)
      applyMove(key);
}


void applyMove(char move) {
    
    switch(move){
      //(_, -1) is cw, (_, 1)  is ccw
      //left
      case 'A':
        //cube.turnX(-1,-1);
        currentMove = allMoves[11];
        break;
      case 'a':
        //cube.turnX(-1,1);
        currentMove = allMoves[10];
        break;
      //right
      case 'D':
        //cube.turnX(1,-1);
        currentMove = allMoves[9];
        break;
      case 'd':
        //cube.turnX(1,1);
        currentMove = allMoves[8];
        break;
      //top
      case 'W':
        //cube.turnY(-1,-1);
        currentMove = allMoves[7];
        break;
      case 'w':
        //cube.turnY(-1,1);
        currentMove = allMoves[6];
        break;
      //bottom
      case 'X':
        //cube.turnY(1,-1);
        currentMove = allMoves[5];
        break;
      case 'x':
        //cube.turnY(1,1);
        currentMove = allMoves[4];
        break;
      //back
      case 'S':
        //cube.turnZ(-1,-1);
        currentMove = allMoves[3];
        break;
      case 's':
        //cube.turnZ(-1,1);
        currentMove = allMoves[2];
        break;
      //front
      case 'Z':
        //cube.turnZ(1,-1);
        currentMove = allMoves[1];
        break;
      case 'z':
        //cube.turnZ(1,1);
        currentMove = allMoves[0];
        break;
      default:
        currentMove = allMoves[12];
        break;
    }
    //currentMove.update();
    if(currentMove!= allMoves[12])
      currentMove.start();
        //currentMove.start();
        //currentMove.update();
}
