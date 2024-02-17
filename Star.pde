class Star extends Body
{
  public Star()
  {
  myCharge = 10;
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
