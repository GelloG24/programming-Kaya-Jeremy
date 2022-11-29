class Word {
  
 Light light;
 String myWord;
 float xPosition, yPosition;
 float angle;
 float angleB = 0.0;
 Letter [] letters;
 Light[] lights;
 
 Word (String word, float xPosition, float yPosition) {
    myWord = word;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    letters = new Letter [myWord.length()];
    lights = new Light[myWord.length()];
    
    // split te word in an array of the individual letters
    for(int i = 0; i< letters.length; i++) {
      float ranX = random(20, width-20);
      float ranY = random(20,height-20);
      letters[i] = new Letter (myWord.charAt(i), ranX, ranY);
      lights[i] = new Light(ranX, ranY);
    }
 }
 
 void drawWord(){
   fill(200,10,200);
   text(myWord, xPosition, yPosition);
 }
 
 
 void drawLetters(){
   for(int i = 0; i< letters.length; i++) {
      letters[i].drawLetter();
    } 
 }
 
 void dragLetters(){
   float lastX;
   float lastY;
   for (int i = letters.length-1; i >= 0 ; i--){ //iterates through the array of letters starting from the last one
     if(i == letters.length-1){ //only takes mouse input for first one
        lastX = mouseX;
        lastY = mouseY;
     } else { //takes the position of the last letter
       lastX = letters[i+1].getX();
       lastY = letters[i+1].getY();
     }
    float dx = lastX - letters[i].getX(); //calculates difference between last x and new x
    float dy = lastY - letters[i].getY();
    angleB = atan2(dy, dx);  //returns the angle
    xPosition = lastX - (cos(angleB) * 20); 
    yPosition = lastY - (sin(angleB) * 20);
        
    lights[i].displayLight(xPosition, yPosition);
    letters[i].drawLetterTwo(xPosition, yPosition, angleB); //updates letters w new positions
   }
 }
 
 
 
}
