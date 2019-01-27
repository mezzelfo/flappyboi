abstract class Agent implements Comparable<Agent>
{ 
  private NN brain;
  public int score;
  public boolean alive;
  
  abstract float[] getInput();
  abstract void Do();
  abstract void reset();

  Agent(int[] NNStruct)
  {
    brain = new NN(NNStruct);
    resetAgent();
  }

  void resetAgent()
  {
    score = 0;
    alive = true;
  }
  
  @Override
    int compareTo(Agent o) {
    return o.score - score;
  }
  
  float[] think()
  {
    return brain.propagate(getInput());
  }
  
  void mixfrom(Agent A, Agent B)
  {
    brain.mixfrom(A.brain, B.brain);
  }
}
