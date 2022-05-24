import 'dart:math';

import 'package:cholesky_decomposition/equation.dart';

class Repository {
  Random random;
  Repository({required this.random});
  Equation getExample() {
      return Equation(random: random);
  }
}