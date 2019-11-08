int[] selected_card = {1,2,3,4,5};

class Chara{
  float x,y,wid,hei;
  Chara(float x, float y, float w, float h){ this.x = x; this.y = y; this.wid = w; this.hei = h; }
  void display(){
    animate_skill(this.x,this.y,this.wid,this.hei);
    trail();
  }  
  void trail(){
    
  }
}

class Chunk{
  float x,y,ii,velocity, delta = 0;
  float level;
  PImage[] imgarray;
  Chunk(float ii, float il, PImage img){
    // il i the altitude of chunk
    this.ii = ii; 
    //level = il;
    float rand = random(0,100);
    if(( 0 <= rand )&& ( rand < 80))   { this.level = il; }
    if(( 80 <= rand )&& ( rand < 90))  { this.level = il + floor_delta; }
    if(( 90 <= rand )&& ( rand < 100)) { this.level = il - floor_delta; }
    if(level <= 1){ level = 2; }
    if(level >= 6){ level = 5; }
    x = (gridsize)*(ii-1) - delta; 
    y = gridsize*(y_grid-floor_level);
    imgarray = new PImage[int(chunk_size*(ceil(level+2)))];
    for(int i =0; i<imgarray.length; i++){ imgarray[i] = img.get(floor(random(0,2))*32,floor(random(0,2))*32,32,32);
    
  }
  }
  void display(){
    for(int j = 0; j < level+2; j++ ){
      for(int i = 0; i < ceil(chunk_size); i++){
        image(imgarray[i+chunk_size*j], this.x+i*gridsize, this.y+j*gridsize,gridsize,gridsize);
      }
    }
  }
  void update(){
    this.x = gridsize*(ii-1-delta); 
    this.y = gridsize*(y_grid-level);
    this.delta = this.delta + vel;
    display();
  }
}

class Card {
      float x, y, wid, hei;
      int num;
      PImage img;
      
      Card(float ix,float iy,float iw, float ih, int inum){
        x = ix; y = iy; wid = iw; hei = ih; num = inum;  }
        
      void check(){
        if((mouseX-x_margin>x-wid/2)&&(mouseX-x_margin<x+wid/2)&&(mouseY-y_margin>y-hei/2)&&(mouseY-y_margin<y+hei/2)){
          if (release == true) { release = false;  }
          release = false; }  }
      void display(){
        //image(img,x,y,wid,hei);
        fill(255); stroke(0); strokeWeight(5);
        rect(x,y,wid,hei*0.96);
        fill(0);
        check();}
}
