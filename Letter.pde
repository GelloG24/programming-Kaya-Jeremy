class Letter {
 float xRandom = random(0, width - 20), yRandom = random(50, height), xSpeed = random(.5, 4), ySpeed = random(.5, 4);;
 char myLetter;
 float xPosition, yPosition;
 color letterColor;
 Light light;
 
 Letter (char letter, float xPosition, float yPosition) {
    myLetter = letter;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    letterColor = color( int(random(150)), int(random(50, 100)), int(random(150,250)));
    light = new Light(xPosition, yPosition);
 }
 
 float getX(){
   //returns the current x position
  return xPosition; 
 }
 
 float getY(){
   // returns the current y position
   return yPosition;
 }
 
 void drawLetter(){
  
   fill(letterColor);
   text(myLetter, xRandom, yRandom); //places letters on random locations
   light.displayLight(xRandom,yRandom);
   
   xRandom = xRandom + xSpeed; //making the letters move across the screen
   yRandom = yRandom + ySpeed; // ----
   
   if((xRandom > width -20) || (xRandom < 0)){
   xSpeed = xSpeed * -1; //letters bouncing off the edge of the screen
   }
 
   if((yRandom > height) || (yRandom < 20)){
   ySpeed = ySpeed * -1; // ----
   }
 }
 
  void drawLetterTwo(float x, float y, float a){
   //draws letter based on the input of the method
   pushMatrix();
   translate(x, y);
   rotate(a);
   fill(letterColor);
   text(myLetter, 0,0);
   popMatrix();
   xPosition = x;
   yPosition = y;
 }
 
 
}
