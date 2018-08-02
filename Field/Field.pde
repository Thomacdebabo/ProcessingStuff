float x,y,z;
float t=0;
vectorfield E = new vectorfield(8);
vectorfield H = new vectorfield(10);
void setup() {
  size(1100,1100,P3D);
  background(0);

}

void draw(){
  init();
  E.Efield(100,100,100,t);
  E.drawvectorfield(1,1,1,0.5);
  //H.Hfield(1,10000,t);
  //H.drawvectorfield(0.5,0,0,1.5);

}

void init (){
  background(0);
  rotateX(PI/4);
  
  translate(500,-1000,-1500);
  rotateZ(PI/4+t);
  stroke(255,0,0);
  line(0,0,-1000,0,0,1000);
  stroke(0,255,0);
  line(0,-1000,0,0,1000,0);
  stroke(0,0,255);
  line(-1000,0,0,1000,0,0); 
  t+=0.01;
}