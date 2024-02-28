class Neutron extends Body
{
  public Neutron()
  {
  myNuke = 100;
  myCharge = 0;
  myMass = 500; 
  myX = mouseX;
  myY = mouseY;
  myDiameter = 8;
  myVelocityX = startVelocityX; 
  myVelocityY = startVelocityY;
  }
  public void show()
  {
  noStroke();
  fill(219, 219, 213);
  super.show();
  } 
}
