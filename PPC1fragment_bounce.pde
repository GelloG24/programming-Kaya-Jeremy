//Jeremy Lieferink S2996561
//Kaya Veen S2733099
//there are 2 states, 1 where each letter moves in different speed and directions.
//the other state makes you able to drag the words by moving your mouse.

Word word;
PImage waldo;

int state;  // this program has two states so far

void setup() {
  size(1024, 768);
  waldo = loadImage("waldo.png");
  //setting up font
  PFont myFont;
  myFont = loadFont("Rockwell-CondensedBold-40.vlw");
  textFont(myFont, 45);
  String[] lines = loadStrings("file.txt");
  String storeText = join(lines, " ");
  word = new Word(storeText, width/2, height/2);


  state = 0;  // the initial stat is 0
}

void draw() {

  image(waldo, 0, 0);
  switch(state) {      // here a case distinction using a switch instruction
  case 0:
     word.drawLetters();
    break;
  case 1:
   
    word.dragLetters();
  }
}

void mouseClicked() {  // super simple interaction:
    state = 1 - state;   // the state changes on mouse click
}
