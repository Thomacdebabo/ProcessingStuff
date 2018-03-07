int n=100;
int initialV = 120;

ball3d b[]= new ball3d[n];

void setup(){
   size (1600,1000,P3D);
   background(125);
   colorMode (RGB);
   
   for(int i=0; i<n; i++){
     b[i] = new ball3d(1000,0,1000,random(initialV),random(initialV),-random(initialV));
     b[i].size = 10 + (int)random(20);
  
 }

}

void draw(){
  
  Environment();

  for(int i=0; i<n; i++){
    b[i].drawball();
    b[i].update();
  } 
}

void Environment(){
  
  background(125);
  pointLight(255,255,255,500, -500, 1000);
  translate(300, 500, -1200);
  rotateX(PI/4);
  
  fill(255);
  rect(0,0,1000,1000);
  rotateX(PI/2);
  rect(0,0,1000,1000);
  rotateY(PI/2);
  rect(0,0,1000,1000);
  
}
void mouseClicked(){
  
  int rx=(int)random(1000);
  int ry=(int)random(1000);
  int rz=(int)random(1000);
  
  for(int i=0; i<n; i++){
    b[i] = new ball3d(rx,ry,rz,random(2*initialV)-initialV,random(2*initialV)-initialV,random(2*initialV)-initialV);
    b[i].size = 10 + (int)random(20);
 }
}