class Bird extends Agent
{
  float posx, posy, speed;
  void fall() {posy+=speed; speed+=0.4;}
  void flap() {speed = -8;}
  void display() {if(alive) ellipse(posx,posy,50,50);}
  
  Bird(int[] NNStruct)
  {
    super(NNStruct);
    reset();
  }
  
  @Override
  float[] getInput()
  {
    return new float[] {
      pillars.pillarList.get(0).posx - posx,        //Distance to the next pillar
      speed,                                        //Bird velocity
      height - pillars.pillarList.get(0).h - posy,   //Distance to the bottom pillar
      height - pillars.pillarList.get(0).h - pillars.pillarList.get(0).a - posy
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
