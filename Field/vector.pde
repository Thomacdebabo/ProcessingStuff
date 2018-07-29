class vector{
  float l=75;
  float x;
  float y;
  float z;
  float v;
  


vector(float x0, float y0, float z0){
 v= sqrt(x0*x0+y0*y0+z0*z0);
 x=x0/v;
 y=y0/v;
 z=z0/v;
}

void drawvect (int xl,int yl,int zl, int R, int G, int B) {
  stroke(v*2*R,v*2*G,v*2*B,v);
  strokeWeight(2);
  
  line(xl,yl,zl,xl+x*l,yl+y*l,zl+z*l);
  
  }
}