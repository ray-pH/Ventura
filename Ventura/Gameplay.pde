Chara chara;
float floor_level = 3;
float vel = 0.25;
float floor_delta = 0.5;
float charposx = 2;
int   ground = 1;
Chunk[] chunkarray = new Chunk[0];

void game(){
  //create new character
  
  
  chara = new Chara(charposx*gridsize,gridsize*(y_grid-1-floor_level),1*gridsize,1*gridsize);
  terrain(); 
  cards_mobile();
  chara.display();
}

void terrain(){
  
  //if there is no chunk, create array and populate with chunks
  if(chunkarray.length == 0){
    chunkarray = new Chunk[ceil(x_grid/chunk_size)+2];
    for(int i = 0; i < chunkarray.length; i++){ chunkarray[i] = new Chunk(i*chunk_size,3,stone_block); }
  }
  
  
  //if number of chunk is greater than max, remove the first one and slide index i.e. n -> n-1 
  if( chunkarray[chunkarray.length-1].delta > chunk_size ){
    for(int i = 0; i < chunkarray.length-1; i++){ chunkarray[i] = chunkarray[i+1]; }
    float xipos = (chunk_size)*(chunkarray.length-1);
    float prev_level = chunkarray[chunkarray.length-2].level;
    chunkarray[chunkarray.length-1] = new Chunk(xipos,prev_level,stone_block);
  }
  
  //upadte all
  for(Chunk c : chunkarray){ c.update(); }
  
  
  
  //set player floor level equals to the chunk underneath the player
  floor_level = chunkarray[1].level;
  
  
  //debug
  if(showfloor){fill(100,255,20,80);rect(chunkarray[ground].x,chunkarray[ground].y,chunk_size*gridsize,height);}
  
  noStroke(); fill(0);
  rect(-x_margin,-y_margin,x_margin,height);         //left margin
  rect(gridsize*x_grid,-y_margin,2*x_margin,height); //right margin
  
}

void cards_mobile(){
  float card_width = y_grid*gridsize/total_card;
  Card[] cards = new Card[total_card];
  for( int i = 0; i < total_card; i++ ){
    cards[i] = new Card(gridsize*(x_grid-2),i*card_width,gridsize*2+x_margin,card_width,selected_card[i]);
  }
  for( int i = 0; i < total_card; i++ ){
    cards[i].display();
  }
}
