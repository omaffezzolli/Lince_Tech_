import 'dart:math';

abstract class Forma {
  double calcularArea();
}

class Retangulo implements Forma {
  double base;
  double altura;

  Retangulo(this.base, this.altura) {
    if (base <= 0 || altura <= 0) {
      throw Exception('Dimensões inválidas. Informe apenas valores positivos maiores que zero.');
    }
  }
  
@override
  double calcularArea() {
    return base * altura;
  }
}

void main() {
  try {
    final random = Random();
    final base = random.nextInt(99).toDouble();
    final altura = random.nextInt(99).toDouble();

    final retangulo = Retangulo(base, altura);
    final area = retangulo.calcularArea();

    print('Área do retângulo: ${area.toStringAsFixed(2)}');
  } catch (e) {
    print('Exception: $e');
  }
}
