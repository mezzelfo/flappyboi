float[] activate(float[] layer)
{
  float[] output = new float[layer.length];
  for (int i = 0; i < layer.length; i++)
    output[i] = 1.0/(1+exp(-layer[i]));  // Sigmoid Function
  return output;
}

final class NN
{
  private final Matrix[] weights;
  public NN(int[] struct)
  {
    weights = new Matrix[struct.length-1];
    for (int i = 0; i < struct.length-1; i++)
    {
      weights[i] = new Matrix(struct[i+1], struct[i]); // Inverto perchè tratto gli input come vettori colonna
      weights[i].randomize(-1, 1);
    }
  }
  public float[] propagate(float[] input)
  {
    float[] layer = input;
    for (int i = 0; i < this.weights.length; i++)
    {
      layer = this.weights[i].times(layer);
      if (i!=this.weights.length-1) layer = activate(layer);
    }
    return layer;
  }
  
  void mixfrom(NN A, NN B)
  {
    for (int k = 0; k < this.weights.length; k++)
      for (int i = 0; i < this.weights[k].row; i++)
        for (int j = 0; j < this.weights[k].col; j++)
          this.weights[k].data[i][j] = random(1) < 0.5 ? A.weights[k].data[i][j] : B.weights[k].data[i][j];
  }
}
