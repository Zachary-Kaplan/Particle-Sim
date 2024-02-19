class DecayButton extends GameButton
{
  public DecayButton()
  {
    myX = 230;
    myY = 190;
    myLenX = 100;
    myLenY = 20;
    myText = "Energy Decay";
  }
  public void myPurpose()
  {
    doesDeacy = !doesDeacy;

  }
  public void show()
  {
   super.show();
   if(!doesDeacy)
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
