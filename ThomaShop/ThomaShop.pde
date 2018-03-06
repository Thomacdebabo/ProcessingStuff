collage c;
void setup (){
  size(1200,800);
  background(0);
  c = new collage("test.jpeg");
}




void draw(){
  
  //c.drawcollage();
  //c.savemycollage();
  
  PImage im = EdgeDet("test.jpeg");
  image(im,0,0,width,height);

 noLoop(); 
}