int nRed, nGreen, nBlue, setr, setg, setb;
 class Color {
    int red;
    int green;
    int blue;

   public Color(int setRed, int setGreen, int setBlue) {
     red = setRed;
     green = setGreen;
     blue = setBlue;
   }
   
   public void mkCol(int setr, int setg, int setb) {
     nRed = setr;
     nGreen = setg;
     nBlue = setb;
   }
}