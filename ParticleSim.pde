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
