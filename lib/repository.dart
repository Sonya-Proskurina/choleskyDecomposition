import 'dart:math';

class Repository {
  String getExample() {
    var random = Random();
    String text ="";

    //Матрица L
    var L = List.generate(3, (index) => List.generate(3, (index2){
      if (index2<=index) {
        return random.nextInt(100)+1;
      }
      else {
        return 0;
      }
    })
    );

    //Матрица L транспонированнная
    var LT = List.generate(3, (index) => List.generate(3, (index) => 0));
    for (int i=0;i<3;i++) {
      for (int j=0;j<3;j++) {
        LT[i][j] =L[j][i];
      }
      }

    //Матрица A
    var A = multiplication(L,LT);

    // Матрица иксов, которые нужно будет найти
    var X = List.generate(3, (index) => random.nextInt(100)+1);

    //Матрица В
    var B = List.generate(3, (index)  {
      int b =0;
      for(int i = 0; i < 3; i++) {
        b+=X[i]*A[index][i];
      }
      return b;
      });

    print(L.toString());
    print(LT.toString());
    print(A.toString());
    print(X.toString());
    print(B.toString());

    for(int i = 0; i < 3; i++) {
      for(int j = 0; j < 2; j++) {
        text+=A[i][j].toString()+"*x"+(j+1).toString()+" + ";
      }
      text+=A[i][2].toString()+"*x3 = "+B[i].toString()+"\n";
    }
      return text;
  }

  List<List<int>> multiplication(List<List<int>> m1, List<List<int>> m2) {
    var m3 = List.generate(3, (index) => List.generate(3, (index) => 0));

    for(int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        for (int k = 0; k < 3; k++) {
          m3[i][j] += m1[i][k] * m2[k][j];
        }
      }
    }
    return m3;
  }

}