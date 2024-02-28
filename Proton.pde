class Proton extends Body
{
  public Proton()
  {
  myNuke = 10; 
  myCharge = 70;
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
  fill(210, 20, 20);
  super.show();
  } 
}
