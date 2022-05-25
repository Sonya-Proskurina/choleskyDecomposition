import 'package:cholesky_decomposition/equation.dart';
import 'package:flutter/cupertino.dart';

class DecisionWidget extends StatelessWidget {
  Equation equation;
  DecisionWidget({Key? key, required this.equation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Проверим условия:\n", style: TextStyle(fontWeight: FontWeight.bold),),
        const Text("-Матрица симметричная\n",style: TextStyle(fontWeight: FontWeight.bold)),
        const Text("-Матрица положительно-определенная\n",style: TextStyle(fontWeight: FontWeight.bold)),
        Text(equation.op1),
        Text(equation.op2),
        Text(equation.op3),
        const Text("Условия выполняются, значит, можно использовать метод Холецкого\n", style: TextStyle(fontWeight: FontWeight.bold)),
        Text(equation.Atext),
        Text(equation.Btext),
        const Text("A = L * L^T\n"),
        const Text("|l11  0     0 |\n|l21 l22   0 | = L\n|l31 l32 l33|\n"),
        Text("l11 = (a11)^0.5 = "+equation.L[0][0].toString()+"\n"),
        Text("l22 = (a22 - (l21)^2 )^0.5 = "+equation.L[1][1].toString()+"\n"),
        Text("l33 = (a33 - (l32)^2 - (l31)^2 )^0.5 = "+equation.L[2][2].toString()+"\n"),
        Text("l21 = a21/l11 = "+equation.L[1][0].toString()+"\n"),
        Text("l31 = a31/l11 = "+equation.L[2][0].toString()+"\n"),
        Text("l32 = (a32 - l31 * l21) / l22 = "+equation.L[2][1].toString()+"\n"),
        const Text("Матрица L найдена\n", style: TextStyle(fontWeight: FontWeight.bold),),
        Text(equation.Ltext),
        Text(equation.LTtext),
        const Text("L * Y = B, зная L и В, найдем Y\n",style: TextStyle(fontWeight: FontWeight.bold)),
        Text(equation.Ytext),
        const Text("Y = L^T * X, зная Y и L^T, найдем X\n",style: TextStyle(fontWeight: FontWeight.bold)),
        Text(equation.Xtext),
        Text("Ответ: x1 = ${equation.X[0]}; x2 = ${equation.X[1]}; x3 = ${equation.X[2]}\n", style: const TextStyle(fontWeight: FontWeight.bold),),

      ],
    );
  }
}
