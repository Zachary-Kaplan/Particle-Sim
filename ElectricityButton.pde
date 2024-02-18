class ElectricityButton extends GameButton
{
  public ElectricityButton()
  {
    myX = 230;
    myY = 170;
    myLenX = 100;
    myLenY = 20;
    myText = "Electricity";
  }
  public void myPurpose()
  {
    if(Elec == 0)
    {
      Elec = 0.0001;
    } else
    {
      Elec = 0;
    }
  }
  public void show()
  {
   super.show();
   if(Elec == 0)
   {
     fill(250,0,0);
   } else
   {
     fill(0,250,0);
   }
   noStroke();
   ellipse(230,170,4,4);
  }
}
