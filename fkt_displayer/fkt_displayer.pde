
float t=0;
int a=4;
float k=50;
float kx = 0.1;
float ky = 0.1;
float w = 40;
float speed = 50;
float s = 0.1;
float scale = 5;

void setup(){
 size(1200,800,P3D);
 background(100);
 colorMode(HSB);
}

void draw(){
background(100);
pointLight(0,0,100,255,255,255);
translate(width/2,height/2,0);
rotateX(PI/4);
rotateZ(PI/4+t);

stroke(0);
strokeWeight(2);
  coords();
  


heightmap((int)k); 
  
t=t+=0.01;
t=t%(2*PI);
}

void coords(){
  line(0,0,-k*a,0,0,k*a);
  line(-k*a,0,0,k*a,0,0);
  line(0,-k*a,0,0,k*a,0);
  for(int i=-10;i<=10; i++){
    float l = k*a/10*i;
   line(0,0,l,10,0,l);
   line(0,l,0,10,l,0); 
   line(l,0,0,l,10,0); 
    
  }
  
}

  

void heightmap(int n){
 //drawfkt(n);
 drawgkt(n);
 
}
void drawgkt(int n){
  
   beginShape(TRIANGLES);
 for(int x=-n; x<n; x++){
    for(int y=-n; y<n; y++){
      noStroke();
     fill(255*((gkt(x,y)+k*a)/(k*a*2)),255,255);
      vertex(x*a,y*a,gkt(x,y));
      vertex((x+1)*a,y*a,gkt(x+1,y));
      vertex(x*a,(y+1)*a,gkt(x,y+1));
      
      vertex(x*a,(y+1)*a,gkt(x,y+1));
      vertex((x+1)*a,(y+1)*a,gkt(x+1,y+1));
      vertex((x+1)*a,y*a,gkt(x+1,y));
   }
 }
 endShape();
}

void drawfkt(int n){
  
   beginShape(TRIANGLES);
 for(int x=-n; x<n; x++){
    for(int y=-n; y<n; y++){
      noStroke();
     fill(255*((fkt(x,y)+k*a)/(k*a*2)),255,255);
      vertex(x*a,y*a,fkt(x,y));
      vertex((x+1)*a,y*a,fkt(x+1,y));
      vertex(x*a,(y+1)*a,fkt(x,y+1));
      
      vertex(x*a,(y+1)*a,fkt(x,y+1));
      vertex((x+1)*a,(y+1)*a,fkt(x+1,y+1));
      vertex((x+1)*a,y*a,fkt(x+1,y));
   }
 }
 endShape();
}
//Dipolstrahlung
float fkt (float x, float y){
  x=x*scale;
  y=y*scale;
  float f;
  float A;
  float R = sqrt(x*x+y*y);
  float E0;
  A=10;
  E0= cos(kx*x)*(1-x*x)+cos(ky*y)*(-x*y);
  f= E0*A;
  
  
  
  

  return f;
}

float gkt (float x, float y){
  float f=0;
  float fr;
  float d=40;
  float i=0.1;
  x=x*scale;
  y=y*scale;
  
 
  //f= exp(-(x*x+y*y)/k/t)*100.0;
  //f=100.0*(cos(2*x/k-10*t)+sin(2*y/k-10*t));
  //f=tan(x*y/k);
  //f=sx*y/k;
  //f=x*x/k+y*y/k-10*x*y/k;
  //f=sin(x/100.0+t*speed)*200*sin(y/10.0+t*speed)*exp((-x*x-y*y)/300.0);
   float end = x;
   for(x = x-d;x< end; x+=i){
  f += 25*(cos(kx*sqrt(x*x+y*y))*cos(-w*t)-sin(kx*sqrt(x*x+y*y))*sin(-w*t))*exp(-sqrt(x*x+y*y)*kx*s);
   }
 for(x = end;x< end+d; x+=i){
  f += 25*(cos(-kx*sqrt(x*x+y*y))*cos(-w*t)-sin(kx*sqrt(x*x+y*y))*sin(-w*t))*exp(-sqrt(x*x+y*y)*kx*s);
   }
   //x=x+40;
  //fr = 25*(cos(kx*sqrt(x*x+y*y))*cos(-w*t)-sin(kx*sqrt(x*x+y*y))*sin(-w*t))*exp(-sqrt(x*x+y*y)*kx*s);
  return f*i/(2*d)*4;
}
void mouseClicked(){
 scale++; 
  //scale=scale%9+1;
}