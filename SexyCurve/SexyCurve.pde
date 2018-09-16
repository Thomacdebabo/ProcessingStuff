void setup(){
  size(800,600);
  background(0);
  
  
}
float t=0;
float tlast =0;
float o1=2.42;
float q1=1.23;
float o2=4.234;
float q2=1;
void draw (){
  stroke(255,0,0);
  strokeWeight(2);
  line(200*sin(t*o1+q1)+400,200*sin(2*t*o2+q2)+300,200*sin(tlast*o1+q1)+400,200*sin(2*tlast*o2+q2)+300);
  tlast=t;
  t+=0.01;
}