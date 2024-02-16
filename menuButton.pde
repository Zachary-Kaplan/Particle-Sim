public menuButton extends Button
{
  menuButton()
  {
    myX = width - 50;
    myY = 10;
    myLenX = 50;
    myLenY = 20;
    myText = "Menu";
  }
  myPurpose()
  {
    isPaused = !isPaused;
  }
}
