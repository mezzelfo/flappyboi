import java.util.Arrays; // For sorting population
class Population{

  public Agent[] pop;
  public int generation;
  
  Population(int s)
  {
    pop = new Agent[s];
  }
  public boolean isTimeToEvolve()
  {
    int alive = 0;
    for (int i = 0; i < pop.length; i++)
      if (pop[i].alive)
        alive++;
    return alive==0;
  }
  public void evolve(int survivor)
  {
    Arrays.sort(pop);
    generation++;
    println("Generation:", generation, "\t Best Score: ", BirdPop.pop[0].score);
    getNewGen(pop, survivor);
  }

  void getNewGen(Agent[] oldGen, int num_survivors)
  {
    Arrays.sort(oldGen);
    for (int indexSon=num_survivors; indexSon<oldGen.length; indexSon++)
    {
      int indexDad = (int) random(num_survivors);
      int indexMom = (int) random(num_survivors);
      oldGen[indexSon].mixfrom(oldGen[indexDad], oldGen[indexMom]);
    }
    for (int i=0; i<oldGen.length; i++)
    {
      oldGen[i].resetAgent();
      oldGen[i].reset();
    }
  }
}
