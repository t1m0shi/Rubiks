class Move{
  int dir;
  int x = 0;
  int y = 0;
  int z = 0;
  float angle;
  boolean animating;
  char axis = ' ';
  
  Move(PVector axes, int dir){ //int x, int y, int z, int dir, char ax){
    this.x = round(axes.x);
    this.y = round(axes.y);
    this.z = round(axes.z);
    this.dir = dir;
    if(abs(x) == 1)
      this.axis = 'x';
    else if (abs(y) == 1)
      this.axis = 'y';
    else
      this.axis = 'z';
  }
  
  void start(){
      animating = true;
      this.angle = 0;
  }
  
  void update() {
    if(animating){
      angle += dir * speed;
      if(abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        //update the face data
        switch(axis){
          case 'z':
            cube.turnZ(z, dir);
            break;
          case 'y':
            cube.turnY(y, dir);
            break;
          case 'x':
            cube.turnX(x, dir);
            break;
        }
      }
    }
  }
  
  boolean finished(){
    return !animating;
  }
}
