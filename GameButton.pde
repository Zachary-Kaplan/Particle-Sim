class GameButton
{
  protected int myX, myY, myLenX, myLenY;
  protected String myText;
  public GameButton()
  {
  }
  //public GameButton(int newX, int newY, int newLenX, int newLenY, String newText)
  //{
    //myX = newX;
    //myY = newY;
    //myLenX = newLenX;
    //myLenY = newLenY;
    //myText = newText;
  //}
  public void show()
  {
    fill(150);
    text(myText,myX + (myLenX / 10), myY + (myLenY / 2));
    fill(80);
    strokeWeight(2);
    stroke(220);
    rect(myX,myY,myLenX,myLenY);
  }
  public boolean wasClicked()
  {
    if(((mouseX > myX) && (mouseX < myX + myLenX)) && ((mouseY > myY) && (mouseY < myY + myLenY)))
    {
      myPurpose();
      return true;
    }
    return false;
  }
  public void myPurpose()
  {}
}
