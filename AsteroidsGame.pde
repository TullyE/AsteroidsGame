//current issue:
/**
 *STORING ASTEROIDS/BULLETS IN A MOVINGFLOATER CLASS AND THEY'RE NOT KEEPING THEIR METHODS THEY GET FROM ASTERIODS
 *
 */
boolean accelerate = false;
boolean left = false;
boolean right = false;
Star[] starField = new Star[200];
ArrayList <Asteroid> asteriods = new ArrayList <Asteroid> ();
ArrayList <Bullet> bullets = new ArrayList <Bullet> ();
boolean shoot = false;
int playerHealth = 3;

Spaceship myS;
void setup()
{
  size(500, 500);
  myS = new Spaceship();
  starSetup();

  for (int i = 0; i < 5; i ++)
  {
    asteriods.add(new Asteroid(true, (int) (Math.random() * width), (int) (Math.random() * height)));
  }
}

void draw()
{
  background(0);
  if (playerHealth == 0)
  {
    text("YOU LOST", width/2, height/2);
    stop();
  }
  else if(asteriods.size() == 0)
  {
    text("YOU WIN", width/2, height/2);
    stop();
  }
  else
    {
    showStars();
    bulletCollision();
    removeBullets(bullets);
    removeAsteroids(asteriods);
    shipCollision();


    for (Asteroid a : asteriods)
    {
      noFill();
      strokeWeight(2);
      stroke(255);
      a.move();
      a.show();
    }

    for (Bullet b : bullets)
    {
      noFill();
      strokeWeight(2);
      stroke(255);
      b.show();
      b.move();
    }

    fill(255, 0, 0);
    stroke(255, 0, 0);
    myS.show();
    myS.move();
    if (accelerate)
    {
      myS.accelerate(.1);
    }
    if (right)
    {
      myS.turn(4);
    }
    if (left)
    {
      myS.turn(-4);
    }

    textSize(32);
    fill(255);
    text("Asteroids left: " + asteriods.size(), 0, 32);
    text("X : " + (int) myS.getX(), 0, 32 * 2);
    text("Y : " + (int) myS.getY(), 0, 32 * 3);
    text("X Speed: " +  (int) myS.getXSpeed(), 0, 32 * 4);
    text("Y Speed: " + (int) myS.getYSpeed(), 0, 32 * 5);
    text("Point Direction: " + myS.getPointDir(), 0, 32 * 6);
    text("Health: " + playerHealth, 0, 32 * 7);
  }
}

public void starSetup()
{
  for (int i = 0; i < starField.length; i ++)
  {
    starField[i] = new Star();
  }
}

public void showStars()
{
  for (Star s : starField)
  {
    s.show();
  }
}

public void randomizeStars()
{
  for (Star s : starField)
  {
    s.randomStar();
  }
}

public void removeBullets(ArrayList<Bullet> mF) //note that this should NOT be called in a for loop
{
  for (int i = mF.size()-1; i >=0; i--)
  {
    if (mF.get(i).getRemove())
    {
      mF.remove(i);
    }
  }
}

public void removeAsteroids(ArrayList<Asteroid> mF) //note that this should NOT be called in a for loop
{
  for (int i = mF.size()-1; i >= 0; i--)
  {
    if (mF.get(i).getRemove())
    {
      if (mF.get(i).isBig())
      {

        mF.add(new Asteroid(false, mF.get(i).getX(), mF.get(i).getY()));
        mF.get(mF.size()-1).setVel((Math.random() * mF.get(i).getXSpeed()) + (int) (Math.random() * 4)-2, (Math.random() * mF.get(i).getYSpeed()) + (int) (Math.random() * 4)-2);

        mF.add(new Asteroid(false, mF.get(i).getX(), mF.get(i).getY()));
        mF.get(mF.size()-1).setVel((Math.random() * mF.get(i).getXSpeed()) + (int) (Math.random() * 4)-2, (Math.random() * mF.get(i).getYSpeed()) + (int) (Math.random() * 4)-2);

        mF.remove(i);
      } else
      {
        mF.remove(i);
      }
    }
  }
}

public void bulletCollision()
{
  double bulletD;
  for (int asteroid = 0; asteroid < asteriods.size(); asteroid ++)
  {
    for (int bullet = 0; bullet < bullets.size(); bullet++)
    {
      bulletD = dist((float) bullets.get(bullet).getX(), (float) bullets.get(bullet).getY(), (float) asteriods.get(asteroid).getX(), (float) asteriods.get(asteroid).getY());

      if (bulletD < asteriods.get(asteroid).getSize() * 20)
      {
        bullets.get(bullet).setRemove(true);
        asteriods.get(asteroid).setRemove(true);
      }
    }
  }
}
public void shipCollision()
{
  double shipD;
  for (int asteroid = 0; asteroid < asteriods.size(); asteroid ++)
  {
    shipD = dist((float) myS.getX(), (float) myS.getY(), (float) asteriods.get(asteroid).getX(), (float) asteriods.get(asteroid).getY());
    if (shipD < asteriods.get(asteroid).getSize() * 20)
    {
      asteriods.get(asteroid).setRemove(true);
      playerHealth -= 1;
    }
  }
}

void keyPressed()
{
  if (keyCode == 38)
  {
    accelerate = true;
  }
  if (keyCode == 37)
  {
    left = true;
  }
  if (keyCode == 39)
  {
    right = true;
  }
  if (keyCode == 32)
  {
    if (shoot == false)
    {
      bullets.add(new Bullet(myS));
    }
    shoot = true;
  }
  
  if (key == 'h')
  {
    ship.setX(Math.random()*width);
    ship.setY(Math.random()*height);
    ship.setVel(0, 0);
  }
}

void keyReleased()
{
  if (keyCode == 38)
  {
    accelerate = false;
  }
  if (keyCode == 37)
  {
    left = false;
  }
  if (keyCode == 39)
  {
    right = false;
  }
  if (keyCode == 32)
  {
    shoot = false;
  }
}
