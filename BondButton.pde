class BondButton extends GameButton
{ 
  public BondButton()
  {
    myX = 230;
    myY = 260;
    myLenX = 100;
    myLenY = 20;
    myText = "Particle Bond";
  }
  public void myPurpose()
  { 
    doesBond = !doesBond;

  }
  public void show()
  {
   super.show();
   if(!doesBond)
   {
     fill(250,0,0);
   } else
   {
     fill(0,250,0);
   }
   noStroke();
   ellipse(230,260,4,4);
  }
}
