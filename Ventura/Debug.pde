boolean showfloor = false;

void debug(){
  fill(255);
  text("vel = " + vel,gridsize,gridsize);
  text("showfloor = "+showfloor,gridsize,gridsize+12);
  float delta = chunkarray[chunkarray.length-1].x-chunkarray[chunkarray.length-2].x-chunk_size*gridsize;
  text("delta = "+delta,gridsize,gridsize+24);
  text("delta by gridsize = "+delta/gridsize,gridsize,gridsize+36);
  text("gridsize = "+gridsize,gridsize,gridsize+48);
}

void keyPressed(){
 if(key=='o'){ vel = vel-0.05; } 
 if(key=='p'){ vel = vel+0.05; }
 if(key=='l'){ showfloor = !showfloor; }
 
 if(key=='q'){ skill_slash(); }
}