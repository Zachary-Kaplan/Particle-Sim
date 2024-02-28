class NuclearButton extends GameButton
{
  public NuclearButton()
  {
    myX = 230;
    myY = 230;
    myLenX = 100;
    myLenY = 20;
    myText = "Nuclear";
  } 
  public void myPurpose()
  {
    if(Nuke == 0)
    {
      Nuke = 0.01;
    } else
    {
      Nuke = 0;
    }
  }
  public void show()
  {
   super.show();
   if(Nuke == 0)
   {
     fill(250,0,0);
   } else
   {
     fill(0,250,0);
   }
   noStroke();
   ellipse(230,230,4,4);
  }
}
