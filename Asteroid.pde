class Asteroid extends movingFloater
{
  private double rotSpeed;
  private int astS;
  public Asteroid(boolean big, double x, double y)
  {    
    if (big)
    {
      astS = (int) (Math.random() * 3) + 2;
    } else
    {
      astS = 1;
    }
    this.rotSpeed = (int) (Math.random() * astS) + 2;
    this.corners = 6;
    this.xCorners = new int[corners];
    this.yCorners = new int[corners];

    xCorners[0] = -11 * astS;
    yCorners[0] = -8 * astS;

    xCorners[1] = 7 * astS;
    yCorners[1] = -8 * astS;

    xCorners[2] = 13 * astS;
    yCorners[2] = 0 * astS;

    xCorners[3] = 6 * astS;
    yCorners[3] = 10 * astS;

    xCorners[4] = -11 * astS;
    yCorners[4] = 8 * astS;

    xCorners[4] = -5 * astS;
    yCorners[4] = 0 * astS;

    this.myColor = color(255, 255, 255, 255);
    this.myCenterX = x;
    this.myCenterY =y;
    this.myXspeed = (int) (Math.random() * 2) + 1;
    this.myYspeed = (int) (Math.random() * 5) + 1;
    this.myPointDirection = 0.0;
  } 

  public void move()
  {
    turn(rotSpeed);
    super.move();
  }

  public int getSize()
  {
    return this.astS;
  }

  public boolean isBig()
  {
    return astS != 1;
  }
}
