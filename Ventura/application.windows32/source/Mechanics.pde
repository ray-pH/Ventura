class Chara{
  float x,y,wid,hei;
  Chara(float ix, float iy, float iw, float ih){ x = ix; y = iy; wid = iw; hei = ih; }
  void display(){
    if(vel<=0){image(chara_img.get(0,0,32,32),x,y,1.5*gridsize,1.5*gridsize);}
    else{ animate(running_anim,30,x,y,wid,hei); }
    trail();
  }  
  void trail(){
    
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
    imgarray = new PImage[int(chunk_size*(ceil(level+2)))];
    for(int i =0; i<imgarray.length; i++){ imgarray[i] = img.get(floor(random(0,2))*32,floor(random(0,2))*32,32,32);
    
  }
  }
  void display(){
    for(int j = 0; j < level+2; j++ ){
      for(int i = 0; i < ceil(chunk_size); i++){
        image(imgarray[i+chunk_size*j],x+i*gridsize,y+j*gridsize,gridsize,gridsize);
      }
    }
  }
  void update(){
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