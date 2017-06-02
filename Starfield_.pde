Star[] stars = new Star [1000];
float speed =1;
import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioInput input;
//the starting mode forthe game would be gamestate 0, which is why the gamestate is 1 while starting the game
float gamestate = 1;
float colour = 100;

void setup()
{
  //For a starfield there needs to be a square
  fullScreen(P3D);
  minim = new Minim(this);
  song = minim.loadFile ("Best of No Copyright Sounds  February 2015 - Gaming Mix  NCS PixelMusic.mp3");

  for (int i = 0; i <stars.length; i++)
  {
    stars[i] = new Star();
  }
}

void draw()
{
  //Black color for the space
  if (gamestate ==1)
  { 
    background(0);
    textSize(40);
    fill(255, 255, 255);
    //Different functions for the users to use!
    text("Instructions:-", 50, 100);
    textSize(30);
    text("Press the S key to start the starfield!", 50, 200);
    textSize(40);
    text("When the game starts:-", 50, 350);
    textSize(30);
    text("Press the UP arrow to increase the speed of the stars, make sure not to go too fast!", 50, 450);
    text("Press the DOWN arrow key to decrease the speed of the stars, if its gets too fast!", 50, 550);
    text("Press 1 or 0, to adjust the brigthess of the ball!", 50, 650);
    text("Press M to here music!", 50, 750);

    if (key == 's')
    {
      gamestate = 0;
    }
  }
  if (gamestate == 0)
  {
    background(0);
    //Translate from the center
    translate(width/2, height/2);
    for (int i = 0; i <stars.length; i++)
    {
      stars[i].bring();
      stars[i].show();
      stars[i].keyPressed();
    }
  }
}

void keyPressed()
{
  //This is for the user to adjust the speed of the ellipse moving
  if (keyCode== UP)
  {
    speed=speed+3;
  }
  if (keyCode== DOWN)
  {
    speed=speed-3;
  }
  //The user has the ability to choose whether he/she wants the song
  if (key == 'm'||key=='M')
  {
    song.play();
  }
}