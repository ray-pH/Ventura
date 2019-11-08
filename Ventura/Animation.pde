void animate(PImage[] imgarray, float animtime, float x, float y, float wid, float hei){
  PImage displayed = imgarray[1];
  float cphase = time%animtime;
  float ttime = animtime;
  for( int i = 0; i < imgarray.length; i++ ){
    if ((ttime*i/(imgarray.length)<=cphase)&&(cphase<=ttime*(i+1)/(imgarray.length))){ displayed = imgarray[i];  }
  }
  image(displayed,x,y,wid,hei);
}

boolean animate_skill(PImage[] imgarray, float animtime, float x, float y, float wid, float hei){
  PImage displayed = imgarray[1];
  float cphase = skanimtime%animtime;
  float ttime = animtime;
  for( int i = 0; i < imgarray.length; i++ ){
    if ((ttime*i/(imgarray.length)<=cphase)&&(cphase<=ttime*(i+1)/(imgarray.length))){ displayed = imgarray[i];  }
  }
  image(displayed,x,y,wid,hei);
  if(skanimtime<=animtime){ return true; }
  return false; 
}

void load_anim(PImage[] imgar, PImage img, int initx, int ix, int iy){
 for( int i = 0; i < imgar.length ; i++ ){
    imgar[i] = img.get(initx+i*ix,0,ix,iy) ; 
  } 
}


PImage[] running_anim = new PImage[6];
PImage[] weapon_anim = new PImage[6];
PImage[] skill_slash_char_anim = new PImage[6];
PImage[] skill_slash_effect_anim = new PImage[6];

void load_animations(){
  load_anim(running_anim,chara_img,32,32,32);
  load_anim(weapon_anim,weapon,32,32,32);
  load_anim(skill_slash_char_anim,char_skill_slash,0,64,32);
  load_anim(skill_slash_effect_anim,effect_skill_slash,0,64,32);
}