String pi;
int s []=new int[1000000];
int index =1;
float l = 2;
float x,y;
int g[]= new int[1000000];
void setup(){
  size(1000,1000);
  x=width/2;
  y=height/2;
  pi = loadStrings("pi_digits.txt")[0];
  for(int i=0; i<1000000; i++){
    s[i] = (int)(pi.charAt(i))-48;
  }
  
  colorMode(HSB);
  stroke(255);
}
void draw () {
  if(index<1000000){
    g[index-1]=s[index]-s[index-1];


    
  }else{
  println("done");
  noLoop();
  }
}