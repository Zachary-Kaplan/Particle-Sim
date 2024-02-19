class DecayButton extends GameButton
{ 
  public DecayButton()
  {
    myX = 230;
    myY = 200;
    myLenX = 100;
    myLenY = 20;
    myText = "Energy Decay";
  }
  public void myPurpose()
  {
    doesDecay = !doesDecay;

  }
  public void show()
  {
   super.show();
   if(!doesDecay)
   {
     fill(250,0,0);
   } else
   {
     fill(0,250,0);
   }
   noStroke();
   ellipse(230,200,4,4);
  }
}
