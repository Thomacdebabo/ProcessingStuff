class ball3d{
  float x;
  float y;
  float z;
  float dx=0;
  float dy=0;
  float dz=0;
  float vy;
  float vx;
  float vz;
  float imp=1.05;
  int size =10;
  float a =2*9.81;
  float dt = 0.105;
  float Fr= 0.5;
  
  int boundaryX=1000;
  int boundaryY=1000;
  int boundaryZ=1000;
  

  
  ball3d(float x0,float y0, float z0, float vx0,float vy0, float vz0){
    x=x0;
    y=y0;
    z=z0;
    vx=vx0;
    vy=vy0;
    vz=vz0;

  }
 
  void update(){
    vz=vz-a*dt;
    dy = vy*dt;
    dx = vx*dt;
    dz= vz*dt-0.5*a*dt*dt;
    
    x+=dx;
    y+=dy;
    z+=dz;
      
    collision();

       
    }

    
     void drawball(){
     noStroke();
     fill(255);
     translate(x,z,y);
     sphere(size); 
     translate(-x,-z,-y);
      drawshadow();
    }
    void drawshadow(){
     rotateX(PI/2);
     fill(0,0,0,(boundaryZ-z)/boundaryZ*255);
     
     translate(0,0,-1);
     ellipse(x,y,2*size,2*size);
     rotateX(-PI/2); 
     translate(0,0,+1);
      
    }
    void collision(){
    if(x>=boundaryX-size){
      vx=-vx/imp;
      x=boundaryX-size;
   
     }else if(x<=size){
       vx=-vx/imp;
       x=size+1;
     }
     
    if(y>=boundaryY-size){
      vy=-vy/imp;
      y=boundaryY-size-1;
    }else if(y<=size){
       vy=-vy/imp;
       y=size+1;
     } 
     
    if(z>=boundaryZ-size){
      vz=-vz/imp;
      z=boundaryZ-size-1;
    }else if(z<=size){
       friction();
       vz=-vz/imp;
       z=size+1;
     } 
      
      
    }
    void friction(){
      if(vx<0){
        vx+=Fr;
      }
      if(vx>0){
        vx-=Fr;
      }
            if(vy<0){
        vy+=Fr;
      }
      if(vy>0){
        vy-=Fr;
      }
    }
  }
 
 
 