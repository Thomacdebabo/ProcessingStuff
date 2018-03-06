class ball{
  float x;
  float y;
  float dx=0;
  float dy=0;
  float vy;
  float vx;
  float imp=1.05;
  int size =10;
  float a =9.81;
  float dt = 0.1;
  
  ball(float x0,float y0,float vx0,float vy0){
    x=x0;
    y=y0;
    vx=vx0;
    vy=vy0;
  }
 
  void update(){
    vy=vy+a*dt;
    dy = vy*dt+0.5*a*dt*dt;
    dx = vx*dt;
    
    x+=dx;
    y+=dy;
      
    collision();

       
    }
    void drawball(){
     noStroke();
     fill(vx*2.55,vy*2.55,sqrt(vx*vx+vy*vy)*2.55);
     ellipse(x,y,2*size,2*size); 
      
    }
    void collision(){
    if(x>=width-size){
      vx=-vx/imp;
      x=width-size-1;
   
     }else if(x<=size){
       vx=-vx/imp;
       x=size+1;
     }
     
    if(y>=height-size){
      vy=-vy/imp;
      y=height-size-1;
    }else if(y<=size){
       vy=-vy/imp;
       y=size+1;
     } 
      
    }
  }
 
 
 