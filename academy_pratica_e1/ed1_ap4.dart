import 'dart:math';

void main() {
  
  final random = Random();
  
  final valor1 = 1 + random.nextInt(100);
  final valor2 = 1 + random.nextInt(100);
  final resultado = valor1 / valor2;
  final parteInteira = resultado.floor();
  final parteDecimal = (resultado.floor() - resultado).abs();
  
  print("Valor A= $valor1");
  print("Valor B= $valor2");
  print("Resultado= $resultado");
  print("Parte inteira do resultado= $parteInteira");
  print("Parte decimal do resultado= $parteDecimal");
  // ...
}