PImage EdgeDet(String in){
PImage im;
PImage res;
String Input=in;

  im = loadImage(Input);
  res=createImage(im.width,im.height,RGB);
  im.loadPixels();
  im.filter(GRAY);
  
  for(int x = 2; x < im.width-2; x++){
  for(int y = 2; y < im.height-2; y++){
      int c =(int)red(im.pixels[x+y*im.width-2])+(int)red(im.pixels[x+y*im.width-1])-(int)red(im.pixels[x+y*im.width+1])-(int)red(im.pixels[x+y*im.width+2]);
      int d =0;
      int e=(int)red(im.pixels[x+(y-2)*im.width])+(int)red(im.pixels[x+(y-1)*im.width])-(int)red(im.pixels[x+(y+1)*im.width])-(int)red(im.pixels[x+(y+2)*im.width]);
      
       c=(int)(255*sin(c/255.0*PI/2));//comment out these two lines to get a less bright image
       e=(int)(255*sin(e/255.0*PI/2));//
     
     if( c<0){
       d=-c;
       c=0;
      }
     if(e<0){
       e=-e; 
     }


     res.pixels[x+y*im.width]= color(c,d,e);
    }
  }
  res.updatePixels();
return res;
  
}
  
  
  
  