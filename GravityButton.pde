class GravityButton extends GameButton
{
  public GravityButton()
  {
    myX = 230;
    myY = 140;
    myLenX = 80;
    myLenY = 20;
    myText = "Gravity";
  }
  public void myPurpose()
  {
    if(Grav == 0)
    {
      Grav = 0.001;
    } else
    {
      Grav = 0;
    }
  }
  public void show()
  {
   super.show();
   if(Grav == 0)
   {
     fill(250,0,0);
   } else
   {
     fill(0,250,0);
   }
   noStroke();
   ellipse(230,140,4,4);
  }
}
