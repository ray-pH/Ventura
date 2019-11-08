void animate(PImage[] imgarray, float animtime, float x, float y, float wid, float hei){
  PImage displayed = imgarray[1];
  float cphase = time%animtime;
  float ttime = animtime;
  for( int i = 0; i < imgarray.length; i++ ){
    if ((ttime*i/(imgarray.length)<=cphase)&&(cphase<=ttime*(i+1)/(imgarray.length))){ displayed = imgarray[i];  }
  }
  image(displayed,x,y,wid,hei);
}

void load_anim(PImage[] imgar, PImage img, int initx, int ix, int iy){
 for( int i = 0; i < img.width/ix-2; i++ ){
    imgar[i] = img.get(initx+i*ix,0,ix,iy) ; 
  } 
}


PImage[] running_anim = new PImage[6];

void load_animations(){
  load_anim(running_anim,chara_img,32,32,32);
}