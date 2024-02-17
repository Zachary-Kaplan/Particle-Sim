class MenuButton extends GameButton
{
  public MenuButton()
  {
    myX = 1000 - 50;
    myY = 10;
    myLenX = 50;
    myLenY = 20;
    myText = "Menu";
  }
  public void myPurpose()
  {
    isPaused = !isPaused;
    menuOpened = ! menuOpened;
  }
}
