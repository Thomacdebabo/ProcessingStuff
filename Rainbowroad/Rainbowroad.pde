float t = 0;
int intervall=10;
int thiccness=2;
float limx=1;
float limy =1;
int vis = 255;
float dt = 0.01;
void setup(){
 size(1920,1080,P2D);
 background(255);
 colorMode(HSB);
 strokeWeight(thiccness);
 frameRate(120);
}

void draw(){
  for( int x=0; x<width/limx; x+=intervall){
    for( int y=0; y<height/limy; y+=intervall){
       drawline(x,y);
       println(x+"/"+y);
    }
  }
  
  println("-----------------------------Done-----------------------------");
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
  stroke(t*100%255,255,255,vis);
  
  xn = x - 10*sin(exp(y/width*PI))*x*0.0001*3;
  yn = y - 10*cos(exp(x/height*PI))*y*0.0001;
  
  //xn=x+sin(x*PI/width)*PI;
  //yn=y+cos(y*PI/height)*3*PI;
  
  //c=get((int)xn,(int)yn);
  //if(red(c)!=255)bo=false;

  line(x,y,xn,yn);
  
 // println(x+"/"+y);
  
  t+=dt;
  
  
  if(sqrt(x*x-xn*xn)<=0.1&&sqrt(y*y-yn*yn)<=0.1)bo=false;
  
  x=xn%width;
  y=yn%height;

  }
}

void keyPressed(){
  String out = "Rainbowroad";
 out += key;
 out += ".png";
  saveFrame(out);
}