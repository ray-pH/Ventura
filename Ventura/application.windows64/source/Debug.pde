boolean showfloor = true;

void debug(){
  fill(255);
  text("vel = " + vel,gridsize,gridsize);
  text("showfloor = "+showfloor,gridsize,gridsize+12);
}

void keyPressed(){
 if(key=='o'){ vel = vel-0.05; } 
 if(key=='p'){ vel = vel+0.05; }
 if(key=='l'){ showfloor = !showfloor; }
}