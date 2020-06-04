class Cube {
  Cubie[] cubies;
  
  Cube(int dim, float cubieSize){
    cubies = new Cubie[dim*dim*dim];
    int index = 0;  
    for (int x = -1; x <= 1; x++){
      for (int y = -1; y <= 1; y++){
        for (int z = -1; z <= 1; z++){
          PMatrix3D posMatrix = new PMatrix3D();
          posMatrix.translate(x,y,z);
          cubies[index] = new Cubie(posMatrix,x,y,z,cubieSize);
          index++;
        }
      }
    }
  }
  
  void turnZ(int index, int cw){
    for (int i = 0; i < cubies.length; i++){
      Cubie qb = cubies[i];
      if(qb.z == index){
        PMatrix2D matrix = new PMatrix2D();
        matrix.rotate(HALF_PI * cw);
        matrix.translate(qb.x, qb.y);
        qb.update(round(matrix.m02), round(matrix.m12), qb.z);
        qb.turnFaces('z', cw);
      }
    }
  }
  void turnY(int index, int cw){
    for (int i = 0; i < cubies.length; i++){
      Cubie qb = cubies[i];
      if(qb.y == index){
        PMatrix2D matrix = new PMatrix2D();
        matrix.rotate(HALF_PI * cw);
        matrix.translate(qb.x, qb.z);
        qb.update(round(matrix.m02), qb.y, round(matrix.m12));
        qb.turnFaces('y', cw);
      }
    }
  }
  void turnX(int index, int cw){
    for (int i = 0; i < cubies.length; i++){
      Cubie qb = cubies[i];
      if(qb.x == index){
        PMatrix2D matrix = new PMatrix2D();
        matrix.rotate(HALF_PI * cw);
        matrix.translate(qb.y, qb.z);
        qb.update(qb.x, round(matrix.m02), round(matrix.m12));
        qb.turnFaces('x',cw);
      }
    }
  }
  
  void show(){
    scale(cubieSize);
    for (int i = 0; i < cubies.length; i++){
      push();
      if(abs(cubies[i].z) > 0 && cubies[i].z == currentMove.z){
        rotateZ(currentMove.angle);
      } else if(abs(cubies[i].x) > 0 && cubies[i].x == currentMove.x){
        rotateX(currentMove.angle);
      } else if(abs(cubies[i].y) > 0 && cubies[i].y == currentMove.y){
        rotateY(-currentMove.angle);
      }
      cubies[i].show();
      pop();
    }
  }
  
    class Cubie {
     PMatrix3D pos;
     float len;
     int x,y,z;
     Face[] faces = new Face[6];
     
     Cubie(PMatrix3D posMatrix, int x_, int y_, int z_, float cubieSize){
       pos = posMatrix;
       len = cubieSize;
       x = x_;
       y = y_;
       z = z_;
       
       color col1, col2, col3, col4, col5, col6;
       col1 = col2 = col3 = col4 = col5 = col6 = color(0);
       for(int i = 0; i < 6; i++){
         if(z == 1)
           col2 = colors[1];
         else if(z == -1)
           col1 = colors[0];
         if(y == 1)
           col3 = colors[2];
         else if(y == -1)
           col4 = colors[3];
         if(x == 1)
           col5 = colors[4];
         else if(x == -1)
           col6 = colors[5];
       }
       
       faces[0] = new Face(new PVector(0,0,-1), col1);
       faces[1] = new Face(new PVector(0,0,1), col2);
       faces[2] = new Face(new PVector(0,1,0), col3);
       faces[3] = new Face(new PVector(0,-1,0), col4);
       faces[4] = new Face(new PVector(1,0,0), col5);
       faces[5] = new Face(new PVector(-1,0,0), col6);
       
     }
     
      void update(int x_, int y_, int z_){
        x = x_;
        y = y_;
        z = z_;
        pos.reset();
        pos.translate(x,y,z);
      }
     
     void turnFaces(char axis, int dir){
       for (Face f : faces){
         switch(axis){
           case 'z':
             f.turnZ(dir*HALF_PI);
             break;
           case 'y':
             f.turnY(dir*HALF_PI);
             break;
           case 'x':
             f.turnX(dir*HALF_PI);
             break;
         }
       }
     }
     
     void show() {
       fill(255);
       stroke(0);
       strokeWeight(0.2);
       pushMatrix();
       
       applyMatrix(pos);
       box(1);
       for (Face f: faces){
         f.show();
       }
       popMatrix();
     }
     
     class Face{
       PVector normal;
       color c;
       
       Face(PVector norm, color col){
         c = col;
         normal = norm;
       }
       
       void turnZ(float angle){
         PVector v = new PVector();
         v.x = round(normal.x * cos(angle) - normal.y * sin(angle));
         v.y = round(normal.x * sin(angle) + normal.y * cos(angle));
         v.z = round(normal.z);
         normal = v;
       }
       void turnY(float angle){
         PVector v = new PVector();
         v.x = round(normal.x * cos(angle) - normal.z * sin(angle));
         v.z = round(normal.x * sin(angle) + normal.z * cos(angle));
         v.y = round(normal.y);
         normal = v;
       }
       void turnX(float angle){
         PVector v = new PVector();
         v.y = round(normal.y * cos(angle) - normal.z * sin(angle));
         v.z = round(normal.y * sin(angle) + normal.z * cos(angle));
         v.x = round(normal.x);
         normal = v;
       }
       
       void show(){
         pushMatrix();
         fill(c);
         rectMode(CENTER);
         translate(0.501*normal.x,0.501*normal.y,0.501*normal.z);
         if(abs(normal.x)>0){
           rotateY(HALF_PI);
         }
         else if(abs(normal.y)>0){
           rotateX(HALF_PI);
         }
         square(0,0,1);
         popMatrix();
       }
     }
  }
}
