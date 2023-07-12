import 'package:flutter/material.dart';
import 'dart:math';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

enum GameState {
  Initial,
  InProgress,
  Win,
  Lose,
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
  Color buttonAColor = Colors.white;
  Color buttonBColor = Colors.white;
  Color buttonCColor = Colors.white;

  Color backgroundColor = darkBlue;

  String correctButton = "";
  int attemptsLeft = 2;

  int victories = 0;
  int defeats = 0;

  GameState gameState = GameState.Initial;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    setState(() {
      buttonAColor = const Color.fromARGB(255, 0, 0, 0);
      buttonBColor = const Color.fromARGB(255, 0, 0, 0);
      buttonCColor = const Color.fromARGB(255, 14, 0, 0);
      attemptsLeft = 2;
      gameState = GameState.InProgress;
      generateCorrectButton();
    });
  }

  void generateCorrectButton() {
    Random random = Random();
    int randomNumber = random.nextInt(3);

    if (randomNumber == 0) {
      correctButton = 'A';
    } else if (randomNumber == 1) {
      correctButton = 'B';
    } else {
      correctButton = 'C';
    }
  }

  void checkAnswer(String selectedButton) {
    if (selectedButton == correctButton) {
      setState(() {
        gameState = GameState.Win;
        backgroundColor = Colors.green;
        victories++;
      });
    } else {
      setState(() {
        attemptsLeft--;
        if (attemptsLeft == 0) {
          gameState = GameState.Lose;
          backgroundColor = Colors.red;
          defeats++;
        }
      });
    }
  }

  Widget buildInitial() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Clique no botão para iniciar o jogo!',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: startGame,
          child: Text('Iniciar'),
        ),
      ],
    );
  }

  Widget buildInProgress() {
    return Column(
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
    );
  }

  Widget buildWin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Parabéns, você ganhou!',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: startGame,
          child: Text('Jogar Novamente'),
        ),
      ],
    );
  }

  Widget buildLose() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Você perdeu!',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: startGame,
          child: Text('Jogar Novamente'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget currentWidget;

    switch (gameState) {
      case GameState.Initial:
        currentWidget = buildInitial();
        break;
      case GameState.InProgress:
        currentWidget = buildInProgress();
        break;
      case GameState.Win:
        currentWidget = buildWin();
        break;
      case GameState.Lose:
        currentWidget = buildLose();
        break;
    }

    return Container(
      color: backgroundColor,
      child: currentWidget,
    );
  }
}
