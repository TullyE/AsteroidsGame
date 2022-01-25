class myFloater extends Floater
{
  public void setX(double x)
  {
    this.myCenterX = x;
  }

  public void setY(double y)
  {
    this.myCenterY = y;
  }

  public double getX()
  {
    return this.myCenterX;
  }

  public double getY()
  {
    return this.myCenterY;
  }

  public color getColor()
  {
    return this.myColor;
  }

  public void moveRemove(ArrayList <movingFloater> mF) //note that this should NOT be called in a for loop
  {
    for (int i = mF.size()-1; i >=0; i--)
    {
      if (mF.get(i).getRemove())
      {
        mF.remove(i);
      }
    }
  }

  public void setVel(double xSpeed, double ySpeed)
  {
    this.myXspeed = xSpeed;
    this.myYspeed = ySpeed;
  }

  public double getXSpeed()
  {
    return this.myXspeed;
  }

  public double getYSpeed()
  {
    return this.myYspeed;
  }
  
  public double getPointDir()
  {
    return this.myPointDirection;
  }
}
