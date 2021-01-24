void setup()
{
  //size(600, 600);
  fullScreen();
  board = new ColorBoard(1, 10000);
  colorMode(HSB);
  frameRate(20);
}

ColorBoard board;
void draw()
{
  background(0);
  board.render();
}

void keyPressed()
{
  
  PVector cell = board.screenToCell(mouseX, mouseY);
    
  if (keyCode == ' ')
  {
    board.paused = ! board.paused;
  }
  
  if (keyCode == '1')
  {
    board.makeGosperGun((int) cell.x, (int) cell.y);
  }
  
  if (keyCode == '2')
  {
    board.makeLightWeightSpaceShip((int) cell.x, (int) cell.y);
  }
  
  if (keyCode == '3')
  {
    board.makeTumbler((int) cell.x, (int) cell.y);
  }
  
  if (keyCode == '4')
  {
    board.makeGlider((int) cell.x, (int) cell.y);
  }
  
  if (keyCode == 'R')
  {
      
      board.randomise();
  }
  
  if (keyCode == 'C')
  {
      
      lifeBoard.clear();
  }
}

void mouseDragged()
{
  /*if (mouseX >= width || mouseY >= height || mouseX < 0 || mouseY < 0)
  {
    return;
  }*/
  int col = (int) map(mouseX, 0, width, 0, board.boardWidth-1);
  int row = (int) map(mouseY, 0, height, 0, board.boardHeight-1);
  
  board.board[row][col] = random(255);
  println(row + " " + col);
}
