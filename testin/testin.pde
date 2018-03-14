float t = 0;
float x;
float y;
int speed =1000;

float xn=0;
float yn=0;
void setup(){
 size(1920,1080);
 background(255);
 colorMode(HSB);
 strokeWeight(4);
 frameRate(120);
  
  x=321;
  y=532;
}

void draw(){
  for(int i=0; i<speed; i++){
  stroke(t*100%255,255,255,50);
  
  xn=x+sin(x*PI/width)*PI/2.0-cos(x*PI/width)*PI/2.0;
  yn=y+cos(y*PI/width)*PI/2.0-sin(y*PI/width)*PI/2.0;
  
  line(x,y,xn,yn);
  
  //println(x+"/"+y);
  
  t+=0.01;
  
  if(sqrt(x*x-xn*xn)<=0.1&&sqrt(y*y-yn*yn)<=0.1){
   x = random(width);
   y = random(height);
   t=0;
    }else{
    x=xn%width;
  y=yn%height;
    
    }
  }
  
}

void mouseClicked(){
  saveFrame("Rainbo.jpg");
}