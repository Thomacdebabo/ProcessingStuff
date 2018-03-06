
float t=0;
int a=2;
float k=100;

void setup(){
 size(800,600,P3D);
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
  beginShape(TRIANGLES);
 for(int x=-n; x<n; x++){
    for(int y=-n; y<n; y++){
      noStroke();
     fill(255*(t%1),255,255);
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


float fkt (int x, int y){
  float f;
  
  f=(sin((x*y)/(k*10.0)-t*10)*30);
  //f= exp(-(x*x+y*y)/k/t)*100.0;
  //f=100.0*(cos(2*x/k-10*t)+sin(2*y/k-10*t));
  //f=tan(x*y/k);
  //f=x*y/k;
  //f=x*x/k+y*y/k-10*x*y/k;
  return f;
}