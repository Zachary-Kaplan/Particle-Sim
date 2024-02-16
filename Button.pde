class Button
{
  protected int myX, myY, myLenX, myLenY;
  protected String myText;
  button()
  {
  }
  button(int newX, int newY, int newLenX, int newLenY, String newText)
  {
    myX = newX;
    myY = newY;
    myLenX = newLenX;
    myLenY = newLenY;
    myText = newText;
  }
  show()
  {
    fill(80);
    strokeWeight(2);
    stroke(220);
    rect(myX,myX,myLenX,myLenY);
    fill(150);
    text(myText,myX + (myLenX / 10), myY + (myLenY / 2));
  }
}
