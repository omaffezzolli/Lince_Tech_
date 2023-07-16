import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forma Aleatória',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomShapePage(),
    );
  }
}

class RandomShapePage extends StatefulWidget {
  @override
  _RandomShapePageState createState() => _RandomShapePageState();
}

class _RandomShapePageState extends State<RandomShapePage> {
  bool isCircle = true;
  Color randomColor = Colors.blue;

  void toggleShape() {
    setState(() {
      isCircle = !isCircle;
    });
  }

  void changeColor() {
    setState(() {
      final random = Random();
      randomColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forma Aleatória'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                color: randomColor,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                toggleShape();
              },
              child: Text(
                  isCircle ? 'Alterar para quadrado' : 'Alterar para círculo'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                changeColor();
              },
              child: Text('Alterar cor'),
            ),
          ],
        ),
      ),
    );
  }
}
