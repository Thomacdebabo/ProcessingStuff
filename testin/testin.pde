float t = 0;
float x;
float y;
int speed =1000;
int vis = 255;
float f = 10;
float dt = 0.001;

int thiccness = 2;

float xn=0;
float yn=0;
void setup(){
 size(1920,1080);
 background(255);
 colorMode(HSB);
 strokeWeight(thiccness);
 frameRate(120);
  
  x=321;
  y=532;
}

void draw(){
  for(int i=0; i<speed; i++){
  stroke(t*100%255,255,200,vis);
  //xn = x*(1-sin(y+dt)*dt);
  //yn = y*(1+cos(x+dt)*dt);
  
  
  //xn = x + exp(-PI*sin((y-height/2)/height*PI));
  //yn = y - exp(PI*cos((x-width/2)/width*PI));
  
  //xn= x +y*dt;
  //yn= y-x*dt;
  
  //xn = x - 10*exp(-sin(y/height*PI)*exp(sin(y/height*PI)))*y*0.0001*3;
  //yn = y + 10*exp(-sin(x/width*PI)*exp(cos(y/height*PI)))*x*0.0001;
  
  xn = x - f*sin(exp(y/height*PI))*x*dt*3;
  yn = y - f*cos(exp(x/width*PI+y/height*PI))*y*dt;
  
  //xn = x - f*sin(exp(y/height*PI))*x*dt*3;
  //yn = y - f*cos(exp(x/width*PI))*y*dt;
  
  //xn = x - f*sin(exp(y/width*PI))*x*dt*3;
  //yn = y - f*cos(x/height*PI)*y*dt;
  
  //xn = x - f*sin(y/width*PI)*x*dt*3;
  //yn = y - f*cos(x/height*PI)*y*dt;
  
  //xn =x+dt*(x+3*y-t*x);
  //yn =y+dt*(x-5*y-t*y);
  
  //xn = y*0.8+sin(x)*f+1;
  //yn = x*1.2+sin(y)*f+1;
  
  //xn= x-xn*t;
  //yn= y+yn*xn*t;
  
  //xn=y+max(min(x-y,tan(x+y)*x,tan(x+y)*y),sin(x*y)*x,cos(x+y)*y);
  //yn=x+max(min(x+y,tan(x*y)*x,tan(x*y)*y),sin(x/y)*x,cos(x-y)*y);
  
  
  //xn=x+tan(cos(x+y))*f;
  //yn=y+tan(cos(x)*sin(y))*f;
  
  //xn=x+sin(x*PI/width)*PI*f/2.0-cos(x*PI/width)*PI/2.0+tan(x*y)*f;
  //yn=y+cos(y*PI/width)*PI*f/2.0-sin(y*PI/width)*PI/2.0+tan(x*y)*f;
  
  //xn=x+sin(x*PI/width)*PI*f/2.0-cos(x*PI/width)*PI/2.0;
  //yn=y+cos(y*PI/width)*PI*f/2.0-sin(y*PI/width)*PI/2.0;
  
  line(x,y,xn,yn);
  
  //println(x+"/"+y);
  
  t+=0.01;
  
  if(sqrt(x*x-xn*xn)<=0.1&&sqrt(y*y-yn*yn)<=0.1||t>100){
   x = random(width);
   y = random(height);
   t=0;
    }else{
    x=xn%width;
  y=yn%height;
    
    }
  }
}

void keyPressed(){
  String out = "Rainbow";
 out += key;
 out += ".png";
  saveFrame(out);
  
}