import 'dart:math';

import 'package:cholesky_decomposition/decision_widget.dart';
import 'package:cholesky_decomposition/equation.dart';
import 'package:cholesky_decomposition/repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(repository: Repository(random: Random()),));
}

class MyApp extends StatelessWidget {
  Repository repository;
  MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(repository: repository,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  Repository repository;
  late Equation equation;
  MyHomePage({Key? key, required this.repository}) : super(key: key){
    equation=repository.getExample();
  }
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool all = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(margin: const EdgeInsets.all(16),width: double.maxFinite,child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(widget.equation.equation),
              ElevatedButton(onPressed: () {
                setState(() {
                  widget.equation = widget.repository.getExample();
                });
              },  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.orange)), child: const Text("Сгенерировать уравнение")),
              const SizedBox(height: 8),
             ElevatedButton(onPressed: () {
                  setState(() {
                    all=!all;
                  });
                }, style: ButtonStyle(backgroundColor: all?MaterialStateProperty.all<Color>(Colors.black12):MaterialStateProperty.all<Color>(Colors.orange)),child: Text(!all?"Показать решение":"Скрыть решение")),
              const SizedBox(height: 8),
              Visibility(visible: all, child: DecisionWidget(equation: widget.equation)),
            ],
          )),
      ),
    );
  }
}
