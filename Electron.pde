class Electron extends Body
{
  public Electron()
  {
  myNuke = 0.1;
  myCharge = -70;
  myMass = 500; 
  myX = mouseX;
  myY = mouseY; 
  myDiameter = 3;
  myVelocityX = startVelocityX; 
  myVelocityY = startVelocityY;
  }
  public void show()
  {
  noStroke();
  fill(50, 80, 196);
  super.show();
  } 
}
