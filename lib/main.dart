import 'package:cholesky_decomposition/repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = Repository().getExample();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(margin: const EdgeInsets.all(16),child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            const SizedBox(height: 8),
            ElevatedButton(onPressed: () {
              setState(() {
                text = Repository().getExample();
              });
            }, child: const Text("Сгенерировать уравнение"))
          ],
        )),
    );
  }
}
