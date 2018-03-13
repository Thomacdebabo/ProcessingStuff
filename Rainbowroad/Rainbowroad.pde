float t = 0;
int intervall=50;
int thiccness=5;

void setup(){
 size(1920,1080);
 background(255);
 colorMode(HSB);
 strokeWeight(thiccness);
 frameRate(120);
}

void draw(){
  for( int x=10; x<width; x+=intervall){
    for( int y=10; y<height; y+=intervall){
       drawline(x,y);
       println(x+"/"+y);
    }
  }
  saveFrame("Rainbowroad.jpg");
  noLoop();
}

void drawline(float i, float j){
  float x=i;
  float y=j;

  float xn=0;
  float yn=0;
  t=0;
  boolean bo=true;
  color c;

  while(bo){
  stroke(t*100%255,255,255);
  
  xn=x+sin(x*PI/width)*3*PI;
  yn=y+cos(y*PI/height)*PI;
   //c=get((int)xn,(int)yn);
  //if(red(c)!=255)bo=false;

  line(x,y,xn,yn);
  
 // println(x+"/"+y);
  
  t+=0.01;
  
  
  if(sqrt(x*x-xn*xn)<=0.1&&sqrt(y*y-yn*yn)<=0.1)bo=false;
  
  x=xn%width;
  y=yn%height;

  }
}