class Button
{
  protected int myX, myY, myLenX, myLenY;
  protected String myText;
  public button()
  {
  }
  public button(int newX, int newY, int newLenX, int newLenY, String newText)
  {
    myX = newX;
    myY = newY;
    myLenX = newLenX;
    myLenY = newLenY;
    myText = newText;
  }
  public show()
  {
    fill(80);
    strokeWeight(2);
    stroke(220);
    rect(myX,myX,myLenX,myLenY);
    fill(150);
    text(myText,myX + (myLenX / 10), myY + (myLenY / 2));
  }
  public wasClicked()
  {
    if(((mouseX > myX) && (mouseX < myX + myLenX)) && ((mouseY > myY) && (mouseY < myY + myLenY)))
    {
      myPurpose();
    }
  }
  public myPurpose();
}
