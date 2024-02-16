class MenuButton extends GameButton
{
  public MenuButton()
  {
    myX = width - 50;
    myY = 10;
    myLenX = 50;
    myLenY = 20;
    myText = "Menu";
  }
  public void myPurpose()
  {
    isPaused = !isPaused;
  }
}
