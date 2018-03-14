float t=0;
int n=200;
int max = 1200;
int may = 1200;
int maz = 1000;

int[][] points = new int [3][n];
void setup(){
  background(0);
  size(800,800,P3D);
  noStroke();
  colorMode(HSB);
  for(int i=0; i<n; i++){
   points[0][i]= (int) random(max)-max/2; 
   points[1][i]= (int) random(may)-may/2; 
   points[2][i]= (int) random(maz)-maz/2; 
    
  }
  
}
void draw (){
  background(0);
  fill(255);

  translate(width/2,height/2,-maz/2);
  rotateX(PI/4);
  rotateZ(t*PI/4);

  drawpoints();
  t+=0.01;
}

void drawpoints(){
  float x,y,z;
 for(int i=0; i<n; i++){
   x=points[0][i];
   y=points[1][i];
   z=points[2][i];
   translate(x,y,z);
  fill(random(255),255,255);
   sphere(sin(x+y-z)*10);
   translate(-x,-y,-z);
 }
  
}