int n=200;
ball b[]= new ball[n];

void setup(){
 size (1200,800);
 background(125);
 
 
 for(int i=0; i<n; i++){
  b[i]= new ball(random(width),random(height),random(100),random(100)); 
  b[i].size=5+ (int)random(10);
  b[i].a= 5+ (int)random(10);
  b[i].imp = 1.01+random(0.5);
 }
}

void draw(){
  background(125);
  
  for(int i=0; i<n; i++){
    
  b[i].drawball();
  b[i].update();
  }
  
}