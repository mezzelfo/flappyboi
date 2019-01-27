import java.util.Arrays; // For sorting population


<ImpAgent extends Agent> void getNewGen(ImpAgent[] oldGen, int num_survivors)
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
