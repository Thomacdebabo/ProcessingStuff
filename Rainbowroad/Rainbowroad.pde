float t = 0;
int intervall=10;
int thiccness=10;
float limx=10;
float limy =1;
int vis = 255;
float lim = 10;
float dt = 0.01;
void setup(){
 size(1920,1080);
 background(0);
 colorMode(HSB);
 strokeWeight(thiccness);
 frameRate(120);
}

void draw(){
  /*for( int x=0; x<width/limx; x+=intervall){
    for( int y=0; y<height/limy; y+=intervall){
       drawline(x,y);
       println(x+"/"+y);
    }
  }
  */
  for(int i=0; i<width; i++){
    drawline(i,height);
    drawline(i,0);
  }
  for(int j=0; j<height; j++){
    drawline(width,j);
    drawline(0,j);
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
  
  xn = x*(1+sin((y+dt)/height*PI)*dt);
  yn = y*(1-cos((x+dt)/width*PI)*dt);
  
  //xn= x +y*dt;
  //yn= y-x*dt;
  
  //xn = x +exp(-PI*sin((y-height/2)/height*PI));
  //yn = y -exp(PI*cos((x-width/2)/width*PI));
  
  //xn = x - 10*exp(-sin(y/height*PI)*exp(sin(y/height*PI)))*y*0.0001*3;
  //yn = y + 10*exp(-sin(x/width*PI)*exp(cos(x/width*PI)))*x*0.0001;
  
  //xn = x - 10*exp(sin(y/height*PI))*y*0.0001*3;
  //yn = y - 10*exp(tan(x/width*PI))*x*0.0001;
  
  
  //xn = x - 10*exp(sin(y/height*PI))*x*0.0001*3;
  //yn = y - 10*exp(cos(x/width*PI))*y*0.0001;
  
  //xn = x - 10*sin(exp(y/height*PI))*x*0.0001*3;
  //yn = y - 10*cos(exp(x/width*PI+y/height*PI))*y*0.0001;
  
  //xn = x - 10*sin(exp(y/height*PI))*x*0.0001*3;
  //yn = y - 10*cos(exp(x/width*PI))*y*0.0001;  
  
  //xn=x+sin(x*PI/width)*PI;
  //yn=y+cos(y*PI/height)*3*PI;
  
  //c=get((int)xn,(int)yn);
  //if(red(c)!=255)bo=false;

  line(x,y,xn,yn);
  
 // println(x+"/"+y);
  
  t+=dt;
  
  
  if(sqrt(x*x-xn*xn)<=0.1&&sqrt(y*y-yn*yn)<=0.1||t>lim)bo=false;
  
  x=xn%width;
  y=yn%height;

  }
}

void keyPressed(){
  String out = "Rainbowroad";
 out += key;
 out += thiccness;
 out += "-";
 out += dt;
 out += "-";
 out += lim;
 out += ".png";
  saveFrame(out);
}