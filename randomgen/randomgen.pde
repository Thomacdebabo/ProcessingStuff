float x,y,xn,yn;
float max = 100;
void setup(){
 size(500,600); 
  background(0);
  x=width/2;
  y=height/2;
  colorMode(HSB);
  
}
void draw(){
  stroke((x+y)/(width + height)*255.0,255,255);
  xn=x+random(max)-max/2;
  yn=y+random(max)-max/2;
  line(x,y,xn,yn);
  x=xn%width;
  y=yn%height;
  
  
  
}

void mouseClicked(){
  saveFrame("randomshit.png");
  
  
}