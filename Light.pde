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
    
    for (int x = 0; x < waldo.width; x=x+3 ) {
      for (int y = 0; y < waldo.height; y=y+3 ) {
  
        int loc = x + y*waldo.width;
  
        float r = red  (waldo.pixels[loc]);
        float g = green(waldo.pixels[loc]);
        float b = blue (waldo.pixels[loc]);
  
        float adjustBrightness = map(dist(x, y, lightX, lightY), 0, 200, 8, 0);
        r *= adjustBrightness;
        g *= adjustBrightness;
        b *= adjustBrightness;
  
        r = constrain(r, 0, 180);
        g = constrain(g, 0, 180);
        b = constrain(b, 0, 180);
  
        pixels[loc] = color(r,g,b);
      
      }
    }
  updatePixels();
  }

}
