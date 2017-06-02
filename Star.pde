class Star {
  float x;
  float y;
  float z;
  Star() {
    //Stars x can have a random value between -width and the width and for y it will be from -height to the height. 
    x = random(-width, width);
    y = random(-height, height);
    //z is needed for the 3d aspect of the stars. 
    z = random(width);
  }


  void bring()
  {
    z=z-speed; 
    //When z=1 it would go all the way back and all the stars rest in the center of the screen
    if (z<1)
    {
      z=width;
      x = random(-width, width);
      y = random(-height, height);
    }
  }
  void show()
  {
    
    //In a starfield the stars start from the center and move faster, to do that you would divide the ratio of their distance from the center and the edge
    //Z is used to show the movement, forward and backward
    float movementx = map(x/z, 0, 1, 0, width);
    float movementy = map(y/z, 0, 1, 0, height);
    //the map function re-maps from one range to another - https://processing.org/reference/map_.html
    //the p variable sets the difference between the ones that are further away and those that are at the width of the screen. The ones that are closer to the width of the screen will be 16. 
    float p = map(z, 0, width, 20, 0); 

    //The size of the ellipse is set to 0 to 20. 
  
      ellipse(movementx, movementy, p, p);

    
  }
  void keyPressed()
  {
    fill(colour);
    if (key == '1')
    {
      colour = 255;
    }
    if (key=='0')
    {
      colour = 100;
    }
  }

}