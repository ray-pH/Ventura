PImage nan;
PImage chara_img;
PImage char_skill_slash;
PImage effect_skill_slash;
PImage stone_block, stone_stair;
PImage weap_sword_basic;


void load_sprites(){
  nan        = loadImage("sprites/nan.png");
  
  chara_img = loadImage("sprites/chars.png");
  stone_block = loadImage("sprites/stone_block.png");
  stone_stair = loadImage("sprites/stone_stair.png");
  
  weap_sword_basic = loadImage("sprites/weap_sword_basic.png");
  
  weap_sword_basic = loadImage("sprites/weap_sword_basic.png");
  
  char_skill_slash = loadImage("sprites/char_skill_slash.png");
  effect_skill_slash = loadImage("sprites/skill_slash.png");
}

void edit_palette(color col){
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if (pixels[i] == color(255)) { 
      pixels[i] = Aqua;   
    }
  }
  updatePixels();
}