class Spaceship extends myFloater  
{   
  boolean power;
  Spaceship()
  {
    //super(corners, xCorners, yCorners, myColor, myCenterX, myCenterY, myXspeed, myYspeed, myPointDirection);
    this.corners = 4;
    this.xCorners = new int[corners];
    this.yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;

    xCorners[1] = 16;
    yCorners[1] = 0;

    xCorners[2] = -8;
    yCorners[2] = 8;

    xCorners[3] = -4;
    yCorners[3] = 0;

    this.myColor = color(255, 0, 0);
    this.myCenterX = width/2;
    this.myCenterY = height/2;
    this.myXspeed = 0.0;
    this.myYspeed = 0.0;
    this.myPointDirection = 0.0;
    this.power = false;
  }

  public void show()
  {
    point(0, 0);
    super.show();
    if (power)
    {
      drawPower();
    }
    this.power = false;
  }

  private void drawPower()
  {
    translate((float)myCenterX, (float)myCenterY);
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    rotate(dRadians);

    stroke(255, 255, 0);
    line(-9, -9, -16, -11);
    line(-9, 0, -16, 0);
    line(-9, 9, -16, 11);

    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }

  public void accelerate(double dAmount)
  {
    super.accelerate(dAmount);
    this.power = true;
  }
}
