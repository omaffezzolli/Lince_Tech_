import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color buttonAColor = const Color.fromARGB(255, 0, 0, 0);
  Color buttonBColor = const Color.fromARGB(255, 0, 0, 0);
  Color buttonCColor = const Color.fromARGB(255, 0, 0, 0);

  Color backgroundColor = darkBlue;

  String correctButton = "";
  int attemptsLeft = 2;

  @override
  void initState() {
    super.initState();
    generateCorrectButton();
  }

  void generateCorrectButton() {
    Random random = Random();
    int randomNumber = random.nextInt(3);

    setState(() {
      if (randomNumber == 0) {
        correctButton = 'A';
      } else if (randomNumber == 1) {
        correctButton = 'B';
      } else {
        correctButton = 'C';
      }
    });
  }

  void checkAnswer(String selectedButton) {
    setState(() {
      if (selectedButton == correctButton) {
        backgroundColor = Colors.green;
      } else {
        attemptsLeft--;
        if (attemptsLeft == 0) {
          backgroundColor = Colors.red;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => checkAnswer('A'),
                child: Text('A'),
                style: ElevatedButton.styleFrom(
                  primary: buttonAColor,
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => checkAnswer('B'),
                child: Text('B'),
                style: ElevatedButton.styleFrom(
                  primary: buttonBColor,
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () => checkAnswer('C'),
                child: Text('C'),
                style: ElevatedButton.styleFrom(
                  primary: buttonCColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Tentativas restantes: $attemptsLeft',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
