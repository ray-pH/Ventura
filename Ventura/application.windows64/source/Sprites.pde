PImage nan;
PImage chara_img;
PImage stone_block, stone_stair;


void load_sprites(){
  nan        = loadImage("sprites/nan.png");
  
  chara_img = loadImage("sprites/chars.png");
  stone_block = loadImage("sprites/stone_block.png");
  stone_stair = loadImage("sprites/stone_stair.png");
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