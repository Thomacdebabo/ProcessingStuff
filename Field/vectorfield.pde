class vectorfield{
 vector V [][][];
 int padding = 100;
 int nmax;
 int mmax;
 int lmax;
 
 vectorfield(int n){
   V = new vector[2*n][2*n][2*n];
   nmax=n;
   mmax=n;
   lmax=n;
 }
  
   vectorfield(int n, int m, int l){
   V = new vector[2*n][2*m][2*l]; 
   nmax=n;
   mmax=m;
   lmax=l;
 }
 void init (){
   for(int x = 0; x<nmax; x++){
       for(int y = 0; y<mmax; y++){
          for(int z = 0; z<lmax; z++){
             V[x][y][z]= new vector(padding,padding,padding);
          }
       }
   }
   
 }
  void  drawvectorfield(float R, float G, float B, float a){
    for(int x = 0; x<2*nmax; x++){
       for(int y = 0; y<2*mmax; y++){
          for(int z = 0; z<2*lmax; z++){
            
          V[x][y][z].drawvect((x-nmax)*padding,(y-mmax)*padding,(z-lmax)*padding,R,G,B,a);
          }
        }
      }
    
  }
  void setDipole(float k, float o, float t){
       for(int x = -nmax; x<nmax; x++){
         for(int y = -mmax; y<mmax; y++){
          for(int z = -lmax; z<lmax; z++){
            float c=-5; 
            float r =sqrt(x*x+y*y+z*z);
            float Ex= o/4/PI/r*(cos(k*r)*cos(c*t)-sin(k*r)*sin(c*t))*(1-x*x/r/r);
            float Ey = -x*y/r/r*o/4/PI/r*(cos(k*r)*cos(c*t)-sin(k*r)*sin(c*t));
            float Ez = -x*z/r/r*o/4/PI/r*(cos(k*r)*cos(c*t)-sin(k*r)*sin(c*t));
             V[x+nmax][y+mmax][z+lmax]= new vector(Ex,Ey,Ez);
          }
       }
   }
    
  }
  void Hfield(float k, float o, float t){
       for(int x = -nmax; x<nmax; x++){
         for(int y = -mmax; y<mmax; y++){
          for(int z = -lmax; z<lmax; z++){
            float c=-5; 
            float r =sqrt(x*x+y*y+z*z);
            float Hx= 0;
            float Hy = z/r*o/4/PI/r*(cos(k*r)*cos(c*t)-sin(k*r)*sin(c*t));
            float Hz = -y/r*o/4/PI/r*(cos(k*r)*cos(c*t)-sin(k*r)*sin(c*t));
             V[x+nmax][y+mmax][z+lmax]= new vector(Hx,Hy,Hz);
          }
       }
   }
    
  }
  void Efield ( float k, float A,float  omega, float t){
    t=0.01*t;
         for(int x = -nmax; x<nmax; x++){
         for(int y = -mmax; y<mmax; y++){
          for(int z = -lmax; z<lmax; z++){
            float c=-5;
            float AA = A*exp(-(x*x+y*y)/omega/omega);
            float im = cos(k*x)*sin(omega*t)+sin(k*x)*cos(omega*t);
            float re = cos(k*z)*cos(omega*t)+sin(k*x)*sin(omega*t);
            float Ex= (x*re-y*im)*AA;
            float Ey = 0;
            float Ez = AA*(re*2*x*y/k-im*(1/k-2*x*x/k));
             V[x+nmax][y+mmax][z+lmax]= new vector(Ex,Ey,Ez);
          }
       }
         }
}
}