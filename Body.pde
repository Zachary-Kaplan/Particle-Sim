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
