class Planet extends Body
{
  public Planet()
  {
  myNuke = 1;
  myCharge = 0;
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
