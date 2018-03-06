float x,y,z;
void setup() {
  size(800,600,P3D);
  x = width/2;
  y = height/2;
  z = 0;
  background(0);
  
}

void draw(){
  background(0);
  
  translate(x,y,100*sin(PI/30.0*z));
  rectMode(CENTER);
  rotateX(PI/4);
  rotateZ(0);
  rotateY(0);
  for(int i=-12; i<12; i++){
    for(int j=-15; j<5; j++){
      fill(255);
      rect(i*100,j*100,100*sin(PI/60.0*z),100*sin(PI/60.0*z));

      rect(i*100+50,j*100+50,100*cos(PI/60.0*z),100*cos(PI/60.0*z));
    }
  }
  box(100*sin(PI/60.0*z));
  z++;
  z=z%120;
}