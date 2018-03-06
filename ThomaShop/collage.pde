class collage{
 PImage img;
 PImage img1;
 PImage img2;
 PImage img3;
 String Input;
  
 collage(String in){
   Input = in;
   
   img = loadImage(Input);
   img1 =createImage(img.width,img.height,RGB);
   img2 =createImage(img.width,img.height,RGB);
   img3 =createImage(img.width,img.height,RGB);
   
  img.loadPixels();
  for(int x = 0; x < img.width; x++){
    for(int y = 0; y < img.height; y++){
      int r =(int)(255*sin(red( img.pixels[x+y*img.width])/255.0*(2*PI)));
      int g =(int)(255*sin(green( img.pixels[x+y*img.width])/255.0*(2*PI)));
      int b =(int)(255*sin(blue( img.pixels[x+y*img.width])/255.0*(2*PI)));
      
      img1.pixels[x+y*img.width]= color(r,g,b);
      
       r =(int)(255*cos(red( img.pixels[x+y*img.width])/255.0*(2*PI)));
       g =(int)(255*cos(green( img.pixels[x+y*img.width])/255.0*(2*PI)));
       b =(int)(255*cos(blue( img.pixels[x+y*img.width])/255.0*(2*PI)));
      
      img2.pixels[x+y*img.width]= color(r,g,b);
      
       r =(int)(255*tan(red( img.pixels[x+y*img.width])/255.0*(2*PI)));
       g =(int)(255*tan(green( img.pixels[x+y*img.width])/255.0*(2*PI)));
       b =(int)(255*tan(blue( img.pixels[x+y*img.width])/255.0*(2*PI)));
      
      img3.pixels[x+y*img.width]= color(r,g,b);
      }
    }
  }
  void drawcollage(){
    image(img, 0, 0, width/2, height/2);
    image(img1, 0, height/2, width/2, height/2);
    image(img2, width/2, 0, width/2, height/2);
    image(img3, width/2, height/2, width/2, height/2);
    fancystuff();
  }
  
  void fancystuff(){
    noStroke();
    colorMode(HSB,255);
 
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
  }
  void savemycollage(){
    saveFrame("NiceCollage"+Input);
  }
  
  
 }
  
  
  
  