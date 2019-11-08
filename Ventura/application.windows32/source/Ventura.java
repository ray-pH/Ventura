import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Ventura extends PApplet {

int x_grid = 21;
int y_grid = 12;
int chunk_size = 5;
int gridsize;
float x_margin;
float y_margin;
float time;

boolean release = false;
int total_card = 5;
int[] selected_card = {1,2,3,4,5};

public void setup(){
  //size(displayWidth,displayHeight,P2D);
  //orientation(LANDSCAPE);
  
  surface.setResizable(true);
  screenratio(); 
  frameRate(60);
  load_sprites();
  load_animations();
}

public void draw(){
  screenratio();
  background(0);
  guidelines();
  //runline();
  game();
  time++;
  debug();
}

public void screenratio(){
  translate(x_margin,y_margin);
  gridsize = min(height/y_grid,width/x_grid);
  x_margin = (width-x_grid*gridsize)/2;
  y_margin = (height-y_grid*gridsize)/2;
}

public void mouseReleased() {
  release = true;
}


public void animate(PImage[] imgarray, float animtime, float x, float y, float wid, float hei){
  PImage displayed = imgarray[1];
  float cphase = time%animtime;
  float ttime = animtime;
  for( int i = 0; i < imgarray.length; i++ ){
    if ((ttime*i/(imgarray.length)<=cphase)&&(cphase<=ttime*(i+1)/(imgarray.length))){ displayed = imgarray[i];  }
  }
  image(displayed,x,y,wid,hei);
}

public void load_anim(PImage[] imgar, PImage img, int initx, int ix, int iy){
 for( int i = 0; i < img.width/ix-2; i++ ){
    imgar[i] = img.get(initx+i*ix,0,ix,iy) ; 
  } 
}


PImage[] running_anim = new PImage[6];

public void load_animations(){
  load_anim(running_anim,chara_img,32,32,32);
}
boolean showfloor = true;

public void debug(){
  fill(255);
  text("vel = " + vel,gridsize,gridsize);
  text("showfloor = "+showfloor,gridsize,gridsize+12);
}

public void keyPressed(){
 if(key=='o'){ vel = vel-0.05f; } 
 if(key=='p'){ vel = vel+0.05f; }
 if(key=='l'){ showfloor = !showfloor; }
}
Chara chara;
float floor_level = 3;
float vel = 0.4f;
float floor_delta = 1;
Chunk[] chunkarray = new Chunk[0];

public void game(){
  chara = new Chara(2*gridsize,gridsize*(y_grid-1.5f-floor_level),1.5f*gridsize,1.5f*gridsize);
  terrain(); cards_mobile();
  chara.display();
}

public void terrain(){
  if(chunkarray.length == 0){
    chunkarray = new Chunk[ceil(x_grid/chunk_size)+2];
    for(int i = 0; i < chunkarray.length; i++){ chunkarray[i] = new Chunk(i*chunk_size,3,stone_block); }
  }
  if( chunkarray[chunkarray.length-1].delta >= chunk_size - vel ){
    for(int i = 0; i < chunkarray.length-1; i++){ chunkarray[i] = chunkarray[i+1]; }
    chunkarray[chunkarray.length-1] = new Chunk(chunk_size*(chunkarray.length-1),chunkarray[chunkarray.length-2].level,stone_block);
  }
  for(int i = 0; i < chunkarray.length; i++){ chunkarray[i].update(); }
  floor_level = chunkarray[1].level;
  if(showfloor){fill(100,255,20,80);rect(chunkarray[1].x,chunkarray[1].y,chunk_size*gridsize,height);}
  
  noStroke(); fill(0);
  rect(-x_margin,-y_margin,x_margin,height);
  rect(gridsize*x_grid,-y_margin,2*x_margin,height);
  
}

public void cards_mobile(){
  float card_width = y_grid*gridsize/total_card;
  Card[] cards = new Card[total_card];
  for( int i = 0; i < total_card; i++ ){
    cards[i] = new Card(gridsize*(x_grid-4),i*card_width,gridsize*4+x_margin,card_width,selected_card[i]);
  }
  for( int i = 0; i < total_card; i++ ){
    cards[i].display();
  }
}
public void guidelines(){
  strokeWeight(1);
  stroke(200,50);
  
  int x = 0;
  for (int i = 0; i < x_grid+1 ; i = i+1) {
    line(x,0,x,gridsize*y_grid);
    x = x + gridsize;    
  }
  int y = 0;
  for (int i = 0; i < y_grid+1 ; i = i+1) {
    line(0,y,x_grid*gridsize,y);
    y = y + gridsize;    
  }
  
}

public void runline(){
  translate(-x_margin,-y_margin);
  float x1 = width-((time*20)%width);
  float x2 = width-((width/3+time*20)%width);
  float x3 = width-((2*width/3+time*20)%width);
  strokeWeight(3);
  stroke(255);
  line(x1,0,x1,height);
  line(x2,0,x2,height);
  line(x3,0,x3,height);
  translate(x_margin,y_margin);
}

public void gradient(){
  noStroke();
  float transparency = 90;
  fill(0,transparency);
  rect(-x_margin, gridsize*(y_grid-2.7f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-2.4f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-2.1f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-1.8f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-1.5f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-1.2f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-0.9f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-0.6f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-0.3f), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  //vertex(gridsize*(x_grid)+x_margin,gridsize*(y_grid-2.5));
}
class Chara{
  float x,y,wid,hei;
  Chara(float ix, float iy, float iw, float ih){ x = ix; y = iy; wid = iw; hei = ih; }
  public void display(){
    if(vel<=0){image(chara_img.get(0,0,32,32),x,y,1.5f*gridsize,1.5f*gridsize);}
    else{ animate(running_anim,30,x,y,wid,hei); }
    trail();
  }  
  public void trail(){
    
  }
}

class Chunk{
  float x,y,ii,velocity, delta = 0;
  float level;
  PImage[] imgarray;
  Chunk(float iii, float il, PImage img){ 
    ii = iii; 
    //level = il;
    float rand = random(0,100);
    if(( 0 <= rand )&& ( rand < 80)) { level = il; }
    if(( 80 <= rand )&& ( rand < 90)) { level = il+floor_delta; }
    if(( 90 <= rand )&& ( rand < 100)) { level = il-floor_delta; }
    if(level <= 1){ level = 2; }
    if(level >= 6){ level = 5; }
    x = (gridsize)*(ii-1)-delta; 
    y = gridsize*(y_grid-floor_level);
    imgarray = new PImage[PApplet.parseInt(chunk_size*(ceil(level+2)))];
    for(int i =0; i<imgarray.length; i++){ imgarray[i] = img.get(floor(random(0,2))*32,floor(random(0,2))*32,32,32);
    
  }
  }
  public void display(){
    for(int j = 0; j < level+2; j++ ){
      for(int i = 0; i < ceil(chunk_size); i++){
        image(imgarray[i+chunk_size*j],x+i*gridsize,y+j*gridsize,gridsize,gridsize);
      }
    }
  }
  public void update(){
    x = gridsize*(ii-1)-delta*gridsize; y = gridsize*(y_grid-level);
    delta = delta + vel;
    display();
  }
}

class Card {
      float x, y, wid, hei;
      int num;
      PImage img;
      
      Card(float ix,float iy,float iw, float ih, int inum){
        x = ix; y = iy; wid = iw; hei = ih; num = inum;  }
        
      public void check(){
        if((mouseX-x_margin>x-wid/2)&&(mouseX-x_margin<x+wid/2)&&(mouseY-y_margin>y-hei/2)&&(mouseY-y_margin<y+hei/2)){
          if (release == true) { release = false;  }
          release = false; }  }
      public void display(){
        //image(img,x,y,wid,hei);
        fill(255); stroke(0); strokeWeight(5);
        rect(x,y,wid,hei*0.96f);
        fill(0);
        check();}
}
int Aqua = color(51,102,255);
PImage nan;
PImage chara_img;
PImage stone_block, stone_stair;


public void load_sprites(){
  nan        = loadImage("sprites/nan.png");
  
  chara_img = loadImage("sprites/chars.png");
  stone_block = loadImage("sprites/stone_block.png");
  stone_stair = loadImage("sprites/stone_stair.png");
}

public void edit_palette(int col){
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if (pixels[i] == color(255)) { 
      pixels[i] = Aqua;   
    }
  }
  updatePixels();
}
  public void settings() {  size(1000,600,P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Ventura" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
