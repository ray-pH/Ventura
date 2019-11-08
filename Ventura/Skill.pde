boolean char_running = true;
String skill_do = "";

void animate_skill(float x, float y, float wid, float hei){
  if(char_running){
      if(vel<=0.00001){ 
        image(chara_img.get(0,0,32,32),x,y,1*gridsize,1*gridsize);
        image(weapon.get(0,0,32,32),x,y,1*gridsize,1*gridsize);
      } else { 
        animate(running_anim,30,x,y,wid,hei);
        animate(weapon_anim,30,x,y,wid,hei);
      }
    }
   else if(skill_do.equals("slash")){ 
     animate_skill(skill_slash_char_anim,8,x,y,wid*2,hei); 
     //animate_skill(skill_slash_effect_anim,15,x,y,wid*2,hei);
     if(!(animate_skill(skill_slash_effect_anim,8,x,y,wid*2,hei))){ skill_off(); };
     
   }
}

void skill_slash(){
  skanimtime = 0;
  char_running = false;
  skill_do = "slash";
}

void skill_off(){
  char_running = true;
  skill_do = "";
}