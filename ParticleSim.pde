ArrayList <Body> celestialArray = new ArrayList <Body>();
double Grav = 0.001;
String[] bodyType = new String[]{"Star", "Planet", "Moon"};
int bodyIndex = 0;
double startVelocityX = 0;
double startVelocityY = 0;
boolean isPaused = false;

void setup()
{
  //frameRate(10);
  size(1000,1000);
  background(0,0,0);
}

void draw()
{
  background(0,0,0);
  stroke(255);
  line(mouseX,mouseY,mouseX + ((float)startVelocityX * 50),mouseY + ((float)startVelocityY * 50));
 
  for(int a = 0; a < celestialArray.size(); a++)
  {
  celestialArray.get(a).show();
  if(isPaused == false)
  {
    celestialArray.get(a).move();
    celestialArray.get(a).accelerate(a);
    //System.out.println(celestialArray.get(a).getVelocityX());
    for(int i = 0; i < celestialArray.size(); i++)
    {
      if(i != a)
      {
        if(celestialArray.size() > 1)
        {
          if(dist((float)celestialArray.get(a).getX(),(float)celestialArray.get(a).getY(),(float)celestialArray.get(i).getX(),(float)celestialArray.get(i).getY()) <= ((float)celestialArray.get(a).getDiameter() / 2) + ((float)celestialArray.get(i).getDiameter() / 2))
          {
            double tempX1, tempY1, tempX2, tempY2;
            tempX1 = celestialArray.get(a).contact(celestialArray.get(i), true);
            tempY1 = celestialArray.get(a).contact(celestialArray.get(i), false);
            tempX2 = celestialArray.get(i).contact(celestialArray.get(a), true);
            tempY2 = celestialArray.get(i).contact(celestialArray.get(a), false);
            celestialArray.get(a).setVelocityX(tempX1);
            celestialArray.get(a).setVelocityY(tempY1);
            celestialArray.get(i).setVelocityX(tempX2);
            celestialArray.get(i).setVelocityX(tempY2);
            for(int j = 0; j < 5; j++)
            {
              celestialArray.get(a).move();
              celestialArray.get(i).move();
            }
          }
        }
      }
    }
    if(celestialArray.get(a).delete() == true)
    {
      System.out.println(a);
      System.out.println(celestialArray.size());
      celestialArray.remove(a);
    }
  }
  }
 
  fill(255);
  text("Celestial Body: " + bodyType[bodyIndex], 0,20);
  text("Initial X-Velocity: " + startVelocityX, 0, 30);
  text("Initial Y-Velocity: " + startVelocityY, 0, 40);
  text("Mouse Coordinates: " + mouseX +", " + mouseY, 0, 50);
}

class Body
{
  protected double myX, myY;
  protected double myVelocityX, myVelocityY;
  protected double myMass, myDiameter;
  protected boolean outOfBounds = false;
  public Body()
  {
  myMass = 10000;
  myX = width * Math.random();
  myY = height * Math.random();
  myVelocityX = 0;
  myVelocityY = 0;
  myDiameter = 4;
  }
  public Body(double x,double y)
  {
  myMass = 10000;
  myX = x;
  myY = y;
  myVelocityX = 0;
  myVelocityY = 0;
  myDiameter = 4;
  }
  public void show()
  {
  ellipse((float)myX,(float)myY,(float)myDiameter,(float)myDiameter);
  }
 
  public void move()
  {
  myX += myVelocityX;
  myY += myVelocityY;
  System.out.println(myX + ", " + myY + ", " + myVelocityX + ", " + myVelocityY);
  if(myX > width)
  {
    outOfBounds = true;
  } else if (myX < 0)
  {
    outOfBounds = true;
  }
  if(myY > height)
  {
    outOfBounds = true;
  } else if (myY < 0)
  {
    outOfBounds = true;
  }
  }
 
  public double contact(Body conObj, boolean XorY)
  {
   double myAngle = atan((float)( myVelocityY / myVelocityX));
   double conAngle = atan((float)((myY - conObj.getY()) / (myX - conObj.getX())));
   if ((myX - conObj.getX()) < 0)
   {
     conAngle += PI;
   }
   if (myVelocityX < 0)
   {
     myAngle += PI;
   }
   double momentum = (((cos((float)(myAngle - conAngle)) * Math.sqrt((myVelocityX * myVelocityX) + (myVelocityY * myVelocityY)) * (myMass - conObj.getMass()))) + (2 * conObj.getMass() *  Math.sqrt((conObj.getVelocityX() * conObj.getVelocityX()) + (conObj.getVelocityY() * conObj.getVelocityY())) * cos((float)(acos((float)(conObj.getVelocityX()/ Math.sqrt((conObj.getVelocityY() * conObj.getVelocityY()) + (conObj.getVelocityX() * conObj.getVelocityX()))))
 - conAngle)))) / (myMass + conObj.getMass());
   double tempVX = (momentum * cos((float)conAngle)) + (Math.sqrt((myVelocityX * myVelocityX) * (myVelocityY * myVelocityY)) * sin((float)(myAngle - conAngle)) * cos((float)(conAngle + (PI/2))));
   double tempVY = (momentum * sin((float)conAngle)) + (Math.sqrt((myVelocityX * myVelocityX) * (myVelocityY * myVelocityY)) * sin((float)(myAngle - conAngle)) * sin((float)(conAngle + (PI/2))));
   if(XorY)
   {
     return tempVX;
   } else
   {
     return tempVY;
   }
  }
  public void accelerate(int index)
  {
  double netAccelerationX = 0;
  double netAccelerationY = 0;
  for(int a = 0; a < celestialArray.size(); a++)
  {
    if(a == index)
    {
      a++;
    }
    if(a != celestialArray.size())
    {
      double distance = dist((float)myX,(float)myY,(float)celestialArray.get(a).getX(),(float)celestialArray.get(a).getY());
      double deltaY = myY - celestialArray.get(a).getY();
      double deltaX = myX - celestialArray.get(a).getX();
      double angleBetween = Math.atan(deltaY/deltaX);
      if(deltaX == 0)
      {
        deltaX = 1;
      }
      if(deltaX < 0)
      {
        if(deltaY > 0)
        {
          angleBetween += PI;
        } else
        {
          angleBetween -= PI;
        }
      }
      netAccelerationX += ((Grav * celestialArray.get(a).getMass()) / (distance * distance)) * Math.cos(angleBetween);
      netAccelerationY += ((Grav * celestialArray.get(a).getMass()) / (distance * distance)) * Math.sin(angleBetween);
      //System.out.println("net acc " + netAccelerationX);
    }
  }
  myVelocityX -= netAccelerationX / frameRate;
  myVelocityY -= netAccelerationY / frameRate;
  }
 
 
  //getters
  public double getX()
  {
  return myX;
  }
  public double getY()
  {
  return myY;
  }
  public double getVelocityX()
  {
  return myVelocityX;
  }
  public double getVelocityY()
  {
  return myVelocityY;
  }
  public double getMass()
  {
  return myMass;
  }
  public double getDiameter()
  {
  return myDiameter;
  }
  public boolean delete()
  {
  return outOfBounds;
  }
 
  //setters
  public void setVelocityX(double newVX)
  {
  myVelocityX = newVX;
  }
  public void setVelocityY(double newVY)
  {
  myVelocityY = newVY;
  }
}

class Star extends Body
{
  public Star()
  {
  myMass = 10000000;
  myX = mouseX;
  myY = mouseY;
  myDiameter = 20;
  myVelocityX = startVelocityX;
  myVelocityY = startVelocityY;
  }
  public void show()
  {
  noStroke();
  fill(242, 224, 24);
  super.show();
  }
}

class Planet extends Body
{
  public Planet()
  {
  myMass = 50000;
  myX = mouseX;
  myY = mouseY;
  myDiameter = 10;
  myVelocityX = startVelocityX;
  myVelocityY = startVelocityY;
  }
  public void show()
  {
  noStroke();
  fill(20, 186, 227);
  super.show();
  }
}

class Moon extends Body
{
  public Moon()
  {
  myMass = 10;
  myX = mouseX;
  myY = mouseY;
  myDiameter = 4;
  myVelocityX = startVelocityX;
  myVelocityY = startVelocityY;
  }
  public void show()
  {
  noStroke();
  fill(162, 165, 166);
  super.show();
  }
}

void keyPressed()
{
  if (key == 'q')
  {
  if (bodyIndex < bodyType.length - 1)
  {
    bodyIndex++;
  } else
  {
    bodyIndex = 0;
  }
  }
 
  if(key == 'e')
  {
  startVelocityY = 0;
  startVelocityX = 0;
  }
 
  if(key == 'w')
  {
  startVelocityY -= 0.02;
  } else if (key == 's')
  {
  startVelocityY += 0.02;
  }
 
  if(key == 'a')
  {
  startVelocityX -= 0.02;
  } else if(key == 'd')
  {
  startVelocityX += 0.02;
  }
 
  if(key == ' ')
  {
  if(isPaused)
  {
    isPaused = false;
  } else
  {
    isPaused = true;
  }
  }
}

void mousePressed()
{
  if(bodyType[bodyIndex] == "Star")
  {
  celestialArray.add(new Star());
  } else if(bodyType[bodyIndex] == "Planet")
  {
  celestialArray.add(new Planet());
  } else if(bodyType[bodyIndex] == "Moon")
  {
  celestialArray.add(new Moon());
  }
  System.out.println(celestialArray.size());
  for(int i =0; i < celestialArray.size(); i++)
  {
    System.out.print(celestialArray.get(i).getX() + ", " + celestialArray.get(i).getY() + " | ");
  }
  System.out.println("");
}
