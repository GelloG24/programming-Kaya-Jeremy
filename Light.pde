class Light{
  float lightX;
  float lightY;
  
  Light(float xPosition, float yPosition){
   lightX = xPosition;
   lightY = yPosition;

  }
  
  void displayLight(float lightX, float lightY){
    loadPixels();
    waldo.loadPixels();
    
    for (int x = 0; x < waldo.width; x++ ) {
      for (int y = 0; y < waldo.height; y++ ) {
  
        int loc = x + y*waldo.width;
  
        float r = red  (waldo.pixels[loc]);
        float g = green(waldo.pixels[loc]);
        float b = blue (waldo.pixels[loc]);
  
        float distance = dist(x, y, lightX, lightY);
  
        float adjustBrightness = map(distance, 0, 50, 8, 0);
        r *= adjustBrightness;
        g *= adjustBrightness;
        b *= adjustBrightness;
  
        r = constrain(r, 0, 255);
        g = constrain(g, 0, 255);
        b = constrain(b, 0, 255);
  
        color c = color(r, g, b);
        pixels[loc] = c;
    }
   }
  updatePixels();
  }

}
