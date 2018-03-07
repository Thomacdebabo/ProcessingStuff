int n=300;

int initialV = 100;

ball b[]= new ball[n];

void setup(){
 size (1200,800);
 background(125);
 textSize(20);
 colorMode (HSB);
  for(int i=0; i<n; i++){
  //b[i]= new ball(random(width),random(height),random(200),random(300)); 
  b[i]= new ball(0,0,random(initialV),-random(initialV));
  b[i].size=5+ (int)random(20);
  b[i].a= 5+ random(30);
  b[i].imp = 1.01+random(0.5);
 }

}

void draw(){
  background(125);
  fill(255);
  text("click to spawn balls",20,20);
  text("Info: red balls are fast blue balls are slow",width-420,20);
  text("balls: " +n ,20,40);
  text("max init velocity: " +initialV ,20,60);

  for(int i=0; i<n; i++){
    
  b[i].drawball(initialV);
  b[i].update();
  }
  
}

void mouseClicked(){
  for(int i=0; i<n; i++){
  //b[i]= new ball(random(width),random(height),random(200),random(300)); 
  b[i]= new ball(mouseX,mouseY,random(2*initialV)-initialV,random(2*initialV)-initialV);
  b[i].size=5+ (int)random(20);
  b[i].a= 5+ random(30);
  b[i].imp = 1.01+random(0.5);
 }
  
}