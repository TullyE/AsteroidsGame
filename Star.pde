class Star //note that this class does NOT extend Floater
{
  private color[] colors = new color[]{color(255, 51, 51), 
    color(255, 153, 51), 
    color(255, 255, 51), 
    color(153, 255, 51), 
    color(51, 255, 51), 
    color(51, 255, 153), 
    color(51, 255, 255), 
    color(51, 153, 255), 
    color(51, 51, 255), 
    color(153, 51, 255), 
    color(255, 51, 255), 
    color(255, 51, 153)};  
  private int x;
  private int y;
  private int size;
  private color c;
  public Star()
  {
    this.x = (int) (Math.random() * width);
    this.y = (int) (Math.random() * height);
    this.size = (int) (Math.random() * 10);
    this.c = colors[(int) (Math.random() * 12)];
  }

  public void randomStar()
  {
    this.x = (int) (Math.random() * width);
    this.y = (int) (Math.random() * height);
    this.size = (int) (Math.random() * 10) + 10;
    this.c = colors[(int) (Math.random() * 12)];
  }

  public void show()
  {
    noStroke();
    fill(this.c, 200);
    ellipse(this.x, this.y, this.size, this.size);
  }

  public color getColor()
  {
    return this.c;
  }
}
