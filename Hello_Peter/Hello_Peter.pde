
 PImage img;
 PImage img1;
 PImage img2;
 PImage img3;
 String Input = "Thoma.jpg";
void setup() {
 size(1920,1080);
 background(0);
img = loadImage(Input);
img1 =loadImage(Input);
img2 =loadImage(Input);
img3 =loadImage(Input);

}
void draw(){
  //rectify Images  
  img1 = Shit(img1);
  img2 = Shit1(img2);
  img3 = Shit2(img3);
  
  img1.save("Sine"+Input);
  img2.save("CoSine"+Input);
  img3.save("Tangent"+Input);
  //display Images
  image(img, 0, 0, width/2, height/2);
  image(img1, 0, height/2, width/2, height/2);
  image(img2, width/2, 0, width/2, height/2);
  image(img3, width/2, height/2, width/2, height/2);
  
 // drawing Options 
  noStroke();
  colorMode(HSB,255);
  //fancy Verzierige
  for(int i=0; i<width; i++){
    fill(i%255,255,255,200);
   rect(i,height/2, 1,25*(sin(i/8.0)));
  }
  
  for(int i=0; i<height; i++){
  fill(i%255,255,255,200);
   rect(width/2,i, 25*(sin(i/8.0)),1);
  }
  colorMode(RGB,255);
  fill(255,0,0);
  ellipse(width/2,height/2,100,100);
  saveFrame("NiceCollage"+Input);
  noLoop();
}

PImage Shit(PImage im){
  im.loadPixels();
  for(int x = 0; x < im.width; x++){
    for(int y = 0; y < im.height; y++){
      int r =(int)(255*sin(red( im.pixels[x+y*im.width])/255.0*(2*PI)));
      int g =(int)(255*sin(green( im.pixels[x+y*im.width])/255.0*(2*PI)));
      int b =(int)(255*sin(blue( im.pixels[x+y*im.width])/255.0*(2*PI)));
      
      im.pixels[x+y*im.width]= color(r,g,b);
    }
  }
  im.updatePixels();
  return im;
}

PImage Shit1(PImage im){
  im.loadPixels();
  for(int x = 0; x < im.width; x++){
    for(int y = 0; y < im.height; y++){
      int r =(int)(255*cos(red( im.pixels[x+y*im.width])/255.0*(2*PI)));
      int g =(int)(255*cos(green( im.pixels[x+y*im.width])/255.0*(2*PI)));
      int b =(int)(255*cos(blue( im.pixels[x+y*im.width])/255.0*(2*PI)));
      
      im.pixels[x+y*im.width]= color(r,g,b);
    }
  }
  im.updatePixels();
  return im;
}

PImage Shit2(PImage im){
  im.loadPixels();
  for(int x = 0; x < im.width; x++){
    for(int y = 0; y < im.height; y++){
      int r =(int)(255*tan(red( im.pixels[x+y*im.width])/255.0*(2*PI)));
      int g =(int)(255*tan(green( im.pixels[x+y*im.width])/255.0*(2*PI)));
      int b =(int)(255*tan(blue( im.pixels[x+y*im.width])/255.0*(2*PI)));
      
      im.pixels[x+y*im.width]= color(r,g,b);
    }
  }
  im.updatePixels();
  return im;
}