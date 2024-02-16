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
