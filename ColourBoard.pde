class ColourBoard
{
  color[][] current;
  color[][] next;
  
  int size;
  
  float cellSize;
  
  ColourBoard(int size)
  {
    this.size = size;
    current = new color[size][size];
    next = new color[size][size];
    cellSize = width / (float) size;
    colorMode(HSB, 255);
    //randomise();
  }
  
  void lines()
  {
    for(int row = 0 ; row < size ; row ++)
    {
      current[row][(int) (size * 0.2)] = RandomColor();
      current[row][(int) (size * 0.8)] = RandomColor();
    }
  }
  void lines1()
  {
    for(int col = 0 ; col < size ; col ++)
    {
      current[(int) (size * 0.2)][col] = RandomColor();
      current[(int) (size * 0.8)][col] = RandomColor();
    }
  }
  
  void render()
  {
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        if (current[row][col] != 0)
        {
          fill(current[row][col]);
        }
        else
        {
          fill(0);
        }
        float x = map(col, 0, size, 0, width);
        float y = map(row, 0, size, 0, height);
        rect(x, y, cellSize, cellSize);
      }
    }
  }
  
  void randomise()
  {
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        int dice = (int) random(0, 2);
        /*if (dice == 1)
        {
          current[row][col] = true;
        }
        */
        current[row][col] = (dice == 1) ? RandomColor() : 0;
      }
    }
  }
  
  color RandomColor()
  {
    //return color(random(0, 255), random(0, 255), random(0, 255));
    return color(random(100, 200), 255, 255);
  }
  
  // Methods for you guys to implement! 
  // Return true if the cell at row and col is true
  // Do bounds checking in this method to make sure row and col
  // Have valid ranges
  boolean isAlive(int row, int col)
  {
    if (row < 0 || row >= size || col < 0 || col >= size)
    {
      return false;
    }
    else
    {
      return (current[row][col] != 0);
    }
  }
  
  // Count the number of live cells around row and col
  // and return it
  // You can use the method above
  // This could be a nested loop
  int countLiveCellsAround(int row, int col)
  {
    int count = 0;
    for(int r = row - 1 ; r <= row + 1 ; r ++)
    {
      for(int c = col - 1 ; c <= col + 1 ; c ++)
      {
        if (! (r == row && c == col) && isAlive(r, c))
        {
          count ++;
        }
      }
    }
    return count;
  }
  
  // This method should apply the rules to each cell
  // Dont forget to use the current board to do the calculations
  // but update the next board
  // Then swap them
  // Also dont forget to call this method from draw() in the main sketch
  void update()
  {
    noStroke();
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        int count = countLiveCellsAround(row, col);
        if (isAlive(row, col))
        {
          if (count == 2 || count == 3)
          {
            next[row][col] = current[row][col];
          }
          else
          {
            next[row][col] = 0;
          }
        }
        else
        {
          if (count == 3)
          {
            next[row][col] = AverageAround(row, col);
          }
          else
          {
            next[row][col] = 0;
          }
        }
      }
    }
    
    color[][] temp;
    temp = current;
    current = next;
    next = temp;
    
  }
  
  void reset()
  {
    for(int r = 0 ; r < size ; r ++)
    {
      for(int c = 0 ; c < size ; c ++)
      {
        current[r][c] = 0;
      }
    }
  }
  
  color AverageAround(int row, int col)
  {
    float red = 0, green = 0, blue = 0;
    float hue = 0;
    for(int r = row - 1 ; r <= row + 1 ; r ++)
    {
      for(int c = col - 1 ; c <= col + 1 ; c ++)
      {
        if (isAlive(r, c))
        {
          hue += hue(current[r][c]);
          /*red += red(current[r][c]);
          green += green(current[r][c]);
          blue += blue(current[r][c]);
          */
        }
      }
    }
    //return color(red / 3.0, green / 3.0, blue / 3.0);
    return color(hue / 3.0, 255, 255);
  }
  
}