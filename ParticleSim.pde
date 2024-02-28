ArrayList <Body> celestialArray = new ArrayList <Body>();
MenuButton John;
GravityButton Margaret;
ElectricityButton Adam;
DecayButton Blorbo;
NuclearButton Bill;
double Grav = 0.001;
double Elec = 0.0001;
double Nuke = 0.1;
String[] bodyType = new String[]{"Star", "Planet", "Moon", "Proton", "Neutron", "Electron"};
int bodyIndex = 0;
double startVelocityX = 0;
double startVelocityY = 0;
boolean isPaused = false;
boolean menuOpened = false;
boolean doesDecay = false;

void setup()
{
  John = new MenuButton();
  Margaret = new GravityButton();
  Adam = new ElectricityButton();
  Blorbo = new DecayButton();
  Bill = new NuclearButton();
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
  if(menuOpened)
  {
    fill(80);
    strokeWeight(2);
    stroke(220);
    rect(200,100,600,700);
    rect(450, 80, 100, 20);
    fill(240);
    text("Paused", 475, 93);
    Margaret.show();
    Adam.show();
    Blorbo.show();
    Bill.show();
  } else
  {
    celestialArray.get(a).move();
    celestialArray.get(a).accelerate(a);
    celestialArray.get(a).decay();
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
      //System.out.println(a);
      //System.out.println(celestialArray.size());
      celestialArray.remove(a);
    }
  }
  }
 
  fill(255);
John.show();
  text("Celestial Body: " + bodyType[bodyIndex], 0,20);
  text("Initial X-Velocity: " + startVelocityX, 0, 30);
  text("Initial Y-Velocity: " + startVelocityY, 0, 40);
  text("Mouse Coordinates: " + mouseX +", " + mouseY, 0, 50);
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
 if(John.wasClicked())
 {}else
 {
  if(menuOpened)
  {
   if(Margaret.wasClicked())
   {} else if(Adam.wasClicked())
   {} else if(Blorbo.wasClicked())
   {}
  } else
  {
   boolean isSameSpot = false;
   for(int i =0; i < celestialArray.size(); i++)
   {
     if((abs((float)(celestialArray.get(i).getX() - mouseX)) < celestialArray.get(i).getDiameter()) && (celestialArray.get(i).getDiameter()> abs((float)(celestialArray.get(i).getY() - mouseY))))
     {
       isSameSpot = true;
     }
   }
   if(!isSameSpot)
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
    } else if(bodyType[bodyIndex] == "Proton")
    {
     celestialArray.add(new Proton());
    } else if(bodyType[bodyIndex] == "Neutron")
    {
     celestialArray.add(new Neutron());
    } else if(bodyType[bodyIndex] == "Electron")
    {
     celestialArray.add(new Electron());
    }
    //System.out.println(celestialArray.size());
    for(int i =0; i < celestialArray.size(); i++)
    {
      //System.out.print(celestialArray.get(i).getX() + ", " + celestialArray.get(i).getY() + " | ");
    }
    ////System.out.println("");
    }
  }
 }
}
