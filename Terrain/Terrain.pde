float t;
float th=PI;
float slowdown= 60/PI;
int n = 60;
int spacing = 30;

float [][] a = makeplane(n);
 
void setup(){
 size(1200,800,P3D);
 background(100);
 t = 0;
 frameRate(60);

}

void draw(){
  background(0);
  translate(width/2,height/2,0);

  a = makeplane(n);

  rotateX(PI/3);
  

  
  translate(-n*spacing,-n*spacing,0);
  
  drawplane(n,spacing,a);

  t=t+0.1;
}

void drawplane(int n, int spacing, float[][] a){
  for(int x=0; x<2*n; x++){
      for(int y=0; y<2*n; y++){
         stroke(255,x*255/(n*2),y*255/(n*2));
         int xcord =  x*spacing;
         int ycord =  y*spacing;
        if(x!=0){
          line(xcord,ycord,a[x][y],xcord-spacing,ycord, a[x-1][y]);
        }
         if(y!=0){
          line(xcord,ycord,a[x][y],xcord,ycord-spacing, a[x][y-1]);
        }
        if(x!=0&&y!=0){
          line(xcord,ycord,a[x][y],xcord-spacing,ycord-spacing, a[x-1][y-1]); 
        }
    
    }
    
  }
  
}

float [][] makeplane(int n){
   float [][] a = new float[2*n][2*n];
   
  for(int x=0; x<2*n; x++){
      for(int y=0; y<2*n; y++){

          a[x][y]= noise(x/10.0,y/10.0-t)*300;
      }
    }
   return a;  
}