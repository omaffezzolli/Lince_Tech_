import 'dart:math';

abstract class Calculadora {
  static int dobro(int numero) {
    return numero * 2;
  }
}

void main() {
  final random = Random();
  int numero = random.nextInt(10000);

  int dobroNumero = Calculadora.dobro(numero);

  print("O dobro do número $numero é: $dobroNumero");
}
