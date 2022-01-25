class Bullet extends movingFloater
{
  public Bullet(Spaceship theShip)
  {
    super();
    myCenterX = theShip.myCenterX;
    myCenterY = theShip.myCenterY;

    myPointDirection = theShip.myPointDirection;
    accelerate(3);
  }

  public void show()
  {
    ellipse((float) myCenterX, (float) myCenterY, 10, 10);
  }

  //public void collided(ArrayList<Asteroid> al)
  //{
  //  for(int i = al.size()-1; i >=0; i--)
  //  {
  //    double d = dist((float) al.get(i).getX(), (float) al.get(i).getY(), (float) this.myCenterX, (float) this.myCenterY);
  //    if(d < 20 * al.get(i).getSize())
  //    {
  //      al.get(i).setRemove(true);
  //      remove = true;
  //    }
  //  }
  //}

  public void move()
  {
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     
    int edge = 0;
    if (myCenterX > width - edge|| myCenterX < edge || myCenterY > height - edge || myCenterY < edge)
    {
      remove = true;
    }
  }
}
