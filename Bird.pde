class Bird extends Agent
{
  float posx, posy, speed;
  void fall() {posy+=speed; speed+=0.4;}
  void flap() {speed = -8;}
  void display()
  {
    //if(alive) fill(yellow); else fill(100);
    
    if(alive) ellipse(posx,posy,50,50);
  }
  
  Bird()
  {
    super();
    reset();
  }
  
  
  @Override
  float[] getInput()
  {
    return new float[] {
      speed/-50,
      posy/height,
      pillars.pillarList.peek().h/height,
      pillars.pillarList.peek().posx/width,
    };
  }
  
  @Override
  void Do()
  {
    float[] output = think();
    if (output[0] > output[1]) flap();
  }
  
  @Override
  void reset()
  {
    speed = 0;
    posx = width/5.0;
    posy = height/4.0;
  }
}
