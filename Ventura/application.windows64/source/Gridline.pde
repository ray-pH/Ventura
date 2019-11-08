void guidelines(){
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

void runline(){
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

void gradient(){
  noStroke();
  float transparency = 90;
  fill(0,transparency);
  rect(-x_margin, gridsize*(y_grid-2.7), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-2.4), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-2.1), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-1.8), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-1.5), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-1.2), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-0.9), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-0.6), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  rect(-x_margin, gridsize*(y_grid-0.3), (gridsize*x_grid)+2*x_margin,gridsize*y_grid);
  //vertex(gridsize*(x_grid)+x_margin,gridsize*(y_grid-2.5));
}