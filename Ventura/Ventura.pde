int x_grid = 21;
int y_grid = 12;
int chunk_size = 4



;
int gridsize;
float x_margin;
float y_margin;
float time;
float skanimtime;

boolean release = false;
int total_card = 5;


void setup(){
  //size(displayWidth,displayHeight,P2D);
  //orientation(LANDSCAPE);
  size(1000,600,P2D);
  surface.setResizable(true);
  screenratio(); 
  frameRate(60);
  load_sprites();
  checkinv();
  load_animations();
}

void draw(){
  screenratio();
  background(0);
  guidelines();
  //runline();
  game();
  time++;
  skanimtime++;
  debug();
}

void screenratio(){
  translate(x_margin,y_margin);
  gridsize = min(height/y_grid,width/x_grid);
  x_margin = (width-x_grid*gridsize)/2;
  y_margin = (height-y_grid*gridsize)/2;
}

void mouseReleased() {
  release = true;
}
