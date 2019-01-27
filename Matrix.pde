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

  // Prodotto matrice-vettore
  public float[] times(float[] B) {
    if (this.col != B.length)
    {
      println(this.col);
      println(B.length);
      throw new RuntimeException("Illegal matrix dimensions.");
    }
    float[] C = new float[this.row];
    for (int i = 0; i < this.row; i++)
      for (int k = 0; k < this.col; k++)
        C[i] += (this.data[i][k] * B[k]);
    return C;
  }
}
