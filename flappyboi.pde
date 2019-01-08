List<Bird> BirdPop;
PillarManager pillars;
int popsize = 200;
int generation = 0;
color yellow = color(255,200,0);
color green = color(100,200,0);
void setup()
{
  randomSeed(0);
  size(600,800);
  BirdPop = new ArrayList<Bird>(popsize);
  pillars = new PillarManager();
  for(int i=0; i<popsize; i++) BirdPop.add(new Bird());
} 
void draw()
{
  background(255);
  pillars.move();
  
  fill(yellow);
  for(Bird flappyboi : BirdPop)
  {
    
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
  
  int vivi = 0;
  for(Bird flappyboi : BirdPop) if (flappyboi.alive) vivi++;
  if(vivi == 0)
  {
    //Collections.sort(BirdPop);
    //for(Bird flappyboi : BirdPop) println("Morto. XP:",flappyboi.score);
    //noLoop();
    generation++;
    getNewGen(BirdPop,50);
    println("Generation:",generation);
    background(255);
    pillars = new PillarManager();
  }
  
}

void keyPressed()
{
  for(Bird flappyboi : BirdPop) flappyboi.flap();
}
