Chara chara;
float floor_level = 3;
float vel = 0.4;
float floor_delta = 1;
Chunk[] chunkarray = new Chunk[0];

void game(){
  chara = new Chara(2*gridsize,gridsize*(y_grid-1.5-floor_level),1.5*gridsize,1.5*gridsize);
  terrain(); cards_mobile();
  chara.display();
}

void terrain(){
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

void cards_mobile(){
  float card_width = y_grid*gridsize/total_card;
  Card[] cards = new Card[total_card];
  for( int i = 0; i < total_card; i++ ){
    cards[i] = new Card(gridsize*(x_grid-4),i*card_width,gridsize*4+x_margin,card_width,selected_card[i]);
  }
  for( int i = 0; i < total_card; i++ ){
    cards[i].display();
  }
}