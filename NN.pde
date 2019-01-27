final public class Matrix
{
  private final int row;
  private final int col;
  private final float[][] data;

  // create M-by-N matrix of 0's
  public Matrix(int M, int N)
  {
    this.row = M;
    this.col = N;
    data = new float[M][N];
  }

  // Fill this matrix with random
  public void randomize(float low, float high)
  {
    for (int i = 0; i < row; i++)
      for (int j = 0; j < col; j++)
        this.data[i][j] = random(low, high);
  }

  // return C = A * B
  public float[] times(float[] B) {
    if (this.col != B.length) throw new RuntimeException("Illegal matrix dimensions.");
    float[] C = new float[this.row];
    for (int i = 0; i < this.row; i++)
      for (int k = 0; k < this.col; k++)
        C[i] += (this.data[i][k] * B[k]);
    return C;
  }
}

float activationFunction(float t)
{
  return 1.0/(1+exp(-t));  // Sigmoid Function
}
float[] activate(float[] layer)
{
  float[] output = new float[layer.length];
  for (int i = 0; i < layer.length; i++)
    output[i] = activationFunction(layer[i]);
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
      weights[i] = new Matrix(struct[i], struct[i+1]);
      weights[i].randomize(0, 1);
    }
  }
  public float[] apply(float[] input)
  {
    float[] layer = input;
    for (int i = 0; i < weights.length; i++)
    {
      layer = weights[i].times(layer);
      if(i!=weights.length-1) layer = activate(layer);
    }
    return layer;
  }
}
