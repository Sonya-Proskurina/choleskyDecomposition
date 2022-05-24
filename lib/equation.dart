import 'dart:math';

class Equation {
  Random random;
  late String op1;
  late String op2;
  late String op3;
  late String Ltext;
  late String LTtext;
  late String Atext;
  late String Btext;
  late String Xtext;
  late String Ytext;
  late String equation;

  late List<List<int>> A;
  late List<int> B;
  late List<List<int>> L;
  late List<List<int>> LT;
  late List<int> X;
  late List<int> Y;

  Equation({required this.random}) {
     equation ="";
    //Матрица L
     L = List.generate(3, (index) => List.generate(3, (index2){
      if (index2<=index) {
        return random.nextInt(10)+1;
      }
      else {
        return 0;
      }
    })
    );

    Ltext="";
     for (int i=0;i<3;i++) {
       Ltext+="| ";
       for (int j=0;j<3;j++) {
         Ltext+=L[i][j].toString();
         Ltext+=" ";
       }
       if (i!=1) {
         Ltext+="|\n";
       } else {
         Ltext+= "| = L\n";
       }
     }

    //Матрица L транспонированнная
     LT = List.generate(3, (index) => List.generate(3, (index) => 0));
    for (int i=0;i<3;i++) {
      for (int j=0;j<3;j++) {
        LT[i][j] =L[j][i];
      }
    }

     LTtext="";
     for (int i=0;i<3;i++) {
       LTtext+="| ";
       for (int j=0;j<3;j++) {
         LTtext+=LT[i][j].toString();
         LTtext+=" ";
       }
       if (i!=1) {
         LTtext+="|\n";
       } else {
         LTtext+= "| = L^T\n";
       }
     }

    //Матрица A
     A = multiplication(L,LT);

     Atext="";
     for (int i=0;i<3;i++) {
       Atext+="| ";
       for (int j=0;j<3;j++) {
         Atext+=A[i][j].toString();
         Atext+=" ";
       }
       if (i!=1) {
         Atext+="|\n";
       } else {
         Atext+= "| = A\n";
       }
     }

    // Матрица иксов, которые нужно будет найти
     X = List.generate(3, (index) => random.nextInt(10)+1);
     Xtext="|${X[0]}|\n|${X[1]}| = X\n|${X[1]}|\n";

     //Матрица В
     B = List.generate(3, (index)  {
      int b =0;
      for(int i = 0; i < 3; i++) {
        b+=X[i]*A[index][i];
      }
      return b;
    });

     Y = List.generate(3, (index) => 0);
     Y[0] = B[0]~/L[0][0];
     Y[1] = (B[1]-L[1][0]*Y[0])~/L[1][1];
     Y[2] = (B[2]-L[2][0]*Y[0]-L[2][1]*Y[1])~/L[2][2];

     Ytext = "|${Y[0]}|\n|${Y[1]}| = Y\n|${Y[2]}|\n";
     Btext="";
     for (int i=0;i<3;i++) {
       Btext+="| ";
       Btext+=B[i].toString();
       if (i!=1) {
         Btext+="|\n";
       } else {
         Btext+= "| = B\n";
       }
     }

    // print(L.toString());
    // print(LT.toString());
    // print(A.toString());
    // print(X.toString());
    // print(B.toString());

    for(int i = 0; i < 3; i++) {
      for(int j = 0; j < 2; j++) {
        equation+=A[i][j].toString()+"*x"+(j+1).toString()+" + ";
      }
      equation+=A[i][2].toString()+"*x3 = "+B[i].toString()+"\n";
    }

    op1 = "|${A[0][0]}| = "+A[0][0].toString()+" > 0\n";
    op2 = "|${A[0][0]} ${A[0][1]}|\n|${A[1][0]} ${A[1][1]}| = ${(A[0][0]*A[1][1]-A[0][1]*A[1][0]).toString()} > 0\n";
    op3 = "|${A[0][0]} ${A[0][1]} ${A[0][2]}|\n|${A[1][0]} ${A[1][1]} ${A[1][2]}| = "+opr3(A).toString()+" > 0\n|${A[2][0]} ${A[2][1]} ${A[2][2]}|\n";


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

  int opr3(List<List<int>> matrix){
    int op = matrix[0][0]*matrix[1][1]*matrix[2][2]+matrix[0][2]*matrix[1][0]*matrix[2][1]+matrix[2][0]*matrix[0][1]*matrix[1][2];
    op -= matrix[2][0]*matrix[1][1]*matrix[0][2]+matrix[0][0]*matrix[2][1]*matrix[1][2]+matrix[2][2]*matrix[1][0]*matrix[0][1];
    return op;
  }

}

