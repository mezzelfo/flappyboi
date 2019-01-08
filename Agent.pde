import java.util.List;
import java.util.Collections;

float[] apply(float[][] mat, float[] v)
{
  if (mat[0].length != v.length) throw new RuntimeException("Errore dimensione moltiplicazione");
  float[] res = new float[mat.length];
  for (int i=0; i< mat.length; i++)
  {
    res[i] = 0;
    for (int j=0; j< v.length; j++) res[i] += mat[i][j]*v[j];
  }
  return res;
}


abstract class Agent implements Comparable<Agent>
{ 
  int score;
  boolean alive;
  
  Agent()
  {
    resetAgent();
    hidden = new float[outputN][inputN];
    for (int i=0; i< outputN; i++)
      {
        for (int j=0; j< inputN; j++)
        {
          hidden[i][j] = random(0,1);
        }
      }
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

  static final int inputN = 4;
  static final int outputN = 2;
  float[][] hidden;
  
  abstract float[] getInput();
  float[] think()
  {
    float[] input = getInput();
    return apply(hidden, input);
  }
  abstract void Do();
  
  abstract void reset();
}

void getNewGen(List<? extends Agent> oldGen, int num_survivors)
  {
    Collections.sort(oldGen);
    for (int indexSon=num_survivors; indexSon<oldGen.size(); indexSon++)
    {
      int indexDad = (int) random(num_survivors);
      int indexMom = (int) random(num_survivors);
      for (int i=0; i< Agent.outputN; i++)
      {
        for (int j=0; j< Agent.inputN; j++)
        {
          oldGen.get(indexSon).hidden[i][j] = random(1) < 0.5 ? oldGen.get(indexDad).hidden[i][j] : oldGen.get(indexMom).hidden[i][j];
        }
      }
    }
    for (int i=0; i<oldGen.size(); i++)
    {
      oldGen.get(i).resetAgent();
      oldGen.get(i).reset();
    }
  }
