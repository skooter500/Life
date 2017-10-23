void setup()
{
  //size(600, 600);
  fullScreen();
  board = new ColourBoard(400);
  frameRate(20);
}

ColourBoard board;
void draw()
{
  background(0);
  board.render();
  board.update();
}

void keyPressed()
{
  if (key == ' ')
  {
    board.reset();
  }
  if (key == '1')
  {
    board.randomise();
  }
  if (key == '2')
  {
    board.lines();
  }
  if (key == '3')
  {
    board.lines1();
  }
}

void mouseDragged()
{
  if (mouseX >= width || mouseY >= height || mouseX < 0 || mouseY < 0)
  {
    return;
  }
  int col = (int) map(mouseX, 0, width, 0, board.size-1);
  int row = (int) map(mouseY, 0, height, 0, board.size-1);
  board.current[row][col] = board.RandomColor();
}