PillarManager pillars;
Population BirdPop;
final int[] brainStruct = {4, 5, 2};
final int popsize = 100;
final int survivor = 10;
color yellow = color(255,200,0);
color green = color(100,200,0);

void setup()
{
  randomSeed(0);
  size(600,800);
  BirdPop = new Population(popsize);
  for(int i=0; i<BirdPop.pop.length; i++) BirdPop.pop[i] = new Bird(brainStruct);
  pillars = new PillarManager();
  
} 
void draw()
{
  background(255);
  pillars.move();
  
  fill(yellow);
  for(int i=0; i<BirdPop.pop.length; i++)
  {
    Bird flappyboi = (Bird)BirdPop.pop[i];
    
    //Check collision with only the heading pillar
    if (pillars.pillarList.peek().isSplatted(flappyboi))
    {
      flappyboi.alive = false;
    }else flappyboi.score++;
    
    flappyboi.fall();
    flappyboi.Do();

    flappyboi.display();
  }
  
  fill(green);
  pillars.display();
  
  if(BirdPop.isTimeToEvolve())
  {
    BirdPop.evolve(survivor);
    background(255);
    pillars = new PillarManager(); 
  }
}
