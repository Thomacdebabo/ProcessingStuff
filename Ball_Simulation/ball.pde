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
  float Fr= 0.5;
  

  
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
    void drawball(int max){
     noStroke();
     fill(170-sqrt(vx*vx+vy*vy)/max/1.41*170,255,255);
     ellipse(x,y,2*size,2*size); 
      
    }
    
     void drawball(){
     noStroke();
     fill(0,255,255);
     ellipse(x,y,2*size,2*size); 
      
    }
    void collision(){
    if(x>=width-size){
      vx=-vx/imp;
      x=width-size;
   
     }else if(x<=size){
       vx=-vx/imp;
       x=size+1;
     }
     
    if(y>=height-size){
      vy=-vy/imp;
      friction();
      
      y=height-size-1;
    }else if(y<=size){
       vy=-vy/imp;
       y=size+1;
     } 
      
    }
    void friction(){
            if(vx<0){
        vx+=Fr;
      }
      if(vx>0){
        vx-=Fr;
      }
    }
  }
 
 
 