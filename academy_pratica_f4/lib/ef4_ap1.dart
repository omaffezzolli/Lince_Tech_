import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Cores',
      home: ColorListScreen(),
    );
  }
}

class ColorListScreen extends StatelessWidget {
  final List<ColorData> colors = [
    ColorData(name: "Vermelho", color: Colors.red),
    ColorData(name: "Azul", color: Colors.blue),
    ColorData(name: "Verde", color: Colors.green),
    ColorData(name: "Amarelo", color: Colors.yellow),
    ColorData(name: "Roxo", color: Colors.purple),
    ColorData(name: "Laranja", color: Colors.orange),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Cores'),
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          final colorData = colors[index];
          return ListTile(
            title: Text(colorData.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ColorDetailScreen(colorData: colorData),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ColorData {
  final String name;
  final Color color;

  ColorData({required this.name, required this.color});
}

class ColorDetailScreen extends StatelessWidget {
  final ColorData colorData;

  ColorDetailScreen({required this.colorData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Cor'),
        backgroundColor: colorData.color,
      ),
      body: Center(
        child: Text(
          colorData.name,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
      backgroundColor: colorData.color,
    );
  }
}
