PImage img;

 
 float blur = 10.0;
 
 int blop = 52;
 int ths = 50;
 
 String Input = "Winta.jpg"; //Input Image has to be in the sketch folder
 
void setup() {
 size(600 ,800);
 background(0);
 
img = loadImage(Input);



}


void draw(){
Edge2(img);
//Blur(img);
  noLoop();
}

//INPUT: Picture
//OUTPUT: Saves Picture with edge detection
PImage Edge(PImage im){
  PImage res=createImage(im.width,im.height,RGB);
  im.loadPixels();
  im.filter(GRAY);
  for(int x = 0; x < im.width-3; x++){
    for(int y = 0; y < im.height; y++){
      int c =(int)red(im.pixels[x+y*im.width])+(int)red(im.pixels[x+y*im.width+1])-(int)red(im.pixels[x+y*im.width+2])-(int)red(im.pixels[x+y*im.width+3]);
      int d =0;
      int e =0;
      if(y< im.height-3){
      e=(int)red(im.pixels[x+y*im.width])+(int)red(im.pixels[x+(y+1)*im.width])-(int)red(im.pixels[x+(y+2)*im.width])-(int)red(im.pixels[x+(y+3)*im.width]);
      }
      c=(int)(255*sin(c/255.0*PI/2));
      e=(int)(255*sin(e/255.0*PI/2));
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
  image(res, 0,0, width, height);
  res.save("EdgeDetect"+Input);
  return res;
}
  //INPUT: Image
  //OUTPUT: Blurred Image, resized to window size and drawn directly on screen

void Blur(PImage im){
  
  
  
 im.resize(width,height);
 image(im, 0,0, width, height);
    
  for(int x = 0; x < width-1; x++){
    for(int y = 0; y < height; y++){
      color c = im.pixels[x+y*width];
      
      int n =(int)(red(c)+green(c)+blue(c));

        int lx= (int)((red(c)+green(c))/n*blur);
        int ly= (int) ((blue(c)/n*blur));
        stroke(red(c),green(c), blue(c),blop);
        line(x,y,x+lx,y+ly);

    }
  }
  
   saveFrame("Blured"+Input);
}

PImage Edge2(PImage im){
  PImage res=createImage(im.width,im.height,RGB);
  im.loadPixels();
  im.filter(GRAY);
  for(int x = 2; x < im.width-2; x++){
    for(int y = 2; y < im.height-2; y++){
      int c =(int)red(im.pixels[x+y*im.width-2])+(int)red(im.pixels[x+y*im.width-1])-(int)red(im.pixels[x+y*im.width+1])-(int)red(im.pixels[x+y*im.width+2]);
      int d =0;
      int e =0;
      //println((int)red(im.pixels[x+y*im.width-2])+"/"+(int)red(im.pixels[x+y*im.width-1])+"/"+(int)red(im.pixels[x+y*im.width+1])+"/"+(int)red(im.pixels[x+y*im.width+2])+"/"+c);
      e=(int)red(im.pixels[x+(y-2)*im.width])+(int)red(im.pixels[x+(y-1)*im.width])-(int)red(im.pixels[x+(y+1)*im.width])-(int)red(im.pixels[x+(y+2)*im.width]);
      
      //c=(int)(255*sin(c/255.0*PI/2));
      //e=(int)(255*sin(e/255.0*PI/2));
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
  image(res, 0,0, width, height);
  res.save("EdgeDetect2"+Input);
  return res;
}
